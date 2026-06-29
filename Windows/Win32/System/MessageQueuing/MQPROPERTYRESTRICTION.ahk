#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\Com\BLOB.ahk
#Include ..\Com\StructuredStorage\CADATE.ahk
#Include ..\Com\StructuredStorage\CAH.ahk
#Include ..\Com\StructuredStorage\BSTRBLOB.ahk
#Include ..\Variant\VARENUM.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\CHAR.ahk
#Include ..\Com\CY.ahk
#Include ..\Com\StructuredStorage\CLIPDATA.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\Com\IStream.ahk
#Include ..\Com\StructuredStorage\CABSTRBLOB.ahk
#Include ..\Com\SAFEARRAY.ahk
#Include ..\Com\StructuredStorage\CAPROPVARIANT.ahk
#Include ..\Com\StructuredStorage\CACLIPDATA.ahk
#Include ..\Com\StructuredStorage\CAUB.ahk
#Include ..\Com\StructuredStorage\CACLSID.ahk
#Include ..\Com\StructuredStorage\CADBL.ahk
#Include ..\Com\StructuredStorage\CAFLT.ahk
#Include ..\Com\StructuredStorage\CAC.ahk
#Include ..\Com\StructuredStorage\CASCODE.ahk
#Include ..\Com\StructuredStorage\IStorage.ahk
#Include ..\Com\StructuredStorage\CALPSTR.ahk
#Include ..\Com\StructuredStorage\CABOOL.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\StructuredStorage\VERSIONEDSTREAM.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\StructuredStorage\CAI.ahk
#Include ..\Com\StructuredStorage\CAUL.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Com\StructuredStorage\CAUH.ahk
#Include ..\Com\StructuredStorage\CABSTR.ahk
#Include ..\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\Com\StructuredStorage\CAL.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Com\StructuredStorage\CAFILETIME.ahk
#Include ..\Com\StructuredStorage\CAUI.ahk
#Include ..\Com\StructuredStorage\CALPWSTR.ahk
#Include ..\Com\StructuredStorage\CACY.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
class MQPROPERTYRESTRICTION extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    rel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    prop {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PROPVARIANT}
     */
    prval {
        get {
            if(!this.HasProp("__prval"))
                this.__prval := PROPVARIANT(8, this)
            return this.__prval
        }
    }
}
