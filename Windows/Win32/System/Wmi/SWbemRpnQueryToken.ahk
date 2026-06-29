#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SWbemQueryQualifiedName.ahk" { SWbemQueryQualifiedName }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SWbemRpnConst.ahk" { SWbemRpnConst }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SWbemRpnQueryToken structure represents the query tokens in a WMIQ_ANALYSIS_RPN_SEQUENCE type query. An example of a query token is the following:\_j &gt; 4.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemrpnquerytoken
 * @namespace Windows.Win32.System.Wmi
 */
export default struct SWbemRpnQueryToken {
    #StructPack 8

    /**
     * Unused. Always 1.
     */
    m_uVersion : UInt32

    /**
     * Type of token this instance represents.
     */
    m_uTokenType : UInt32

    /**
     * If the <b>m_uTokenType</b> member is <b>WMIQ_RPN_TOKEN_EXPRESSION</b>, <b>m_uSubexpressionShape</b> bitmask value specifies the shape of the expression.
     */
    m_uSubexpressionShape : UInt32

    m_uOperator : UInt32

    /**
     * If there are two property names in a token, <b>m_pRightIdent</b> is used to identify the right property name.
     */
    m_pRightIdent : SWbemQueryQualifiedName.Ptr

    /**
     * If there are two property names in a token <b>m_pLeftIdent</b> is used to identify the left property name. If only one property name is present, it appears in this member.
     */
    m_pLeftIdent : SWbemQueryQualifiedName.Ptr

    /**
     * Apparent data type of the constant.
     */
    m_uConstApparentType : UInt32

    /**
     * Value of the first constant. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemrpnquerytoken">SWbemRpnConst</a>.
     */
    m_Const : SWbemRpnConst

    /**
     * Type of second constant.  The fields <b>m_uConst2ApparentType</b> and <b>m_uConst2</b> are used only for BETWEEN phrases.
     */
    m_uConst2ApparentType : UInt32

    /**
     * Value of the second constant. The fields <b>m_uConst2ApparentType</b> and <b>m_uConst2</b> are used only for BETWEEN phrases. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemrpnquerytoken">SWbemRpnConst</a>.
     */
    m_Const2 : SWbemRpnConst

    /**
     * Specifies a function on the right of the operator in a WHERE clause. If there is no function on the right of the operator in this token, this field is <b>NULL</b>.
     */
    m_pszRightFunc : PWSTR

    /**
     * Specifies a function on the left of the operator in a WHERE clause. If there is no function on the left of the operator in this token, this field is <b>NULL</b>.
     */
    m_pszLeftFunc : PWSTR

}
