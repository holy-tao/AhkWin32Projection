#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInputActivationListenerPreviewStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the ability to access and observe changes to the activation state of a window, view, or other visual element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.inputactivationlistenerpreview
 * @namespace Windows.UI.Input.Preview
 * @version WindowsRuntime 1.4
 */
class InputActivationListenerPreview extends IInspectable {
;@region Static Methods
    /**
     * Instantiates an [InputActivationListenerPreview](inputactivationlistenerpreview.md) object for the specified [AppWindow](../windows.ui.windowmanagement/appwindow.md).
     * @param {AppWindow} window_ 
     * @returns {InputActivationListener} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.inputactivationlistenerpreview.createforapplicationwindow
     */
    static CreateForApplicationWindow(window_) {
        if (!InputActivationListenerPreview.HasProp("__IInputActivationListenerPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.InputActivationListenerPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInputActivationListenerPreviewStatics.IID)
            InputActivationListenerPreview.__IInputActivationListenerPreviewStatics := IInputActivationListenerPreviewStatics(factoryPtr)
        }

        return InputActivationListenerPreview.__IInputActivationListenerPreviewStatics.CreateForApplicationWindow(window_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
