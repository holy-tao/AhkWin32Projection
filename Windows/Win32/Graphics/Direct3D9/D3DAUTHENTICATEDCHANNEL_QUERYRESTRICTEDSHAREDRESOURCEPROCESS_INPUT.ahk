#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_INPUT.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryrestrictedsharedresourceprocess-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYRESTRICTEDSHAREDRESOURCEPROCESS_INPUT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_INPUT}
     */
    Input{
        get {
            if(!this.HasProp("__Input"))
                this.__Input := D3DAUTHENTICATEDCHANNEL_QUERY_INPUT(0, this)
            return this.__Input
        }
    }

    /**
     * @type {Integer}
     */
    ProcessIndex {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
