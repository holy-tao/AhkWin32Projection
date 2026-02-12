#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextServicesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides constant values for use with the Windows core text APIs and the text input server.
 * @remarks
 * Use the static members of this type by qualifying with the typename.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextservicesconstants
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextServicesConstants extends IInspectable {
;@region Static Properties
    /**
     * Gets a value to use to replace hidden data inside a text stream before returning the text to the text input server.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextservicesconstants.hiddencharacter
     * @type {Integer} 
     */
    static HiddenCharacter {
        get => CoreTextServicesConstants.get_HiddenCharacter()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_HiddenCharacter() {
        if (!CoreTextServicesConstants.HasProp("__ICoreTextServicesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.Core.CoreTextServicesConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreTextServicesStatics.IID)
            CoreTextServicesConstants.__ICoreTextServicesStatics := ICoreTextServicesStatics(factoryPtr)
        }

        return CoreTextServicesConstants.__ICoreTextServicesStatics.get_HiddenCharacter()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
