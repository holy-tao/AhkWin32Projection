#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowManagementPreview.ahk
#Include .\IWindowManagementPreviewStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides preview APIs for handling and managing the windows associated with the active app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.preview.windowmanagementpreview
 * @namespace Windows.UI.WindowManagement.Preview
 * @version WindowsRuntime 1.4
 */
class WindowManagementPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowManagementPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowManagementPreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Sets the preferred minimum size for the specified AppWindow.
     * @param {AppWindow} window_ The app window to set the size for.
     * @param {SIZE} preferredFrameMinSize The preferred minimum size for the window.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.preview.windowmanagementpreview.setpreferredminsize
     */
    static SetPreferredMinSize(window_, preferredFrameMinSize) {
        if (!WindowManagementPreview.HasProp("__IWindowManagementPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.Preview.WindowManagementPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowManagementPreviewStatics.IID)
            WindowManagementPreview.__IWindowManagementPreviewStatics := IWindowManagementPreviewStatics(factoryPtr)
        }

        return WindowManagementPreview.__IWindowManagementPreviewStatics.SetPreferredMinSize(window_, preferredFrameMinSize)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
