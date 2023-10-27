// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import Popover from './stimulus_popover'
application.register('popover', Popover)