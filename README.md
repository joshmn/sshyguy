# SSHyGuy

A command-line tool to manage your SSH connections in a manner that's at least one magnitude better than `history | grep ssh`.

## Installation

Install it yourself as:

    $ gem install sshyguy
    
Then copy over a sample config file to `~/.sshyguy.json`:
    
    $ sshyguy --install
    
## Setup    

Edit your config file add servers.

```
{
  "hostname": "192.168.0.123",
  "port": "60301",
  "user": "deploy",
  "label": "Production",
  "shortcut": "production",
  "command": "",
  "options": ""
}
```

### Notes

If `command` is present (not blank/empty/nil), it will be used to spawn the SSH connection. Otherwise, it will be built with `ssh $user@$hostname -p $port $options`. 

## Usage

Feeling lazy? 

    $ sshyguy

Will pull up a prompt that allows you to select what server to SSH into:

    Select a server (Use ↑/↓ arrow or number (1-4) keys, press Enter to select)
    ‣ 1. Production (prod)
      2. Production Database (prod-db)
      3. Staging (staging)
      4. Staging Database (staging-db)

And then it will spawn an SSH connection so you can screw up production.

You can also get into Staging Database with just one line:

    $ sshyguy -s staging-dbs