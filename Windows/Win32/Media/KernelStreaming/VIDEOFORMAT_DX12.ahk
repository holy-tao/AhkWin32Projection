#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSATTRIBUTE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class VIDEOFORMAT_DX12 extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {KSATTRIBUTE}
     */
    Header {
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
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    resourceFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Guid}
     */
    customLayout {
        get {
            if(!this.HasProp("__customLayout"))
                this.__customLayout := Guid(32, this)
            return this.__customLayout
        }
    }
}
