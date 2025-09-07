#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MONITOR_STATE structure is part of the resapi.h header used by Windows Clustering.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-monitor_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class MONITOR_STATE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    LastUpdate {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    State {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    ActiveResource {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    ResmonStop {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
