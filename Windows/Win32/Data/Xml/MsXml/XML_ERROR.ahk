#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct XML_ERROR {
    #StructPack 8

    _nLine : UInt32

    _pchBuf : BSTR

    _cchBuf : UInt32

    _ich : UInt32

    _pszFound : BSTR

    _pszExpected : BSTR

    _reserved1 : UInt32

    _reserved2 : UInt32

}
