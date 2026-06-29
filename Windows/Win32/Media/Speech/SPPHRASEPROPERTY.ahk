#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASEPROPERTY {
    #StructPack 8

    pszName : PWSTR

    ulId : UInt32

    pszValue : PWSTR

    vValue : VARIANT

    ulFirstElement : UInt32

    ulCountOfElements : UInt32

    pNextSibling : SPPHRASEPROPERTY.Ptr

    pFirstChild : SPPHRASEPROPERTY.Ptr

    SREngineConfidence : Float32

    Confidence : Int8

    static __New() {
        DefineProp(this.Prototype, 'bType', { type: Int8, offset: 8 })
        DefineProp(this.Prototype, 'bReserved', { type: Int8, offset: 9 })
        DefineProp(this.Prototype, 'usArrayIndex', { type: UInt16, offset: 10 })
        this.DeleteProp("__New")
    }
}
