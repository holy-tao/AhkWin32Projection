#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_INPUT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYOUTPUTIDCOUNT_INPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_INPUT}
     */
    Input{
        get {
            if(!this.HasProp("__Input"))
                this.__Input := D3DAUTHENTICATEDCHANNEL_QUERY_INPUT(this.ptr + 0)
            return this.__Input
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    CryptoSessionHandle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
