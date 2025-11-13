#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSATTRIBUTE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class VIDEOFORMAT_DX12 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSATTRIBUTE}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := KSATTRIBUTE(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    resourceLayout {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    resourceFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Guid>}
     */
    customLayout {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
