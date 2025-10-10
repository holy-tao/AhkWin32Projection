#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a template used for restricting the enumeration of IPsec security associations (SAs).
 * @remarks
 * 
  * <b>IPSEC_SA_ENUM_TEMPLATE0</b> is a specific implementation of IPSEC_SA_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Direction of the SA.
     * 
     * See [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction) for more information.
     * @type {Integer}
     */
    saDirection {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
