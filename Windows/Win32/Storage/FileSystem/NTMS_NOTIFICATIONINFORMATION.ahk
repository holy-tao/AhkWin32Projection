#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_NOTIFICATIONINFORMATION structure defines an object and operation that occurred in the RSM database.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_notificationinformation
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_NOTIFICATIONINFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwOperation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Object Identifier.
     * @type {Pointer<Guid>}
     */
    ObjectId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
