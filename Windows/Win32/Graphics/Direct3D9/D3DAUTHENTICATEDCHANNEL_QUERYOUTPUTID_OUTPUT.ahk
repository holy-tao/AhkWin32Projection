#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYOUTPUTID_OUTPUT extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT(0, this)
            return this.__Output
        }
    }

    /**
     * @type {HANDLE}
     */
    DeviceHandle{
        get {
            if(!this.HasProp("__DeviceHandle"))
                this.__DeviceHandle := HANDLE(40, this)
            return this.__DeviceHandle
        }
    }

    /**
     * @type {HANDLE}
     */
    CryptoSessionHandle{
        get {
            if(!this.HasProp("__CryptoSessionHandle"))
                this.__CryptoSessionHandle := HANDLE(48, this)
            return this.__CryptoSessionHandle
        }
    }

    /**
     * @type {Integer}
     */
    OutputIDIndex {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    OutputID {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
