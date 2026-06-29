#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @architecture X64, Arm64
 */
class D3DAUTHENTICATEDCHANNEL_QUERYOUTPUTID_OUTPUT extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT}
     */
    Output {
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT(0, this)
            return this.__Output
        }
    }

    /**
     * @type {HANDLE}
     */
    DeviceHandle {
        get {
            if(!this.HasProp("__DeviceHandle"))
                this.__DeviceHandle := HANDLE(48, this)
            return this.__DeviceHandle
        }
    }

    /**
     * @type {HANDLE}
     */
    CryptoSessionHandle {
        get {
            if(!this.HasProp("__CryptoSessionHandle"))
                this.__CryptoSessionHandle := HANDLE(56, this)
            return this.__CryptoSessionHandle
        }
    }

    /**
     * @type {Integer}
     */
    OutputIDIndex {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    OutputID {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
