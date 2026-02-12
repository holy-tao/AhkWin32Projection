#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICredentialPickerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Creates an asynchronous object that displays a dialog box of credentials to the user and collects the user's response.
  * 
  * > [!NOTE]
  * > Enterprise credentials retrieved from the CredentialPicker don't have the capability to roam.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpicker
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class CredentialPicker extends IInspectable {
;@region Static Methods
    /**
     * Constructor used to initiate asynchronous prompting operations using two inputs.
     * @remarks
     * This method is supported only in UWP apps. In a non-UWP (that is, desktop) app, use the three-parameter overload, and set the *caption* parameter.
     * @param {CredentialPickerOptions} options 
     * @returns {IAsyncOperation<CredentialPickerResults>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpicker.pickasync
     */
    static PickWithOptionsAsync(options) {
        if (!CredentialPicker.HasProp("__ICredentialPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.UI.CredentialPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICredentialPickerStatics.IID)
            CredentialPicker.__ICredentialPickerStatics := ICredentialPickerStatics(factoryPtr)
        }

        return CredentialPicker.__ICredentialPickerStatics.PickWithOptionsAsync(options)
    }

    /**
     * Constructor used to initiate asynchronous prompting operations using three inputs.
     * @param {HSTRING} targetName The target name to display.
     * @param {HSTRING} message The message to display in the dialog box.
     * @returns {IAsyncOperation<CredentialPickerResults>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpicker.pickasync
     */
    static PickWithMessageAsync(targetName, message) {
        if (!CredentialPicker.HasProp("__ICredentialPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.UI.CredentialPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICredentialPickerStatics.IID)
            CredentialPicker.__ICredentialPickerStatics := ICredentialPickerStatics(factoryPtr)
        }

        return CredentialPicker.__ICredentialPickerStatics.PickWithMessageAsync(targetName, message)
    }

    /**
     * Displays a dialog box to the user and collects credentials from the user.
     * @param {HSTRING} targetName 
     * @param {HSTRING} message 
     * @param {HSTRING} caption 
     * @returns {IAsyncOperation<CredentialPickerResults>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpicker.pickasync
     */
    static PickWithCaptionAsync(targetName, message, caption) {
        if (!CredentialPicker.HasProp("__ICredentialPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.UI.CredentialPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICredentialPickerStatics.IID)
            CredentialPicker.__ICredentialPickerStatics := ICredentialPickerStatics(factoryPtr)
        }

        return CredentialPicker.__ICredentialPickerStatics.PickWithCaptionAsync(targetName, message, caption)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
