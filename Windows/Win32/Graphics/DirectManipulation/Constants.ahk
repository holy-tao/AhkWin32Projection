#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DIRECTMANIPULATION_KEYBOARDFOCUS := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global DIRECTMANIPULATION_MOUSEFOCUS := 4294967293

/**
 * @type {Guid}
 */
export global CLSID_VerticalIndicatorContent := Guid("{a10b5f17-afe0-4aa2-91e9-3e7001d2e6b4}")

/**
 * @type {Guid}
 */
export global CLSID_HorizontalIndicatorContent := Guid("{e7d18cf5-3ec7-44d5-a76b-3770f3cf903d}")

/**
 * @type {Guid}
 */
export global CLSID_VirtualViewportContent := Guid("{3206a19a-86f0-4cb4-a7f3-16e3b7e2d852}")

/**
 * @type {Guid}
 */
export global CLSID_DragDropConfigurationBehavior := Guid("{09b01b3e-ba6c-454d-82e8-95e352329f23}")

/**
 * @type {Guid}
 */
export global CLSID_AutoScrollBehavior := Guid("{26126a51-3c70-4c9a-aec2-948849eeb093}")

/**
 * @type {Guid}
 */
export global CLSID_DeferContactService := Guid("{d7b67cf4-84bb-434e-86ae-6592bbc9abd9}")
;@endregion Constants
