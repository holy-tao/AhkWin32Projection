#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_IEDOORINFORMATION structure defines properties specific to an insert/eject door object.
 * @remarks
 * 
 * The 
 * <b>NTMS_IEDOORINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * If the <b>MaxOpenSecs</b> member is zero, an operator request to close the door is generated as soon as the door is open.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntmsapi/ns-ntmsapi-ntms_iedoorinformation
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_IEDOORINFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Number of the door in the library. Typically, libraries have one door.
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    State {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Maximum number of seconds the door is to remain open. Valid values are between 0-65,535 seconds This member is writable.
     * @type {Integer}
     */
    MaxOpenSecs {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Library that contains this door.
     * @type {Pointer<Guid>}
     */
    Library {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
