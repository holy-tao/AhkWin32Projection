#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\StructuredStorage\CAUL.ahk" { CAUL }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\StructuredStorage\CADATE.ahk" { CADATE }
#Import "..\..\System\Com\StructuredStorage\CAFLT.ahk" { CAFLT }
#Import "..\..\System\Com\StructuredStorage\CABSTR.ahk" { CABSTR }
#Import "..\..\System\Com\StructuredStorage\CAFILETIME.ahk" { CAFILETIME }
#Import "..\..\System\Com\StructuredStorage\BSTRBLOB.ahk" { BSTRBLOB }
#Import "..\..\System\Com\BLOB.ahk" { BLOB }
#Import "..\..\System\Com\StructuredStorage\CALPWSTR.ahk" { CALPWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\System\Com\StructuredStorage\CLIPDATA.ahk" { CLIPDATA }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\System\Com\StructuredStorage\CAL.ahk" { CAL }
#Import "..\..\System\Com\StructuredStorage\CABSTRBLOB.ahk" { CABSTRBLOB }
#Import "..\..\System\Com\StructuredStorage\CAH.ahk" { CAH }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\CAC.ahk" { CAC }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\System\Com\StructuredStorage\CASCODE.ahk" { CASCODE }
#Import "..\..\System\Com\StructuredStorage\CADBL.ahk" { CADBL }
#Import "..\..\System\Com\StructuredStorage\CALPSTR.ahk" { CALPSTR }
#Import "..\..\System\Com\StructuredStorage\CAUH.ahk" { CAUH }
#Import "..\..\System\Com\StructuredStorage\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import "..\..\System\Com\StructuredStorage\CACLIPDATA.ahk" { CACLIPDATA }
#Import "..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\StructuredStorage\CAUB.ahk" { CAUB }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\..\System\Com\StructuredStorage\VERSIONEDSTREAM.ahk" { VERSIONEDSTREAM }
#Import "..\..\System\Com\StructuredStorage\CAI.ahk" { CAI }
#Import "..\..\System\Com\StructuredStorage\CACY.ahk" { CACY }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\StructuredStorage\CAUI.ahk" { CAUI }
#Import "..\..\System\Com\StructuredStorage\CACLSID.ahk" { CACLSID }
#Import "..\..\System\Com\StructuredStorage\CABOOL.ahk" { CABOOL }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct SENSOR_VALUE_PAIR {
    #StructPack 8

    Key : PROPERTYKEY

    Value : PROPVARIANT

}
