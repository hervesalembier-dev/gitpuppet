node 'agent-front' {
  notify {'front':
  }

  include web::php
}

