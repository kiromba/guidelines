This way you can make rais app more "reacty" when using the react-rails gem. 
- you have to create routes in routes.rb
- you have to create a tag element with id react-wrapper wherever you want to use it
- you dont need to use helper react_component on the views

applications.js
-
```javascript
import React from "react";
import ReactDOM from "react-dom";
import App from "./App";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<App />, document.getElementById("react-wrapper"));
});
```


App.js
-
```javascript
import React, { Component } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import MasterContractForm from "../components/master_contracts/MasterContractForm";

class App extends Component {
  state = {};
  render() {
    return (
      <Router>
        <Switch>
          <Route
            exact
            path="/companies/:company_id/master_contracts/new"
            component={MasterContractForm}
          />
        </Switch>
      </Router>
    );
  }
}

export default App;
```

The path must have an exact match on routes.rb
