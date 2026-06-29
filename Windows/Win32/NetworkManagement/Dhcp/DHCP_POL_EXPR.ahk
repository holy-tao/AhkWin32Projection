#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_POL_LOGIC_OPER.ahk" { DHCP_POL_LOGIC_OPER }

/**
 * The DHCP_POL_EXP structure defines a DHCP server policy expression.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_expr
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POL_EXPR {
    #StructPack 4

    /**
     * Integer that specifies the expression index that corresponds to this constituent condition.
     */
    ParentExpr : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_logic_oper">DHCP_POL_LOGIC_OPER</a> enumeration that specifies how the results of the constituent conditions and sub-expressions must be grouped to evaluate this expression.
     */
    Operator : DHCP_POL_LOGIC_OPER

}
