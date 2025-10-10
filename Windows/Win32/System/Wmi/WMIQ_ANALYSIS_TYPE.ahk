#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains constants used to specify the type of analysis to perform by using the GetAnalysis method.
 * @see https://docs.microsoft.com/windows/win32/api//wmiutils/ne-wmiutils-wmiq_analysis_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WMIQ_ANALYSIS_TYPE{

    /**
     * Used if the query has a SELECT clause. When this type of analysis is used,  <i>pAnalysis</i> points to an <a href="https://docs.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemrpnencodedquery">SWbemRpnEncodedQuery</a> structure.
     * @type {Integer (Int32)}
     */
    static WMIQ_ANALYSIS_RPN_SEQUENCE => 1

    /**
     * Used to return information about association type queries. When this type of analysis is used,  <i>pAnalysis</i> points to an <a href="https://docs.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemassocqueryinf">SWbemAssocQueryInf</a> structure.
     * @type {Integer (Int32)}
     */
    static WMIQ_ANALYSIS_ASSOC_QUERY => 2

    /**
     * Unused.  Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_ANALYSIS_PROP_ANALYSIS_MATRIX => 3

    /**
     * Used to return a text string that has the original query text. If this type of analysis is used,  <i>pAnalysis</i> points to a text string that contains the original query text.
 * 
 * You can use this parameter if  a parser object is passed to another method.
     * @type {Integer (Int32)}
     */
    static WMIQ_ANALYSIS_QUERY_TEXT => 4

    /**
     * Unused.  Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_ANALYSIS_RESERVED => 134217728
}
