#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the state of a field and how it a user can interact with it. Fields can be displayed by a credential provider in a variety of different interactive states.
 * @remarks
 * Starting with Windows 10, field interactive states are set during the initial rendering of the Credential UI and when the credential provider fires interactive state change events. An example of this event would be when the user enters digits in the first field and the credential provider automatically moves the cursor to the second field. Be careful when you fire interactive state change events because it could interrupt users entering credential data.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_interactive_state
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE extends Win32Enum{

    /**
     * The field can be edited if the field type supports editing. It also contains none of the other available interactive states.
     * @type {Integer (Int32)}
     */
    static CPFIS_NONE => 0

    /**
     * Reserved and not used.
     * @type {Integer (Int32)}
     */
    static CPFIS_READONLY => 1

    /**
     * The field is disabled. The user can see it but not interact with it. This support was added starting with Windows 10.
     * @type {Integer (Int32)}
     */
    static CPFIS_DISABLED => 2

    /**
     * Credential providers use this field interactive state to indicate that the field should receive initial keyboard focus. This interactive state may not be specified for field types that the user cannot edit. If several editable fields specify this state, the last of them based on <i>dwIndex</i> order receives focus. On systems before  Windows 10, it was the first of editable fields based on <i>dwIndex</i> order. This field interactive state is obeyed only during initial enumeration.
     * @type {Integer (Int32)}
     */
    static CPFIS_FOCUSED => 3
}
