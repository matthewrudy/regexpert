module Regexpert
  module Format
    # This is taken from dm-more - http://github.com/sam/dm-more/tree/master/dm-validations/lib/dm-validations/formats/email.rb
    #     RFC2822 (No attribution reference available)
    #
    # doctest: email_address
    #   >> "MatthewRudyJacobs@gmail.com" =~ Regexpert::Format::EmailAddress
    #   => 0
    #
    #   >> "dev@" =~ Regexpert::Format::EmailAddress
    #   => nil
    #
    EmailAddress = begin
      alpha = "a-zA-Z"
      digit = "0-9"
      atext = "[#{alpha}#{digit}\!\#\$\%\&\'\*+\/\=\?\^\_\`\{\|\}\~\-]"
      dot_atom_text = "#{atext}+([.]#{atext}*)*"
      dot_atom = "#{dot_atom_text}"
      qtext = '[^\\x0d\\x22\\x5c\\x80-\\xff]'
      text = "[\\x01-\\x09\\x11\\x12\\x14-\\x7f]"
      quoted_pair = "(\\x5c#{text})"
      qcontent = "(?:#{qtext}|#{quoted_pair})"
      quoted_string = "[\"]#{qcontent}+[\"]"
      atom = "#{atext}+"
      word = "(?:#{atom}|#{quoted_string})"
      obs_local_part = "#{word}([.]#{word})*"
      local_part = "(?:#{dot_atom}|#{quoted_string}|#{obs_local_part})"
      no_ws_ctl = "\\x01-\\x08\\x11\\x12\\x14-\\x1f\\x7f"
      dtext = "[#{no_ws_ctl}\\x21-\\x5a\\x5e-\\x7e]"
      dcontent = "(?:#{dtext}|#{quoted_pair})"
      domain_literal = "\\[#{dcontent}+\\]"
      obs_domain = "#{atom}([.]#{atom})*"
      domain = "(?:#{dot_atom}|#{domain_literal}|#{obs_domain})"
      addr_spec = "#{local_part}\@#{domain}"
      pattern = /^#{addr_spec}$/
    end

    # This is taken from dm-more http://github.com/sam/dm-more/tree/master/dm-validations/lib/dm-validations/formats/url.rb
    #     Regex from http://www.igvita.com/2006/09/07/validating-url-in-ruby-on-rails/
    #
    # doctest: url # examples from Rails auto_link tests
    #   >> "http://www.rubyonrails.com/contact;new" =~ Regexpert::Format::Url
    #   => 0
    #   >> "http://maps.google.co.uk/maps?f=q&q=the+london+eye&ie=UTF8&ll=51.503373,-0.11939&spn=0.007052,0.012767&z=16&iwloc=A" =~ Regexpert::Format::Url
    #   => 0
    #   >> "http://en.wikipedia.org/wiki/Sprite_(computer_graphics)" =~ Regexpert::Format::Url
    #   => 0
    # TODO: think of a good example of a bad url
    Url = begin
      /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
    end
    
    # This is taken from Django.Contrib.Localflavor.uk
    #     The regular expression used is sourced from the schema for British Standard
    #     BS7666 address types: http://www.govtalk.gov.uk/gdsc/schemas/bs7666-v2-0.xsd
    # 
    # doctest: ukpostcode
    #   >> "GIR   0AA" =~ Regexpert::Format::UKPostcode # GIR 0AA is a special GIRO postcode
    #   => 0
    #   >> "AL40XB" =~ Regexpert::Format::UKPostcode
    #   => 0
    #   >> "CB4 1TL" =~ Regexpert::Format::UKPostcode
    #   => 0
    #
    #   >> "AL44 NOP" =~ Regexpert::Format::UKPostcode
    #   => nil
    #   >> "CB4-1TL" =~ Regexpert::Format::UKPostcode
    #   => nil
    #
    UKPostcode = begin
      outcode_pattern = '[A-PR-UWYZ]([0-9]{1,2}|([A-HIK-Y][0-9](|[0-9]|[ABEHMNPRVWXY]))|[0-9][A-HJKSTUW])'
      incode_pattern = '[0-9][ABD-HJLNP-UW-Z]{2}'
      postcode_regex = Regexp.new("^(GIR *0AA|#{outcode_pattern} *#{incode_pattern})$", Regexp::IGNORECASE)
    end
  end
end