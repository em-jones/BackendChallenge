import { Router } from "react-router-dom";
import { RouterState } from "connected-react-router";
import { Action, Location } from 'history';
export type TaskId = number;

export type Task = {
    id: TaskId;
    name: string;
    details: string;
    prerequesiteTasks: TaskId[];

}

export type AppState = {
    tasks: Task[];
    router: RouterState
};

export type AppAction =
    | {type: Action}