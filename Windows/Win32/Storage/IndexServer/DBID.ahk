#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DBID structure encapsulates various ways of identifying a database object.
 * @remarks
 * The <b>DBID</b> structure identifies the requested columns for a query. Each unique column is represented by a unique combination of GUID and number or GUID and name.
 * @see https://learn.microsoft.com/windows/win32/api/oledbguid/ns-oledbguid-dbid
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class DBID extends Win32Struct
{
    static sizeof => 20

    static packingSize => 2

    /**
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    pguid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    eKind {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszName {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ulPropid {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
