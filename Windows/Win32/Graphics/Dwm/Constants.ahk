#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dwm
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DWM_BB_ENABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DWM_BB_BLURREGION := 2

/**
 * @type {Integer (UInt32)}
 */
export global DWM_BB_TRANSITIONONMAXIMIZED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DWMWA_COLOR_DEFAULT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global DWMWA_COLOR_NONE := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global DWM_CLOAKED_APP := 1

/**
 * @type {Integer (UInt32)}
 */
export global DWM_CLOAKED_SHELL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DWM_CLOAKED_INHERITED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DWM_TNP_RECTDESTINATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DWM_TNP_RECTSOURCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DWM_TNP_OPACITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global DWM_TNP_VISIBLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DWM_TNP_SOURCECLIENTAREAONLY := 16

/**
 * @type {Integer (Int32)}
 */
export global DWM_FRAME_DURATION_DEFAULT := -1

/**
 * @type {Integer (UInt32)}
 */
export global DWM_EC_DISABLECOMPOSITION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DWM_EC_ENABLECOMPOSITION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DWM_SIT_DISPLAYFRAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global c_DwmMaxQueuedBuffers := 8

/**
 * @type {Integer (UInt32)}
 */
export global c_DwmMaxMonitors := 16

/**
 * @type {Integer (UInt32)}
 */
export global c_DwmMaxAdapters := 16
;@endregion Constants
