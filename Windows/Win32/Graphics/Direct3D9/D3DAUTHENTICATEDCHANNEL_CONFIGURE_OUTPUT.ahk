#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {D3D_OMAC}
     */
    omac{
        get {
            if(!this.HasProp("__omac"))
                this.__omac := D3D_OMAC(this.ptr + 0)
            return this.__omac
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    ConfigureType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {HANDLE}
     */
    hChannel{
        get {
            if(!this.HasProp("__hChannel"))
                this.__hChannel := HANDLE(this.ptr + 24)
            return this.__hChannel
        }
    }

    /**
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {HRESULT}
     */
    ReturnCode {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
