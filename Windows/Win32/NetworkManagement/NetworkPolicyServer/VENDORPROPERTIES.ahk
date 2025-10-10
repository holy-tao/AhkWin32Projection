#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the VENDORPROPERTIES enumeration type specify properties of objects in the vendors collection.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-vendorproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class VENDORPROPERTIES{

    /**
     * The SMI Network Management Private Enterprise Code assigned to this vendor by the Internet Assigned Numbers Authority (IANA).
     * @type {Integer (Int32)}
     */
    static PROPERTY_NAS_VENDOR_ID => 1024
}
