#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a type of credential field. Used by CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR.
 * @remarks
 * This type enables you to specify the different elements your credential provider will need to display to the user. Credential providers are not responsible for drawing their own UI, so they need to define the elements that are necessary. This type is one of the elements to support that mechanism.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_type
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CREDENTIAL_PROVIDER_FIELD_TYPE extends Win32Enum{

    /**
     * The value is invalid. This is a safe initialization value, as fields do not default to any given type.
     * @type {Integer (Int32)}
     */
    static CPFT_INVALID => 0

    /**
     * A stand-alone text label is drawn in the larger of two font sizes.
     * @type {Integer (Int32)}
     */
    static CPFT_LARGE_TEXT => 1

    /**
     * A stand-alone text label is drawn in the smaller of two font sizes.
     * @type {Integer (Int32)}
     */
    static CPFT_SMALL_TEXT => 2

    /**
     * An uneditable string that a user may click to perform an action. The credential provider is informed of the user's click, and then performs the requested action. Use <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-commandlinkclicked">CommandLinkClicked</a> in your credential provider to respond to the click.
     * @type {Integer (Int32)}
     */
    static CPFT_COMMAND_LINK => 3

    /**
     * An edit box. Users may provide credential information by typing in this box.
     * @type {Integer (Int32)}
     */
    static CPFT_EDIT_TEXT => 4

    /**
     * A special edit control that displays its string as a series of password characters, such as the asterisk character (*). Otherwise this functions the same as <b>CPFT_EDIT_TEXT</b>.
     * @type {Integer (Int32)}
     */
    static CPFT_PASSWORD_TEXT => 5

    /**
     * A bitmap that is shown as the user tile image. This bitmap cannot be edited. All credential providers must contain no more than one <b>CPFT_TILE_IMAGE</b>. If no image is specified, Logon UI and Credential UI will supply a default tile image.
     * @type {Integer (Int32)}
     */
    static CPFT_TILE_IMAGE => 6

    /**
     * A checkbox control that allows for checked and unchecked states.
     * @type {Integer (Int32)}
     */
    static CPFT_CHECKBOX => 7

    /**
     * A combobox control that allows users to select an option from a defined set of choices.
     * @type {Integer (Int32)}
     */
    static CPFT_COMBOBOX => 8

    /**
     * This field appears as a button on the credential tile. Pressing the button lets the user submit their credentials. There is exactly one <b>CPFT_SUBMIT_BUTTON</b> on any credential tile. Unlike Logon UI, which draws a special submit button in the tile layout, Credential UI hides this field and renders a single submit button for all credentials.
     * @type {Integer (Int32)}
     */
    static CPFT_SUBMIT_BUTTON => 9
}
