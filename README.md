# Example PocketBase deploy with Disco

- fork this repo into your own GitHub account
- ssh into a fresh Ubuntu 24.04 LTS machine
- on that server, run `curl -fsSL https://disco.cloud/install.sh | sh`
- follow the web URL
- as prompted, create a new GitHub app
- authorize the fork that you created of this repo
- in the web UI, create a new project with this fork, deploy
- go to "Run Command", and run (change the email and password!):

```bash
/pb/pocketbase superuser create you@example.com a-very-strong-passw0rd
```

- visit `https://(your-project-url)/_/` and login with the credentials you created
