#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugProperty.ahk" { IDebugProperty }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DebugPropertyInfo {
    #StructPack 8

    m_dwValidFields : UInt32

    m_bstrName : BSTR

    m_bstrType : BSTR

    m_bstrValue : BSTR

    m_bstrFullName : BSTR

    m_dwAttrib : UInt32

    m_pDebugProp : IDebugProperty

}
