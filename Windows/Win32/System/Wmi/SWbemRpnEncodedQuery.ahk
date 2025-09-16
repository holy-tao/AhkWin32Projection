#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SWbemRpnEncodedQuery structure contains information from the IWbemQuery::GetAnalysis method when you use the WMIQ_ANALYSIS_RPN_SEQUENCE analysis type. Not all the fields in the structure are used actively, because some are reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemrpnencodedquery
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class SWbemRpnEncodedQuery extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Unused.  Value is always 1.
     * @type {Integer}
     */
    m_uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Unused.  Value is always 0 (zero).
     * @type {Integer}
     */
    m_uTokenType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Unused.  Value is always 0 (zero).
     * @type {Integer}
     */
    m_uParsedFeatureMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Unused. Value is always 0 (zero).
     * @type {Integer}
     */
    m_uDetectedArraySize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Unused. Value is always <b>NULL</b>.
     * @type {Pointer<UInt32>}
     */
    m_puDetectedFeatures {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Number of elements listed in a SELECT clause. For example, in the statement <c>SELECT a,b,c FROM d</c>, <b>m_uSelectListSize</b> is the value 3 (a, b and c).
     * @type {Integer}
     */
    m_uSelectListSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Structure used to store property names. This field is used  with the  <b>m_uSelectListSize</b> field. For example, in the statement <c>SELECT a,b,c FROM d</c>, <b>m_uSelectListSize</b> is 3, and the <b>m_ppszNameList</b> field of the <b>m_ppSelectList</b> structure contains the strings "a", "b" and "c". For more information, see <a href="https://docs.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemqueryqualifiedname">SWbemQueryQualifiedName</a>.
     * @type {Pointer<SWbemQueryQualifiedName>}
     */
    m_ppSelectList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Bitmap used to indicate  the form of the FROM clause.
     * @type {Integer}
     */
    m_uFromTargetType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Optional FROM path. If not used this field is <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    m_pszOptionalFromPath {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Number of items in the FROM clause of the SELECT statement.  For example, in the statement, <c>SELECT * FROM  a, b</c>, the value of <b>m_uFromListSize</b> is 2.
     * @type {Integer}
     */
    m_uFromListSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Pointer to a list of strings. Each string is one element of the FROM clause of a SELECT statement.  For example, in the statement <c>SELECT * FROM a, b</c>, the list  contains the strings "a" and "b".
     * @type {Pointer<PWSTR>}
     */
    m_ppszFromList {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Number of tokens in the WHERE clause. For example, in the statement <c>SELECT  * FROM a, b WHERE c &lt; 1000 AND d ISA e</code>, the value of <b>m_uWhereClauseSize</b> is 2 (the phrases <code>c &lt; 1000</code> and <code>d ISA e</c>).
     * @type {Integer}
     */
    m_uWhereClauseSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemrpnquerytoken">SWbemRpnQueryToken</a>
     * <c>SELECT * FROM a, b WHERE c &lt; 1000 AND d ISA e</c>
     * <c>c &lt; 1000</c>
     * <c>d ISA e</c>
     * <c>AND</c>
     * @type {Pointer<SWbemRpnQueryToken>}
     */
    m_ppRpnWhereClause {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * If there is a WITHIN clause, this field indicates the polling interval. If there is a GROUP WITHIN  clause, this <b>m_dblWithinPolling</b> is unused.
     * @type {Float}
     */
    m_dblWithinPolling {
        get => NumGet(this, 96, "double")
        set => NumPut("double", value, this, 96)
    }

    /**
     * Used if there is  a GROUP WITHIN clause to indicate the interval over which to group results.
     * @type {Float}
     */
    m_dblWithinWindow {
        get => NumGet(this, 104, "double")
        set => NumPut("double", value, this, 104)
    }

    /**
     * 
     * @type {Integer}
     */
    m_uOrderByListSize {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * 
     * @type {Pointer<PWSTR>}
     */
    m_ppszOrderByList {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * 
     * @type {Pointer<UInt32>}
     */
    m_uOrderDirectionEl {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
