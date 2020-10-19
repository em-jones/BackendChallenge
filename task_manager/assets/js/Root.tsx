import * as React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import { Provider } from 'react-redux';
import Header from './components/Header';
import HomePage from './pages';
import CounterPage from './pages/counter';
import FetchDataPage from './pages/fetch-data';
import { ConnectedRouter } from 'connected-react-router';
import { history } from './store/index';
const Root: React.FC = ({ store }) => (
  <>
    <Header />
    <Provider store={store}>
      <ConnectedRouter history={history}>
        <Switch>
          <Route exact path="/" component={HomePage} />
          <Route path="/fetch-data" component={FetchDataPage} />
        </Switch>
      </ConnectedRouter>
    </Provider>

  </>
);

export default Root;
