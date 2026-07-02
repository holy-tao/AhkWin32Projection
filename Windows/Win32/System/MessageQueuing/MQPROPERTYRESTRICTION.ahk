#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\StructuredStorage\CAC.ahk" { CAC }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Com\StructuredStorage\VERSIONEDSTREAM.ahk" { VERSIONEDSTREAM }
#Import "..\Com\BLOB.ahk" { BLOB }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\StructuredStorage\CABSTRBLOB.ahk" { CABSTRBLOB }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\StructuredStorage\CACLSID.ahk" { CACLSID }
#Import "..\Com\StructuredStorage\CABSTR.ahk" { CABSTR }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\StructuredStorage\CADBL.ahk" { CADBL }
#Import "..\Com\StructuredStorage\CALPWSTR.ahk" { CALPWSTR }
#Import "..\Com\StructuredStorage\CAUB.ahk" { CAUB }
#Import "..\Com\StructuredStorage\CABOOL.ahk" { CABOOL }
#Import "..\Com\StructuredStorage\CACY.ahk" { CACY }
#Import "..\Com\StructuredStorage\BSTRBLOB.ahk" { BSTRBLOB }
#Import "..\Com\StructuredStorage\CAUH.ahk" { CAUH }
#Import "..\Com\StructuredStorage\CAFLT.ahk" { CAFLT }
#Import "..\Com\StructuredStorage\CAFILETIME.ahk" { CAFILETIME }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\Com\StructuredStorage\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import "..\Com\StructuredStorage\CAUI.ahk" { CAUI }
#Import "..\Com\StructuredStorage\CAH.ahk" { CAH }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\CLIPDATA.ahk" { CLIPDATA }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\Com\StructuredStorage\CACLIPDATA.ahk" { CACLIPDATA }
#Import "..\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Com\StructuredStorage\CASCODE.ahk" { CASCODE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\StructuredStorage\CAUL.ahk" { CAUL }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\Com\StructuredStorage\CADATE.ahk" { CADATE }
#Import "..\Com\StructuredStorage\CALPSTR.ahk" { CALPSTR }
#Import "..\Com\StructuredStorage\CAL.ahk" { CAL }
#Import "..\Com\StructuredStorage\CAI.ahk" { CAI }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQPROPERTYRESTRICTION {
    #StructPack 8

    rel : UInt32

    prop : UInt32

    prval : PROPVARIANT

}
