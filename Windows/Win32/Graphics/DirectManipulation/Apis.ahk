#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DirectManipulation {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTMANIPULATION_KEYBOARDFOCUS => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTMANIPULATION_MOUSEFOCUS => 4294967293

    /**
     * @type {Guid}
     */
    static CLSID_VerticalIndicatorContent => Guid("{a10b5f17-afe0-4aa2-91e9-3e7001d2e6b4}")

    /**
     * @type {Guid}
     */
    static CLSID_HorizontalIndicatorContent => Guid("{e7d18cf5-3ec7-44d5-a76b-3770f3cf903d}")

    /**
     * @type {Guid}
     */
    static CLSID_VirtualViewportContent => Guid("{3206a19a-86f0-4cb4-a7f3-16e3b7e2d852}")

    /**
     * @type {Guid}
     */
    static CLSID_DragDropConfigurationBehavior => Guid("{09b01b3e-ba6c-454d-82e8-95e352329f23}")

    /**
     * @type {Guid}
     */
    static CLSID_AutoScrollBehavior => Guid("{26126a51-3c70-4c9a-aec2-948849eeb093}")

    /**
     * @type {Guid}
     */
    static CLSID_DeferContactService => Guid("{d7b67cf4-84bb-434e-86ae-6592bbc9abd9}")
;@endregion Constants

;@region Methods
;@endregion Methods
}
