#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of a single field in the Credential UI.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_state
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CREDENTIAL_PROVIDER_FIELD_STATE extends Win32Enum{

    /**
     * Do not show the field in any state. One example of this would be a password edit control that should not be displayed until the user authenticates a thumb print. Until the thumb print has been authenticated, the state of the password field would be <b>CPFS_HIDDEN</b>.
     * @type {Integer (Int32)}
     */
    static CPFS_HIDDEN => 0

    /**
     * Show the field when in the selected state.
     * @type {Integer (Int32)}
     */
    static CPFS_DISPLAY_IN_SELECTED_TILE => 1

    /**
     * Show the field when in the deselected state. This value is only valid for a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a> is set to <b>CPUS_CREDUI</b>.
     * @type {Integer (Int32)}
     */
    static CPFS_DISPLAY_IN_DESELECTED_TILE => 2

    /**
     * Show the field both when the credential tile is selected and when it is not selected.
     * @type {Integer (Int32)}
     */
    static CPFS_DISPLAY_IN_BOTH => 3
}
