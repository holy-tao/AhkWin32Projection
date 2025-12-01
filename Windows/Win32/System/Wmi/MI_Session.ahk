#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An object that is associated with a destination and has a set of credentials and options associated with it. .
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_session
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Session extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * For internal use only.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * For internal use only.
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This is the function table for accessing carrying out 
     *                       operations on a destination machine, along with configuration of the session. Use the functions containing the MI_Session_ prefix to access this information.
     * @type {Pointer<MI_SessionFT>}
     */
    ft {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
