#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\StructuredStorage\CAI.ahk" { CAI }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\Com\StructuredStorage\CAUH.ahk" { CAUH }
#Import "..\Com\StructuredStorage\CADATE.ahk" { CADATE }
#Import "..\Com\StructuredStorage\CAFLT.ahk" { CAFLT }
#Import "..\Com\StructuredStorage\CAC.ahk" { CAC }
#Import "..\Com\BLOB.ahk" { BLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Com\StructuredStorage\CALPSTR.ahk" { CALPSTR }
#Import "..\Com\StructuredStorage\CADBL.ahk" { CADBL }
#Import "..\Com\StructuredStorage\CLIPDATA.ahk" { CLIPDATA }
#Import "..\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\StructuredStorage\CALPWSTR.ahk" { CALPWSTR }
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }
#Import "..\Com\StructuredStorage\CASCODE.ahk" { CASCODE }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\StructuredStorage\BSTRBLOB.ahk" { BSTRBLOB }
#Import "..\Com\StructuredStorage\VERSIONEDSTREAM.ahk" { VERSIONEDSTREAM }
#Import "..\Com\CY.ahk" { CY }
#Import "..\Com\StructuredStorage\CAUL.ahk" { CAUL }
#Import "..\Com\StructuredStorage\CAL.ahk" { CAL }
#Import "..\Com\StructuredStorage\CABOOL.ahk" { CABOOL }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\Com\StructuredStorage\CAUI.ahk" { CAUI }
#Import "..\Com\StructuredStorage\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import "..\Com\StructuredStorage\CAFILETIME.ahk" { CAFILETIME }
#Import "..\Com\StructuredStorage\CAUB.ahk" { CAUB }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\StructuredStorage\CACY.ahk" { CACY }
#Import "..\Com\StructuredStorage\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\Com\StructuredStorage\CACLSID.ahk" { CACLSID }
#Import "..\Com\StructuredStorage\CABSTR.ahk" { CABSTR }
#Import "..\Com\StructuredStorage\CAH.ahk" { CAH }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Com\StructuredStorage\CABSTRBLOB.ahk" { CABSTRBLOB }
#Import "..\Com\StructuredStorage\CACLIPDATA.ahk" { CACLIPDATA }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct PROPERTYRESTRICTION {
    #StructPack 8

    rel : UInt32

    prop : FULLPROPSPEC

    prval : PROPVARIANT

}
