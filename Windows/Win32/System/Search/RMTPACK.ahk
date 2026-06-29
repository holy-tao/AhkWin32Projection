#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\ISequentialStream.ahk" { ISequentialStream }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct RMTPACK {
    #StructPack 8

    pISeqStream : ISequentialStream

    cbData : UInt32

    cBSTR : UInt32

    rgBSTR : BSTR.Ptr

    cVARIANT : UInt32

    rgVARIANT : VARIANT.Ptr

    cIDISPATCH : UInt32

    rgIDISPATCH : IDispatch.Ptr

    cIUNKNOWN : UInt32

    rgIUNKNOWN : IUnknown.Ptr

    cPROPVARIANT : UInt32

    rgPROPVARIANT : PROPVARIANT.Ptr

    cArray : UInt32

    rgArray : VARIANT.Ptr

}
