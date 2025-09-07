#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_IEPORTINFORMATION structure defines properties specific to an insert/eject port object.
 * @remarks
 * The 
  * <b>NTMS_IEPORTINFORMATION</b> structure is included in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_ieportinformation
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_IEPORTINFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Library port number.
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
    Content {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Maximum number of seconds the port is allowed to remain open before an operator request is issued. Valid values are between 0 and 65,535 seconds. This member is writable.
     * @type {Integer}
     */
    MaxExtendSecs {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Library that contains the port.
     * @type {Pointer<Guid>}
     */
    Library {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
