#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk

/**
 * Contains input data for a D3DAUTHENTICATEDCONFIGURE\_CRYPTOSESSION command.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configurecryptosession
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGURECRYPTOSESSION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
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
     * A handle to the DirectX Video Acceleration 2 (DXVA-2) decoder device.
     * @type {Pointer<Ptr>}
     */
    DXVA2DecodeHandle {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A handle to the cryptographic session.
     * @type {Pointer<Ptr>}
     */
    CryptoSessionHandle {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A handle to the Direct3D device.
     * @type {Pointer<Ptr>}
     */
    DeviceHandle {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
