#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The NTMS_NOTIFICATIONINFORMATION structure defines an object and operation that occurred in the RSM database.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_notificationinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NTMS_NOTIFICATIONINFORMATION extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwOperation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Object Identifier.
     * @type {Guid}
     */
    ObjectId {
        get {
            if(!this.HasProp("__ObjectId"))
                this.__ObjectId := Guid(4, this)
            return this.__ObjectId
        }
    }
}
