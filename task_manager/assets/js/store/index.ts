import { createBrowserHistory } from 'history';
import { applyMiddleware, compose, createStore } from 'redux';
import {routerMiddleware} from 'connected-react-router';
import createRootReducer from './reducer';
import { AppState } from './types';

export const history = createBrowserHistory();

export default function(preloadedState: AppState) {
    return createStore(
        createRootReducer(history),
        preloadedState,
        compose(
            applyMiddleware(
                routerMiddleware(history)
            )
        )
    )
}