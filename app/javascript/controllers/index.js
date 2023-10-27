// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

import Popover from 'stimulus-popover'
application.register('popover', Popover)