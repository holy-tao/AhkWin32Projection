#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGraphicsCaptureAccessStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows the app to request access for graphics capture features that require user consent.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureaccess
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class GraphicsCaptureAccess extends IInspectable {
;@region Static Methods
    /**
     * Requests access for graphics capture features that require user consent.
     * @remarks
     * To call **RequestAccessAsync** with the value **GraphicsCaptureAccessKind.Borderless**, you must declare the **graphicsCaptureWithoutBorder** capability in your app's package manifest. For more information, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * @param {Integer} request A member of the [GraphicsCaptureAccessKind](graphicscaptureaccesskind.md) enumeration specifying the type of access being requested.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureaccess.requestaccessasync
     */
    static RequestAccessAsync(request) {
        if (!GraphicsCaptureAccess.HasProp("__IGraphicsCaptureAccessStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Capture.GraphicsCaptureAccess")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGraphicsCaptureAccessStatics.IID)
            GraphicsCaptureAccess.__IGraphicsCaptureAccessStatics := IGraphicsCaptureAccessStatics(factoryPtr)
        }

        return GraphicsCaptureAccess.__IGraphicsCaptureAccessStatics.RequestAccessAsync(request)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
