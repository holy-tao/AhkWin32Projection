#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_INPUT.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains input data for a D3DAUTHENTICATEDQUERY\_CRYPTOSESSION query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-querycryptosession-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DAUTHENTICATEDCHANNEL_QUERYCRYPTOSESSION_INPUT extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_INPUT**](d3dauthenticatedchannel-query-input.md) structure that contains the GUID for the query and other data.
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_INPUT}
     */
    Input {
        get {
            if(!this.HasProp("__Input"))
                this.__Input := D3DAUTHENTICATEDCHANNEL_QUERY_INPUT(0, this)
            return this.__Input
        }
    }

    /**
     * A handle to a DirectX Video Acceleration 2 (DXVA-2) decoder device.
     * @type {HANDLE}
     */
    DXVA2DecodeHandle {
        get {
            if(!this.HasProp("__DXVA2DecodeHandle"))
                this.__DXVA2DecodeHandle := HANDLE(32, this)
            return this.__DXVA2DecodeHandle
        }
    }
}
