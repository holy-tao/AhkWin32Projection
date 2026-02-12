#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DTaskRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [TaskRequested](print3dmanager_taskrequested.md) event.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskrequestedeventargs
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTaskRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DTaskRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DTaskRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the 3D print job request associated with the [Print3DManager](print3dmanager.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskrequestedeventargs.request
     * @type {Print3DTaskRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Print3DTaskRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IPrint3DTaskRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DTaskRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTaskRequestedEventArgs := IPrint3DTaskRequestedEventArgs(outPtr)
        }

        return this.__IPrint3DTaskRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
