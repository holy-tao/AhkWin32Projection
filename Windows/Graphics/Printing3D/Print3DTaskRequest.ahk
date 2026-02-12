#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DTaskRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a 3D print job request.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskrequest
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTaskRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DTaskRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DTaskRequest.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates a 3D print job.
     * @param {HSTRING} title The name of the print job.
     * @param {HSTRING} printerId The identifier of the 3D printer.
     * @param {Print3DTaskSourceRequestedHandler} handler The callback for the source of the print job request.
     * @returns {Print3DTask} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskrequest.createtask
     */
    CreateTask(title, printerId, handler) {
        if (!this.HasProp("__IPrint3DTaskRequest")) {
            if ((queryResult := this.QueryInterface(IPrint3DTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTaskRequest := IPrint3DTaskRequest(outPtr)
        }

        return this.__IPrint3DTaskRequest.CreateTask(title, printerId, handler)
    }

;@endregion Instance Methods
}
