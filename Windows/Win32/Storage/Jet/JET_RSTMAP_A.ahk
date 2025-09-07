#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset ANSI
 */
class JET_RSTMAP_A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    szDatabaseName{
        get {
            if(!this.HasProp("__szDatabaseName"))
                this.__szDatabaseName := PSTR(this.ptr + 0)
            return this.__szDatabaseName
        }
    }

    /**
     * @type {PSTR}
     */
    szNewDatabaseName{
        get {
            if(!this.HasProp("__szNewDatabaseName"))
                this.__szNewDatabaseName := PSTR(this.ptr + 8)
            return this.__szNewDatabaseName
        }
    }
}
