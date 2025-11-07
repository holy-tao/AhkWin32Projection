#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RADIUS_EXTENSION_POINT enumeration type enumerates the possible points in the RADIUS request process when the RadiusExtensionProcess2 function can be called.
 * @remarks
 * 
 * The <b>repPoint</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_extension_control_block">RADIUS_EXTENSION_CONTROL_BLOCK</a> structure is of type 
 * <b>RADIUS_EXTENSION_POINT</b>.
 * 
 * See 
 * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-about-internet-authentication-service">About NPS Extensions</a> for a diagram that shows the request process.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//authif/ne-authif-radius_extension_point
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_EXTENSION_POINT{

    /**
     * Indicates that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a> function is called at the point in the request process where authentication occurs.
     * @type {Integer (Int32)}
     */
    static repAuthentication => 0

    /**
     * Indicates that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a> function is called at the point in the request process where authorization occurs.
     * @type {Integer (Int32)}
     */
    static repAuthorization => 1
}
