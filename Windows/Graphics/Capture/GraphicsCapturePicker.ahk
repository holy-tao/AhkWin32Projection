#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGraphicsCapturePicker.ahk
#Include ..\..\..\Guid.ahk

/**
 * A system picker UI control that allows the customer to select an item on the screen to capture.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturepicker
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class GraphicsCapturePicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGraphicsCapturePicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGraphicsCapturePicker.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Constructs an instance of a capture picker.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Capture.GraphicsCapturePicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Opens the capture picker and allows the customer to pick a target on the screen to capture.
     * @remarks
     * This API must be called on the UI thread or an exception will be thrown. For more information, see [CoreDispatcher.RunAsync](/uwp/api/windows.ui.core.coredispatcher.runasync).
     * @returns {IAsyncOperation<GraphicsCaptureItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturepicker.picksingleitemasync
     */
    PickSingleItemAsync() {
        if (!this.HasProp("__IGraphicsCapturePicker")) {
            if ((queryResult := this.QueryInterface(IGraphicsCapturePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCapturePicker := IGraphicsCapturePicker(outPtr)
        }

        return this.__IGraphicsCapturePicker.PickSingleItemAsync()
    }

;@endregion Instance Methods
}
