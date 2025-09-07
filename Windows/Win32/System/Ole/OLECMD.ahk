#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Associates command flags from the OLECMDF enumeration with a command identifier through a call to IOleCommandTarget::QueryStatus.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-olecmd
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMD extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A command identifier; taken from the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ne-docobj-olecmdid">OLECMDID</a> enumeration.
     * @type {Integer}
     */
    cmdID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags associated with <b>cmdID</b>; taken from the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ne-docobj-olecmdf">OLECMDF</a> enumeration.
     * @type {Integer}
     */
    cmdf {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
