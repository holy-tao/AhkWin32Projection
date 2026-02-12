#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowServicesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for working with app windows.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowservices
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class WindowServices extends IInspectable {
;@region Static Methods
    /**
     * Gets the identifier of each top-level window.
     * @returns {IVectorView<WindowId>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowservices.findalltoplevelwindowids
     */
    static FindAllTopLevelWindowIds() {
        if (!WindowServices.HasProp("__IWindowServicesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.WindowServices")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowServicesStatics.IID)
            WindowServices.__IWindowServicesStatics := IWindowServicesStatics(factoryPtr)
        }

        return WindowServices.__IWindowServicesStatics.FindAllTopLevelWindowIds()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
