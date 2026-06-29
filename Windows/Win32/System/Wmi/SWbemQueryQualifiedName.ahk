#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SWbemQueryQualifiedName structure stores property names for the IWbemQuery::GetAnalysis method.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemqueryqualifiedname
 * @namespace Windows.Win32.System.Wmi
 */
export default struct SWbemQueryQualifiedName {
    #StructPack 8

    /**
     * Unused. Always 1 (one).
     */
    m_uVersion : UInt32

    /**
     * Unused. Always 1 (one).
     */
    m_uTokenType : UInt32

    /**
     * Number of elements in the list of names. For example, for the  "propName" property,  <b>m_uNameListSize</b> is 1 (one) and <b>m_ppszNameList</b> is "propName".
     */
    m_uNameListSize : UInt32

    /**
     * List of property names. For example, for the  "propName" property, <b>m_uNameListSize</b> is 1 (one) and <b>m_ppszNameList</b> is "propName".
     */
    m_ppszNameList : PWSTR.Ptr

    /**
     * Unused. Always <b>false</b>.
     */
    m_bArraysUsed : BOOL

    /**
     * Unused. Always <b>NULL</b>.
     */
    m_pbArrayElUsed : BOOL.Ptr

    /**
     * Unused. Always <b>NULL</b>.
     */
    m_puArrayIndex : IntPtr

}
