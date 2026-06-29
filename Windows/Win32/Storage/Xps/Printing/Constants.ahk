#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Xps.Printing
 */

;@region Constants

/**
 * @type {Guid}
 */
export global ID_DOCUMENTPACKAGETARGET_MSXPS := Guid("{9cae40a8-ded1-41c9-a9fd-d735ef33aeda}")

/**
 * @type {Guid}
 */
export global ID_DOCUMENTPACKAGETARGET_OPENXPS := Guid("{0056bb72-8c9c-4612-bd0f-93012a87099d}")

/**
 * @type {Guid}
 */
export global ID_DOCUMENTPACKAGETARGET_OPENXPS_WITH_3D := Guid("{63dbd720-8b14-4577-b074-7bb11b596d28}")
;@endregion Constants
