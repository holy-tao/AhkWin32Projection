#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\SWbemRpnConst.ahk

/**
 * The SWbemRpnQueryToken structure represents the query tokens in a WMIQ_ANALYSIS_RPN_SEQUENCE type query. An example of a query token is the following:\_j &gt; 4.
 * @see https://docs.microsoft.com/windows/win32/api//wmiutils/ns-wmiutils-swbemrpnquerytoken
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class SWbemRpnQueryToken extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * Unused. Always 1.
     * @type {Integer}
     */
    m_uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type of token this instance represents.
     * @type {Integer}
     */
    m_uTokenType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If the <b>m_uTokenType</b> member is <b>WMIQ_RPN_TOKEN_EXPRESSION</b>, <b>m_uSubexpressionShape</b> bitmask value specifies the shape of the expression.
     * @type {Integer}
     */
    m_uSubexpressionShape {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    m_uOperator {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * If there are two property names in a token, <b>m_pRightIdent</b> is used to identify the right property name.
     * @type {Pointer<SWbemQueryQualifiedName>}
     */
    m_pRightIdent {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * If there are two property names in a token <b>m_pLeftIdent</b> is used to identify the left property name. If only one property name is present, it appears in this member.
     * @type {Pointer<SWbemQueryQualifiedName>}
     */
    m_pLeftIdent {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Apparent data type of the constant.
     * @type {Integer}
     */
    m_uConstApparentType {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Value of the first constant. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wmiutils/ns-wmiutils-tag_swbemrpnconst">SWbemRpnConst</a>.
     * @type {SWbemRpnConst}
     */
    m_Const{
        get {
            if(!this.HasProp("__m_Const"))
                this.__m_Const := SWbemRpnConst(this.ptr + 40)
            return this.__m_Const
        }
    }

    /**
     * Type of second constant.  The fields <b>m_uConst2ApparentType</b> and <b>m_uConst2</b> are used only for BETWEEN phrases.
     * @type {Integer}
     */
    m_uConst2ApparentType {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Value of the second constant. The fields <b>m_uConst2ApparentType</b> and <b>m_uConst2</b> are used only for BETWEEN phrases. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wmiutils/ns-wmiutils-tag_swbemrpnconst">SWbemRpnConst</a>.
     * @type {SWbemRpnConst}
     */
    m_Const2{
        get {
            if(!this.HasProp("__m_Const2"))
                this.__m_Const2 := SWbemRpnConst(this.ptr + 96)
            return this.__m_Const2
        }
    }

    /**
     * Specifies a function on the right of the operator in a WHERE clause. If there is no function on the right of the operator in this token, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszRightFunc{
        get {
            if(!this.HasProp("__m_pszRightFunc"))
                this.__m_pszRightFunc := PWSTR(this.ptr + 144)
            return this.__m_pszRightFunc
        }
    }

    /**
     * Specifies a function on the left of the operator in a WHERE clause. If there is no function on the left of the operator in this token, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszLeftFunc{
        get {
            if(!this.HasProp("__m_pszLeftFunc"))
                this.__m_pszLeftFunc := PWSTR(this.ptr + 152)
            return this.__m_pszLeftFunc
        }
    }
}
