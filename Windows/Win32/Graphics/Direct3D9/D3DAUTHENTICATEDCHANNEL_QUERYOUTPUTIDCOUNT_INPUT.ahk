#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_INPUT.ahk

/**
 * Contains input data for a D3DAUTHENTICATEDQUERY\_OUTPUTIDCOUNT query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryoutputidcount-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYOUTPUTIDCOUNT_INPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_INPUT**](d3dauthenticatedchannel-query-input.md) structure that contains the GUID for the query and other data.
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
     * A handle to the device.
     * @type {Pointer<Ptr>}
     */
    DeviceHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A handle to the cryptographic session.
     * @type {Pointer<Ptr>}
     */
    CryptoSessionHandle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
