#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a set of destination options. Destination options are a set of configurations that define the way an operation communicates with the server.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_destinationoptions
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_DestinationOptions extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Used internally and must not be changed. Should be set to 0.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Used internally and must not be changed. Should be set to 0.
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This member is used internally, and it must not be changed.
     * @type {Pointer<MI_DestinationOptionsFT>}
     */
    ft {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
