#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_POL_EXPR_ARRAY.ahk" { DHCP_POL_EXPR_ARRAY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_POL_COND_ARRAY.ahk" { DHCP_POL_COND_ARRAY }
#Import ".\DHCP_IP_RANGE_ARRAY.ahk" { DHCP_IP_RANGE_ARRAY }
#Import ".\DHCP_PROPERTY_ARRAY.ahk" { DHCP_PROPERTY_ARRAY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POLICY_EX {
    #StructPack 8

    PolicyName : PWSTR

    IsGlobalPolicy : BOOL

    Subnet : UInt32

    ProcessingOrder : UInt32

    Conditions : DHCP_POL_COND_ARRAY.Ptr

    Expressions : DHCP_POL_EXPR_ARRAY.Ptr

    Ranges : DHCP_IP_RANGE_ARRAY.Ptr

    Description : PWSTR

    Enabled : BOOL

    Properties : DHCP_PROPERTY_ARRAY.Ptr

}
