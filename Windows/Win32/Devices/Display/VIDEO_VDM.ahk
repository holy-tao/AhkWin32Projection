#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_VDM extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    ProcessHandle{
        get {
            if(!this.HasProp("__ProcessHandle"))
                this.__ProcessHandle := HANDLE(0, this)
            return this.__ProcessHandle
        }
    }
}
