#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configurecryptosession
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
                this.__Parameters := D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT(0, this)
            return this.__Parameters
        }
    }

    /**
     * @type {HANDLE}
     */
    DXVA2DecodeHandle{
        get {
            if(!this.HasProp("__DXVA2DecodeHandle"))
                this.__DXVA2DecodeHandle := HANDLE(40, this)
            return this.__DXVA2DecodeHandle
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
     * @type {HANDLE}
     */
    DeviceHandle{
        get {
            if(!this.HasProp("__DeviceHandle"))
                this.__DeviceHandle := HANDLE(56, this)
            return this.__DeviceHandle
        }
    }
}
