#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\Com\StructuredStorage\BSTRBLOB.ahk
#Include ..\Com\BLOB.ahk
#Include ..\Com\StructuredStorage\CAC.ahk
#Include ..\Com\StructuredStorage\CAUB.ahk
#Include ..\Com\StructuredStorage\CAI.ahk
#Include ..\Com\StructuredStorage\CAUI.ahk
#Include ..\Com\StructuredStorage\CAL.ahk
#Include ..\Com\StructuredStorage\CAUL.ahk
#Include ..\Com\StructuredStorage\CAH.ahk
#Include ..\Com\StructuredStorage\CAUH.ahk
#Include ..\Com\StructuredStorage\CAFLT.ahk
#Include ..\Com\StructuredStorage\CADBL.ahk
#Include ..\Com\StructuredStorage\CABOOL.ahk
#Include ..\Com\StructuredStorage\CASCODE.ahk
#Include ..\Com\StructuredStorage\CACY.ahk
#Include ..\Com\StructuredStorage\CADATE.ahk
#Include ..\Com\StructuredStorage\CAFILETIME.ahk
#Include ..\Com\StructuredStorage\CACLSID.ahk
#Include ..\Com\StructuredStorage\CACLIPDATA.ahk
#Include ..\Com\StructuredStorage\CABSTR.ahk
#Include ..\Com\StructuredStorage\CABSTRBLOB.ahk
#Include ..\Com\StructuredStorage\CALPSTR.ahk
#Include ..\Com\StructuredStorage\CALPWSTR.ahk
#Include ..\Com\StructuredStorage\CAPROPVARIANT.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Com\StructuredStorage\PROPVARIANT.ahk

/**
 * This structure is not implemented.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-search_column_properties
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SEARCH_COLUMN_PROPERTIES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a></b>
     * 
     * The name of the column referenced in the ISearchQueryHelper::WriteProperties methods pColumns property array.
     * @type {PROPVARIANT}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := PROPVARIANT(this.ptr + 0)
            return this.__Value
        }
    }

    /**
     * Type: <b>LCID</b>
     * 
     * The LCID of the column.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
