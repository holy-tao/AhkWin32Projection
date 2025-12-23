#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSCAMERA_METADATA_ITEMHEADER.ahk
#Include .\KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_METADATA_DIGITALWINDOW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {KSCAMERA_METADATA_ITEMHEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := KSCAMERA_METADATA_ITEMHEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING}
     */
    Window{
        get {
            if(!this.HasProp("__Window"))
                this.__Window := KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING(8, this)
            return this.__Window
        }
    }
}
