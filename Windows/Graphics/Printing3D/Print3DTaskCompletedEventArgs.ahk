#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DTaskCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [Completed](print3dtask_completed.md) event of the 3D print request.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskcompletedeventargs
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTaskCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DTaskCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DTaskCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the 3D print request.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskcompletedeventargs.completion
     * @type {Integer} 
     */
    Completion {
        get => this.get_Completion()
    }

    /**
     * Gets the type of error encountered during the 3D print request.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskcompletedeventargs.extendedstatus
     * @type {Integer} 
     */
    ExtendedStatus {
        get => this.get_ExtendedStatus()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Completion() {
        if (!this.HasProp("__IPrint3DTaskCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DTaskCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTaskCompletedEventArgs := IPrint3DTaskCompletedEventArgs(outPtr)
        }

        return this.__IPrint3DTaskCompletedEventArgs.get_Completion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedStatus() {
        if (!this.HasProp("__IPrint3DTaskCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DTaskCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTaskCompletedEventArgs := IPrint3DTaskCompletedEventArgs(outPtr)
        }

        return this.__IPrint3DTaskCompletedEventArgs.get_ExtendedStatus()
    }

;@endregion Instance Methods
}
