#Requires AutoHotkey v2.0.0 64-bit

/**
 * Deprecated. Used by IBrowserService::SetNavigateState and IBrowserService::GetNavigateState to specify navigation states.
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/ne-shdeprecated-bnstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BNSTATE{

    /**
     * Indicates the normal state.
     * @type {Integer (Int32)}
     */
    static BNS_NORMAL => 0

    /**
     * A begin navigation event has occurred.
     * @type {Integer (Int32)}
     */
    static BNS_BEGIN_NAVIGATE => 1

    /**
     * The navigation event has occurred.
     * @type {Integer (Int32)}
     */
    static BNS_NAVIGATE => 2
}
