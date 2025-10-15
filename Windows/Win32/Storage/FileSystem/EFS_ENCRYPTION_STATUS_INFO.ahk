#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class EFS_ENCRYPTION_STATUS_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    bHasCurrentKey{
        get {
            if(!this.HasProp("__bHasCurrentKey"))
                this.__bHasCurrentKey := BOOL(this.ptr + 0)
            return this.__bHasCurrentKey
        }
    }

    /**
     * @type {Integer}
     */
    dwEncryptionError {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
