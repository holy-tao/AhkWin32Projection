#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_CONDITION_VALUE0.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Is an enumeration template used for enumerating IKE/AuthIP security associations (SAs).
 * @remarks
 * <b>IKEEXT_SA_ENUM_TEMPLATE0</b> is a specific implementation of IKEEXT_SA_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_sa_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_SA_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Matches SAs whose local address is on the specified subnet. Must be of one of the following types.
     * 
     * <ul>
     * <li>FWP_UINT32</li>
     * <li>FWP_BYTE_ARRAY16_TYPE</li>
     * <li>FWP_V4_ADDR_MASK</li>
     * <li>FWP_V6_ADDR_MASK</li>
     * </ul>
     * See [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) for more information.
     * @type {FWP_CONDITION_VALUE0}
     */
    localSubNet{
        get {
            if(!this.HasProp("__localSubNet"))
                this.__localSubNet := FWP_CONDITION_VALUE0(this.ptr + 0)
            return this.__localSubNet
        }
    }

    /**
     * Matches SAs whose remote address is on the specified subnet. Must be of one of the following types.
     * 
     * <ul>
     * <li>FWP_UINT32</li>
     * <li>FWP_BYTE_ARRAY16_TYPE</li>
     * <li>FWP_V4_ADDR_MASK</li>
     * <li>FWP_V6_ADDR_MASK</li>
     * </ul>
     * See [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) for more information.
     * @type {FWP_CONDITION_VALUE0}
     */
    remoteSubNet{
        get {
            if(!this.HasProp("__remoteSubNet"))
                this.__remoteSubNet := FWP_CONDITION_VALUE0(this.ptr + 8)
            return this.__remoteSubNet
        }
    }

    /**
     * Matches SAs with a matching local main mode SHA thumbprint.  If none exist, this member will have a length of zero.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     * @type {FWP_BYTE_BLOB}
     */
    localMainModeCertHash{
        get {
            if(!this.HasProp("__localMainModeCertHash"))
                this.__localMainModeCertHash := FWP_BYTE_BLOB(this.ptr + 16)
            return this.__localMainModeCertHash
        }
    }
}
