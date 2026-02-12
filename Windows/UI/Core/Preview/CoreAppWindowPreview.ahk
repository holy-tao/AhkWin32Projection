#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreAppWindowPreview.ahk
#Include .\ICoreAppWindowPreviewStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an app window and its thread.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.preview.coreappwindowpreview
 * @namespace Windows.UI.Core.Preview
 * @version WindowsRuntime 1.4
 */
class CoreAppWindowPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreAppWindowPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreAppWindowPreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the ID from the specified app window.
     * 
     * > [!IMPORTANT]
     * > The **CoreAppWindowPreview.GetIdFromWindow** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @param {AppWindow} window_ The app window to get the ID from.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.preview.coreappwindowpreview.getidfromwindow
     */
    static GetIdFromWindow(window_) {
        if (!CoreAppWindowPreview.HasProp("__ICoreAppWindowPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.Preview.CoreAppWindowPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreAppWindowPreviewStatics.IID)
            CoreAppWindowPreview.__ICoreAppWindowPreviewStatics := ICoreAppWindowPreviewStatics(factoryPtr)
        }

        return CoreAppWindowPreview.__ICoreAppWindowPreviewStatics.GetIdFromWindow(window_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
