#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SWbemQueryQualifiedName.ahk" { SWbemQueryQualifiedName }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SWbemRpnQueryToken.ahk" { SWbemRpnQueryToken }

/**
 * The SWbemRpnEncodedQuery structure contains information from the IWbemQuery::GetAnalysis method when you use the WMIQ_ANALYSIS_RPN_SEQUENCE analysis type. Not all the fields in the structure are used actively, because some are reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemrpnencodedquery
 * @namespace Windows.Win32.System.Wmi
 */
export default struct SWbemRpnEncodedQuery {
    #StructPack 8

    /**
     * Unused.  Value is always 1.
     */
    m_uVersion : UInt32

    /**
     * Unused.  Value is always 0 (zero).
     */
    m_uTokenType : UInt32

    /**
     * Unused.  Value is always 0 (zero).
     */
    m_uParsedFeatureMask : Int64

    /**
     * Unused. Value is always 0 (zero).
     */
    m_uDetectedArraySize : UInt32

    /**
     * Unused. Value is always <b>NULL</b>.
     */
    m_puDetectedFeatures : IntPtr

    /**
     * Number of elements listed in a SELECT clause. For example, in the statement <c>SELECT a,b,c FROM d</c>, <b>m_uSelectListSize</b> is the value 3 (a, b and c).
     */
    m_uSelectListSize : UInt32

    /**
     * Structure used to store property names. This field is used  with the  <b>m_uSelectListSize</b> field. For example, in the statement <c>SELECT a,b,c FROM d</c>, <b>m_uSelectListSize</b> is 3, and the <b>m_ppszNameList</b> field of the <b>m_ppSelectList</b> structure contains the strings "a", "b" and "c". For more information, see <a href="https://docs.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemqueryqualifiedname">SWbemQueryQualifiedName</a>.
     */
    m_ppSelectList : IntPtr

    /**
     * Bitmap used to indicate  the form of the FROM clause.
     */
    m_uFromTargetType : UInt32

    /**
     * Optional FROM path. If not used this field is <b>NULL</b>.
     */
    m_pszOptionalFromPath : PWSTR

    /**
     * Number of items in the FROM clause of the SELECT statement.  For example, in the statement, <c>SELECT * FROM  a, b</c>, the value of <b>m_uFromListSize</b> is 2.
     */
    m_uFromListSize : UInt32

    /**
     * Pointer to a list of strings. Each string is one element of the FROM clause of a SELECT statement.  For example, in the statement <c>SELECT * FROM a, b</c>, the list  contains the strings "a" and "b".
     */
    m_ppszFromList : PWSTR.Ptr

    /**
     * Number of tokens in the WHERE clause. For example, in the statement <c>SELECT  * FROM a, b WHERE c &lt; 1000 AND d ISA e</code>, the value of <b>m_uWhereClauseSize</b> is 2 (the phrases <code>c &lt; 1000</code> and <code>d ISA e</c>).
     */
    m_uWhereClauseSize : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemrpnquerytoken">SWbemRpnQueryToken</a>
     * <c>SELECT * FROM a, b WHERE c &lt; 1000 AND d ISA e</c>
     * <c>c &lt; 1000</c>
     * <c>d ISA e</c>
     * <c>AND</c>
     */
    m_ppRpnWhereClause : IntPtr

    /**
     * If there is a WITHIN clause, this field indicates the polling interval. If there is a GROUP WITHIN  clause, this <b>m_dblWithinPolling</b> is unused.
     */
    m_dblWithinPolling : Float64

    /**
     * Used if there is  a GROUP WITHIN clause to indicate the interval over which to group results.
     */
    m_dblWithinWindow : Float64

    m_uOrderByListSize : UInt32

    m_ppszOrderByList : PWSTR.Ptr

    m_uOrderDirectionEl : IntPtr

}
