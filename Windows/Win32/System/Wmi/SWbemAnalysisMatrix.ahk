#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct SWbemAnalysisMatrix {
    #StructPack 8

    m_uVersion : UInt32

    m_uMatrixType : UInt32

    m_pszProperty : PWSTR

    m_uPropertyType : UInt32

    m_uEntries : UInt32

    m_pValues : IntPtr

    m_pbTruthTable : BOOL.Ptr

}
