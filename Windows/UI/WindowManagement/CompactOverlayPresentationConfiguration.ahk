#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppWindowPresentationConfiguration.ahk
#Include .\ICompactOverlayPresentationConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the compact overlay configuration for an AppWindowPresenter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.compactoverlaypresentationconfiguration
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class CompactOverlayPresentationConfiguration extends AppWindowPresentationConfiguration {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompactOverlayPresentationConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompactOverlayPresentationConfiguration.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the CompactOverlayPresentationConfiguration class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.CompactOverlayPresentationConfiguration")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
