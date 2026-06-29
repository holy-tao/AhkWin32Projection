#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\StructuredStorage\CAUL.ahk" { CAUL }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\Com\StructuredStorage\CADATE.ahk" { CADATE }
#Import "..\Com\StructuredStorage\CAFLT.ahk" { CAFLT }
#Import "..\Com\StructuredStorage\CABSTR.ahk" { CABSTR }
#Import "..\Com\StructuredStorage\CAFILETIME.ahk" { CAFILETIME }
#Import "..\Com\StructuredStorage\BSTRBLOB.ahk" { BSTRBLOB }
#Import "..\Com\BLOB.ahk" { BLOB }
#Import "..\Com\StructuredStorage\CALPWSTR.ahk" { CALPWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Com\CY.ahk" { CY }
#Import "..\Com\StructuredStorage\CLIPDATA.ahk" { CLIPDATA }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\Com\StructuredStorage\CAL.ahk" { CAL }
#Import "..\Com\StructuredStorage\CABSTRBLOB.ahk" { CABSTRBLOB }
#Import "..\Com\StructuredStorage\CAH.ahk" { CAH }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\CAC.ahk" { CAC }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Com\StructuredStorage\CASCODE.ahk" { CASCODE }
#Import "..\Com\StructuredStorage\CADBL.ahk" { CADBL }
#Import "..\Com\StructuredStorage\CALPSTR.ahk" { CALPSTR }
#Import "..\Com\StructuredStorage\CAUH.ahk" { CAUH }
#Import "..\Com\StructuredStorage\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import "..\Com\StructuredStorage\CACLIPDATA.ahk" { CACLIPDATA }
#Import "..\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\StructuredStorage\CAUB.ahk" { CAUB }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\Com\StructuredStorage\VERSIONEDSTREAM.ahk" { VERSIONEDSTREAM }
#Import "..\Com\StructuredStorage\CAI.ahk" { CAI }
#Import "..\Com\StructuredStorage\CACY.ahk" { CACY }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\StructuredStorage\CAUI.ahk" { CAUI }
#Import "..\Com\StructuredStorage\CACLSID.ahk" { CACLSID }
#Import "..\Com\StructuredStorage\CABOOL.ahk" { CABOOL }

/**
 * This structure is not implemented.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-search_column_properties
 * @namespace Windows.Win32.System.Search
 */
export default struct SEARCH_COLUMN_PROPERTIES {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a></b>
     * 
     * The name of the column referenced in the ISearchQueryHelper::WriteProperties methods pColumns property array.
     */
    Value : PROPVARIANT

    /**
     * Type: <b>LCID</b>
     * 
     * The LCID of the column.
     */
    lcid : UInt32

}
