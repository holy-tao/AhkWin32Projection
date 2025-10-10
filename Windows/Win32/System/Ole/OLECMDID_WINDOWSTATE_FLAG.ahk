#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the window state.
 * @remarks
 * 
  * A value from this enumeration is passed as the <i>nCmdExecOpt</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-exec">IOleCommandTarget::Exec</a> in conjunction with passing the OLECMDID_WINDOWSTATECHANGED value of the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ne-docobj-olecmdid">OLECMDID</a> enumeration as the <i>nCmdID</i> parameter.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//docobj/ne-docobj-olecmdid_windowstate_flag
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMDID_WINDOWSTATE_FLAG{

    /**
     * The window is visible.
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_WINDOWSTATE_USERVISIBLE => 1

    /**
     * The window has focus.
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_WINDOWSTATE_ENABLED => 2

    /**
     * The window is visible and valid.
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_WINDOWSTATE_USERVISIBLE_VALID => 65536

    /**
     * The window has focus and is valid.
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_WINDOWSTATE_ENABLED_VALID => 131072
}
