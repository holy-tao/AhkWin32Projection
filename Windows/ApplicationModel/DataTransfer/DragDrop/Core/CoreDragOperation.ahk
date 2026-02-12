#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreDragOperation.ahk
#Include .\ICoreDragOperation2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Handles a drag and drop operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragoperation
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class CoreDragOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreDragOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreDragOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) for the drag and drop operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragoperation.data
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets or sets the content mode for the drag UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragoperation.draguicontentmode
     * @type {Integer} 
     */
    DragUIContentMode {
        get => this.get_DragUIContentMode()
        set => this.put_DragUIContentMode(value)
    }

    /**
     * Gets or sets the allowed [DataPackageOperations](../windows.applicationmodel.datatransfer/datapackageoperation.md) (none, move, copy, and/or link) for the drag and drop operation.
     * @remarks
     * Use this property to set the complete set of operations the source app wishes to allow in drag and drop scenarios. You can specify zero or more flags. To set a desired default operation, use the [DataPackage.RequestedOperation](../windows.applicationmodel.datatransfer/datapackage_requestedoperation.md) property.
     * 
     * Users can override this choices by using **SHIFT** and **CTRL** keys. In this case, the target app must inspect the key state to determine the operation the user selected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragoperation.allowedoperations
     * @type {Integer} 
     */
    AllowedOperations {
        get => this.get_AllowedOperations()
        set => this.put_AllowedOperations(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CoreDragOperation](coredragoperation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragOperation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        if (!this.HasProp("__ICoreDragOperation")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation := ICoreDragOperation(outPtr)
        }

        return this.__ICoreDragOperation.get_Data()
    }

    /**
     * Sets the pointer Id.
     * @param {Integer} pointerId The pointer Id.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragoperation.setpointerid
     */
    SetPointerId(pointerId) {
        if (!this.HasProp("__ICoreDragOperation")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation := ICoreDragOperation(outPtr)
        }

        return this.__ICoreDragOperation.SetPointerId(pointerId)
    }

    /**
     * Sets custom drag UI content using a software bitmap.
     * @param {SoftwareBitmap} softwareBitmap_ The custom UI drag content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragoperation.setdraguicontentfromsoftwarebitmap
     */
    SetDragUIContentFromSoftwareBitmap(softwareBitmap_) {
        if (!this.HasProp("__ICoreDragOperation")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation := ICoreDragOperation(outPtr)
        }

        return this.__ICoreDragOperation.SetDragUIContentFromSoftwareBitmap(softwareBitmap_)
    }

    /**
     * Sets custom drag UI content using a software bitmap.
     * @param {SoftwareBitmap} softwareBitmap_ The custom UI drag content.
     * @param {POINT} anchorPoint The relative position of the drag visual from the pointer. The anchor point cannot be outside of the content. For example, if the anchor point is (50, 50) and the position of the pointer is (x, y), the top left corner for the visual will be (x - 50, y - 50).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragoperation.setdraguicontentfromsoftwarebitmap
     */
    SetDragUIContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint) {
        if (!this.HasProp("__ICoreDragOperation")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation := ICoreDragOperation(outPtr)
        }

        return this.__ICoreDragOperation.SetDragUIContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DragUIContentMode() {
        if (!this.HasProp("__ICoreDragOperation")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation := ICoreDragOperation(outPtr)
        }

        return this.__ICoreDragOperation.get_DragUIContentMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DragUIContentMode(value) {
        if (!this.HasProp("__ICoreDragOperation")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation := ICoreDragOperation(outPtr)
        }

        return this.__ICoreDragOperation.put_DragUIContentMode(value)
    }

    /**
     * Starts the drag and drop operation.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragoperation.startasync
     */
    StartAsync() {
        if (!this.HasProp("__ICoreDragOperation")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation := ICoreDragOperation(outPtr)
        }

        return this.__ICoreDragOperation.StartAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedOperations() {
        if (!this.HasProp("__ICoreDragOperation2")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation2 := ICoreDragOperation2(outPtr)
        }

        return this.__ICoreDragOperation2.get_AllowedOperations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AllowedOperations(value) {
        if (!this.HasProp("__ICoreDragOperation2")) {
            if ((queryResult := this.QueryInterface(ICoreDragOperation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragOperation2 := ICoreDragOperation2(outPtr)
        }

        return this.__ICoreDragOperation2.put_AllowedOperations(value)
    }

;@endregion Instance Methods
}
