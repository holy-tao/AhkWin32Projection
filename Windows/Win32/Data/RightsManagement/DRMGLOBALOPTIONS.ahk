#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for specifying which protocol is used for the transport protocol and whether the server lockbox is used. This enumeration is used by the DRMSetGlobalOptions function.
 * @remarks
 * 
 * Applications cannot toggle between the WinHTTP and WinINet protocols.
 * 
 * WinINet cannot be used under the network service account. If an application will be run under the network service account, the application must specify the <b>DRMGLOBALOPTIONS_USE_WINHTTP</b> option.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msdrmdefs/ne-msdrmdefs-drmglobaloptions
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMGLOBALOPTIONS{

    /**
     * The WinHTTP protocol is used for the transport protocol. By default, the WinINet protocol is used.
     * @type {Integer (Int32)}
     */
    static DRMGLOBALOPTIONS_USE_WINHTTP => 0

    /**
     * The server lockbox is used. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/lockboxes">Lockboxes</a>.
     * @type {Integer (Int32)}
     */
    static DRMGLOBALOPTIONS_USE_SERVERSECURITYPROCESSOR => 1
}
