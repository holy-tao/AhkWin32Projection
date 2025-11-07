#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides customization options for a single field in a logon or credential UI.
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/ne-credentialprovider-credential_provider_credential_field_options
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS{

    /**
     * Default. Don't show the "password reveal" glyph, and use the standard on-screen keyboard layout.
     * @type {Integer (Int32)}
     */
    static CPCFO_NONE => 0

    /**
     * Display the "password reveal" glyph in a password entry box. When this glyph is held down by the user, the entry in the password box is shown in plain text. The glyph is shown here:
     * 
     * <img alt="Password reveal glyph" src="./images/PasswordReveal.png"/>
     * @type {Integer (Int32)}
     */
    static CPCFO_ENABLE_PASSWORD_REVEAL => 1

    /**
     * The field will contain an e-mail address. The on-screen keyboard should be optimized for that input (showing the .com and @ keys on the primary keyboard layout). This option is used with Microsoft account credentials.
     * @type {Integer (Int32)}
     */
    static CPCFO_IS_EMAIL_ADDRESS => 2

    /**
     * When enabled, the touch keyboard will be automatically invoked. This should be set only on the <b>CPFG_CREDENTIAL_PROVIDER_LOGO</b> field.
     * @type {Integer (Int32)}
     */
    static CPCFO_ENABLE_TOUCH_KEYBOARD_AUTO_INVOKE => 4

    /**
     * The field will only allow numerals to be entered. The on-screen keyboard should be optimized for that input (showing only a number keypad on the primary keyboard layout). This should be set only on the <b>CPFT_PASSWORD_TEXT</b> field
     * @type {Integer (Int32)}
     */
    static CPCFO_NUMBERS_ONLY => 8

    /**
     * Show the English keyboard.
     * @type {Integer (Int32)}
     */
    static CPCFO_SHOW_ENGLISH_KEYBOARD => 16
}
