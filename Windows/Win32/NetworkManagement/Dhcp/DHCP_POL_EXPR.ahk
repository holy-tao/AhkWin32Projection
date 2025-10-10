#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_POL_EXP structure defines a DHCP server policy expression.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_pol_expr
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POL_EXPR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Integer that specifies the expression index that corresponds to this constituent condition.
     * @type {Integer}
     */
    ParentExpr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_logic_oper">DHCP_POL_LOGIC_OPER</a> enumeration that specifies how the results of the constituent conditions and sub-expressions must be grouped to evaluate this expression.
     * @type {Integer}
     */
    Operator {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
