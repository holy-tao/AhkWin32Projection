#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_RSTMAP_W extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    szDatabaseName{
        get {
            if(!this.HasProp("__szDatabaseName"))
                this.__szDatabaseName := PWSTR(this.ptr + 0)
            return this.__szDatabaseName
        }
    }

    /**
     * @type {PWSTR}
     */
    szNewDatabaseName{
        get {
            if(!this.HasProp("__szNewDatabaseName"))
                this.__szNewDatabaseName := PWSTR(this.ptr + 8)
            return this.__szNewDatabaseName
        }
    }
}
