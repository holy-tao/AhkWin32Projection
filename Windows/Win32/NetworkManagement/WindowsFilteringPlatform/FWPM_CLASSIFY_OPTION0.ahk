#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_VALUE0.ahk

/**
 * The FWPM_CLASSIFY_OPTION0 structure.
 * @remarks
 * The following table lists possible values for the members of a <b>FWPM_CLASSIFY_OPTION0</b> structure.
  * 
  * <table>
  * <tr>
  * <th><b>type</b></th>
  * <th><b>value</b></th>
  * </tr>
  * <tr>
  * <td>FWP_CLASSIFY_OPTION_MULTICAST_STATE</td>
  * <td>
  * <ul>
  * <li>FWP_OPTION_VALUE_ALLOW_MULTICAST_STATE Allow link-local multicast state creation on outbound traffic
  * 
  * </li>
  * <li>FWP_OPTION_VALUE_DENY_MULTICAST_STATE  Do not allow link-local multicast state creation on outbound traffic
  * 
  * </li>
  * <li>FWP_OPTION_VALUE_ALLOW_GLOBAL_MULTICAST_STATE Allow global multicast state creation on outbound traffic
  * 
  * </li>
  * </ul>
  * </td>
  * </tr>
  * <tr>
  * <td>FWP_CLASSIFY_OPTION_LOOSE_SOURCE_MAPPING</td>
  * <td>
  * <ul>
  * <li>FWP_OPTION_VALUE_ENABLE_LOOSE_SOURCE Enable loose source mapping
  * 
  * </li>
  * <li>FWP_OPTION_VALUE_DISABLE_LOOSE_SOURCE Disable loose source mapping
  * 
  * </li>
  * </ul>
  * </td>
  * </tr>
  * <tr>
  * <td>FWP_CLASSIFY_OPTION_UNICAST_LIFETIME</td>
  * <td>
  * <ul>
  * <li>Any FWP_UINT32</li>
  * </ul>
  * </td>
  * </tr>
  * <tr>
  * <td>FWP_CLASSIFY_OPTION_MCAST_BCAST_LIFETIME</td>
  * <td>
  * <ul>
  * <li>Any FWP_UINT32</li>
  * </ul>
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * <b>FWPM_CLASSIFY_OPTION0</b> is a specific implementation of FWPM_CLASSIFY_OPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_classify_option0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CLASSIFY_OPTION0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An [FWP_CLASSIFY_OPTION_TYPE](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_classify_option_type) value.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0) structure.
     * @type {FWP_VALUE0}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := FWP_VALUE0(this.ptr + 8)
            return this.__value
        }
    }
}
