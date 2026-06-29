#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.Ribbon
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global UI_ALL_COMMANDS := 0

/**
 * @type {Integer (UInt32)}
 */
export global UI_COLLECTION_INVALIDINDEX := 4294967295

/**
 * @type {Guid}
 */
export global LIBID_UIRibbon := Guid("{942f35c2-e83b-45ef-b085-ac295dd63d5b}")
;@endregion Constants
