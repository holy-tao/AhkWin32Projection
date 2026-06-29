#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IWbemPath.ahk" { IWbemPath }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information from the IWbemQuery::GetAnalysis method when you use the WMIQ_ANALYSIS_ASSOC_QUERY analysis type.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemassocqueryinf
 * @namespace Windows.Win32.System.Wmi
 */
export default struct SWbemAssocQueryInf {
    #StructPack 8

    /**
     * Value must be 2.
     */
    m_uVersion : UInt32

    /**
     * Value must be 2.
     */
    m_uAnalysisType : UInt32

    /**
     * Bit values that indicate the features in a query.
     */
    m_uFeatureMask : UInt32

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmiutils/nn-wmiutils-iwbempath">IWbemPath</a> object.
     */
    m_pPath : IWbemPath

    /**
     * String representation of the object path used in the query.
     */
    m_pszPath : PWSTR

    /**
     * Text of the original query.
     */
    m_pszQueryText : PWSTR

    /**
     * String representation of the result class. If there is no result class, this field is <b>NULL</b>.
     */
    m_pszResultClass : PWSTR

    /**
     * String representation of the association class. If there is no result class, this field is <b>NULL</b>.
     */
    m_pszAssocClass : PWSTR

    /**
     * String representation of the role. If there is no role, this field is <b>NULL</b>.
     */
    m_pszRole : PWSTR

    /**
     * String representation of the result role. If there is no result role, this field is <b>NULL</b>.
     */
    m_pszResultRole : PWSTR

    /**
     * String representation of the required qualifier. If no qualifiers are required, this field is <b>NULL</b>.
     */
    m_pszRequiredQualifier : PWSTR

    /**
     * Pointer to a list of required association qualifiers.
     */
    m_pszRequiredAssocQualifier : PWSTR

}
