#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGURECRYPTOSESSION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT(this.ptr + 0)
            return this.__Parameters
        }
    }

    /**
     * @type {HANDLE}
     */
    DXVA2DecodeHandle{
        get {
            if(!this.HasProp("__DXVA2DecodeHandle"))
                this.__DXVA2DecodeHandle := HANDLE(this.ptr + 40)
            return this.__DXVA2DecodeHandle
        }
    }

    /**
     * @type {HANDLE}
     */
    CryptoSessionHandle{
        get {
            if(!this.HasProp("__CryptoSessionHandle"))
                this.__CryptoSessionHandle := HANDLE(this.ptr + 48)
            return this.__CryptoSessionHandle
        }
    }

    /**
     * @type {HANDLE}
     */
    DeviceHandle{
        get {
            if(!this.HasProp("__DeviceHandle"))
                this.__DeviceHandle := HANDLE(this.ptr + 56)
            return this.__DeviceHandle
        }
    }
}
