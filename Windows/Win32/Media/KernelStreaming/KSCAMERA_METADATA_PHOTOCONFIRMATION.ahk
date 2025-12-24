#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSCAMERA_METADATA_ITEMHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_METADATA_PHOTOCONFIRMATION extends Win32Struct
{
    static sizeof => 16

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
     * @type {Integer}
     */
    PhotoConfirmationIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
