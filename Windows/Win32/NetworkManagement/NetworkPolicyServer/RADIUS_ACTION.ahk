#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RADIUS_ACTION type enumerates the responses that a NPS Extension DLL can generate in response to an Access-Request.
 * @remarks
 * 
 * Use the values for this enumeration only as the actions for the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process">RadiusExtensionProcess</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_ex">RadiusExtensionProcessEx</a> functions.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//authif/ne-authif-radius_action
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_ACTION{

    /**
     * NPS continues to process the request. NPS also continues to call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process">RadiusExtensionProcess</a> in other Extension DLLs.
     * @type {Integer (Int32)}
     */
    static raContinue => 0

    /**
     * Return an Access-Reject packet. The Access-Request is declined. In this case, NPS does not call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process">RadiusExtensionProcess</a> in any other Extension DLLs.
     * @type {Integer (Int32)}
     */
    static raReject => 1

    /**
     * NPS accepts the Access-Request. NPS does not continue to call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process">RadiusExtensionProcess</a> in this case. However, it does continue to obtain authorizations for the user requesting access.
     * @type {Integer (Int32)}
     */
    static raAccept => 2
}
