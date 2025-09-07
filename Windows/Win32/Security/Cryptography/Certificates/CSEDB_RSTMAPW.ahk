#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CSEDB_RSTMAPW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszDatabaseName{
        get {
            if(!this.HasProp("__pwszDatabaseName"))
                this.__pwszDatabaseName := PWSTR(this.ptr + 0)
            return this.__pwszDatabaseName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszNewDatabaseName{
        get {
            if(!this.HasProp("__pwszNewDatabaseName"))
                this.__pwszNewDatabaseName := PWSTR(this.ptr + 8)
            return this.__pwszNewDatabaseName
        }
    }
}
