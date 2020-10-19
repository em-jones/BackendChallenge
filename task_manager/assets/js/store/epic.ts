import { combineEpics, ActionsObservable, Epic } from 'redux-observable';
import { combineReducers } from 'redux';
import { AppAction, AppState } from './types';
import { Action as HistoryAction } from 'history';

const navigateEpic: Epic<AppAction, HistoryAction, AppState> = (action$, state$) => action$.pipe(
    filter(action => action.type === '')
)

export const tasksEpic = combineEpics()