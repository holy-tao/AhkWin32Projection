#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-querydevicehandle-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYDEVICEHANDLE_OUTPUT extends Win32Struct
{
    static sizeof => 48

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
}
