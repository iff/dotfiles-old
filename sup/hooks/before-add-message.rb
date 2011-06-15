if not message.recipients.find{ |to|  /git@vger.kernel.org/ =~ to.email}.nil? or not message.recipients.find{ |cc|  /git@vger.kernel.org/ =~ cc.email}.nil? then
  message.add_label "git-ml"
  #holiday mode: put mls away
  #message.remove_label :inbox
end

if not message.recipients.find{ |to|  /sup-talk@rubyforge.org/ =~ to.email}.nil? or not message.recipients.find{ |cc|  /sup-talk@rubyforge.org/ =~ cc.email}.nil? then
  message.add_label "sup-ml"
  #holiday mode: put mls away
  #message.remove_label :inbox
end

if not message.recipients.find{ |to|  /mono-devel-list@lists.ximian.com/ =~ to.email}.nil? or not message.recipients.find{ |cc|  /mono-devel-list@lists.ximian.com/ =~ cc.email}.nil? then
  message.add_label "mono-ml"
  #holiday mode: put mls away
  message.remove_label :inbox
end

if not message.recipients.find{ |to|  /gentoo-announce@lists.gentoo.org/ =~ to.email}.nil? or not message.recipients.find{ |cc|  /gentoo-announce@lists.gentoo.org/ =~ cc.email}.nil? then
  message.add_label "glsa"
  #holiday mode: put mls away
  #message.remove_label :inbox
end
