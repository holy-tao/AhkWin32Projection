#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include .\DSCOLUMN.ahk

/**
 * The DSQUERYPARAMS structure contains query data used by the directory service query when searching the directory service.
 * @see https://learn.microsoft.com/windows/win32/api/dsquery/ns-dsquery-dsqueryparams
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSQUERYPARAMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the <b>DSQUERYPARAMS</b> structure. This member is used for versioning of the structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an instance handle used for extracting resources.
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(8, this)
            return this.__hInstance
        }
    }

    /**
     * Contains the offset, in bytes,  from the address of this structure to a null-terminated Unicode string that contains the  LDAP filter.
     * @type {Integer}
     */
    offsetQuery {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Contains the number of elements in the <b>aColumns</b> array.
     * @type {Integer}
     */
    iColumns {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsquery/ns-dsquery-dscolumn">DSCOLUMN</a> structures that contain the results of the query. The <b>iColumns</b> member specifies the number of elements in this array.
     * @type {Array<DSCOLUMN>}
     */
    aColumns{
        get {
            if(!this.HasProp("__aColumnsProxyArray"))
                this.__aColumnsProxyArray := Win32FixedArray(this.ptr + 32, 1, DSCOLUMN, "")
            return this.__aColumnsProxyArray
        }
    }
}
