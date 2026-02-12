#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DTask.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Print3DTask.ahk
#Include .\Print3DTaskCompletedEventArgs.ahk
#Include .\Print3DTaskSourceChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a 3D print job.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtask
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTask extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DTask

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DTask.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the 3D print package to be printed.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtask.source
     * @type {Printing3D3MFPackage} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Occurs when the 3D print package has been submitted to the 3D printer.
     * @type {TypedEventHandler<Print3DTask, IInspectable>}
    */
    OnSubmitting {
        get {
            if(!this.HasProp("__OnSubmitting")){
                this.__OnSubmitting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c0081611-7485-58a8-88be-82e712d8c1ba}"),
                    Print3DTask,
                    IInspectable
                )
                this.__OnSubmittingToken := this.add_Submitting(this.__OnSubmitting.iface)
            }
            return this.__OnSubmitting
        }
    }

    /**
     * Occurs when the print request has been sent to the 3D printer and the 3D print job has been created.
     * @type {TypedEventHandler<Print3DTask, Print3DTaskCompletedEventArgs>}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bccf7095-bc8e-5ff5-83c0-d5691e0aa24d}"),
                    Print3DTask,
                    Print3DTaskCompletedEventArgs
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

    /**
     * Occurs when the workflow modifies the 3D print package.
     * @type {TypedEventHandler<Print3DTask, Print3DTaskSourceChangedEventArgs>}
    */
    OnSourceChanged {
        get {
            if(!this.HasProp("__OnSourceChanged")){
                this.__OnSourceChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{58d36055-0241-555d-af7b-9f05e5daa412}"),
                    Print3DTask,
                    Print3DTaskSourceChangedEventArgs
                )
                this.__OnSourceChangedToken := this.add_SourceChanged(this.__OnSourceChanged.iface)
            }
            return this.__OnSourceChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSubmittingToken")) {
            this.remove_Submitting(this.__OnSubmittingToken)
            this.__OnSubmitting.iface.Dispose()
        }

        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnSourceChangedToken")) {
            this.remove_SourceChanged(this.__OnSourceChangedToken)
            this.__OnSourceChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Printing3D3MFPackage} 
     */
    get_Source() {
        if (!this.HasProp("__IPrint3DTask")) {
            if ((queryResult := this.QueryInterface(IPrint3DTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTask := IPrint3DTask(outPtr)
        }

        return this.__IPrint3DTask.get_Source()
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DTask, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Submitting(eventHandler) {
        if (!this.HasProp("__IPrint3DTask")) {
            if ((queryResult := this.QueryInterface(IPrint3DTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTask := IPrint3DTask(outPtr)
        }

        return this.__IPrint3DTask.add_Submitting(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Submitting(eventCookie) {
        if (!this.HasProp("__IPrint3DTask")) {
            if ((queryResult := this.QueryInterface(IPrint3DTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTask := IPrint3DTask(outPtr)
        }

        return this.__IPrint3DTask.remove_Submitting(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DTask, Print3DTaskCompletedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(eventHandler) {
        if (!this.HasProp("__IPrint3DTask")) {
            if ((queryResult := this.QueryInterface(IPrint3DTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTask := IPrint3DTask(outPtr)
        }

        return this.__IPrint3DTask.add_Completed(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Completed(eventCookie) {
        if (!this.HasProp("__IPrint3DTask")) {
            if ((queryResult := this.QueryInterface(IPrint3DTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTask := IPrint3DTask(outPtr)
        }

        return this.__IPrint3DTask.remove_Completed(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DTask, Print3DTaskSourceChangedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceChanged(eventHandler) {
        if (!this.HasProp("__IPrint3DTask")) {
            if ((queryResult := this.QueryInterface(IPrint3DTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTask := IPrint3DTask(outPtr)
        }

        return this.__IPrint3DTask.add_SourceChanged(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_SourceChanged(eventCookie) {
        if (!this.HasProp("__IPrint3DTask")) {
            if ((queryResult := this.QueryInterface(IPrint3DTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTask := IPrint3DTask(outPtr)
        }

        return this.__IPrint3DTask.remove_SourceChanged(eventCookie)
    }

;@endregion Instance Methods
}
