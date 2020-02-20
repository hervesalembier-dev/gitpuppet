class muppets {

  if ${facts['networking']['hostname']} =~ /muppet/ 
  {
    if ${facts['networking']['ip'][-1]}.to_i % 2 == 0 
    {
      class { 'muppets::muppet':
        name => 'peggy'
      }
    }
    else 
    {
      class { 'muppets::muppet':
        name => 'kermit'
      }      
    }
  }
}
