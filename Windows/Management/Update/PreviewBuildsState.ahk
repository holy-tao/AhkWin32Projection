#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPreviewBuildsState.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information used to connect a device to associate the device with the Windows Insider Program.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.previewbuildsstate
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class PreviewBuildsState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPreviewBuildsState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPreviewBuildsState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Contains properties associated with a [PreviewBuildsState](previewbuildsstate.md) for registering a device with the WindowsInsiderProgram.
     * @remarks
     * Property values include:
     * 
     * | Name | Type | Description | 
     * |------|------|-------------|
     * | ActivationCode | String | The activation code that must be entered into the Windows Insider Program Device Portal to opt their device into the program. |
     * | ActivationCodeExpirationDateTime | DateTime | The expiration date of the activation code. A new activation code must be requested once this one has expired. |
     * | ErrorMessage | String | A message that should be displayed to the user to inform them of issues with their device configuration. | 
     * | PreviewBuildsEnabled | Integer | A value greater than `0` indicates that the device is currently opted into the Windows Insider Program and will receive preview builds. |
     * | StatusMessage | String | A message that should be displayed to the user to inform them of general information. |
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.previewbuildsstate.properties
     * @type {ValueSet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Properties() {
        if (!this.HasProp("__IPreviewBuildsState")) {
            if ((queryResult := this.QueryInterface(IPreviewBuildsState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPreviewBuildsState := IPreviewBuildsState(outPtr)
        }

        return this.__IPreviewBuildsState.get_Properties()
    }

;@endregion Instance Methods
}
