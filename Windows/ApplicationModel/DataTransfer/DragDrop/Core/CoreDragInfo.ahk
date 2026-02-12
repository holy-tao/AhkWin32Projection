#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreDragInfo.ahk
#Include .\ICoreDragInfo2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Gets information about an item being dragged.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraginfo
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class CoreDragInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreDragInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreDragInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DataPackageView](../windows.applicationmodel.datatransfer/datapackageview.md) for the item being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraginfo.data
     * @type {DataPackageView} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets the modifiers for the item being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraginfo.modifiers
     * @type {Integer} 
     */
    Modifiers {
        get => this.get_Modifiers()
    }

    /**
     * Gets the position of the item being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraginfo.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the allowed [DataPackageOperations](../windows.applicationmodel.datatransfer/datapackageoperation.md) (none, move, copy, and/or link) for the drag and drop operation.
     * @remarks
     * This property specifies the complete set of operations the source app wishes to allow in drag and drop scenarios. There can be zero or more flags. To get the requested default operation, use the [DataPackage.RequestedOperation](../windows.applicationmodel.datatransfer/datapackage_requestedoperation.md) property.
     * 
     * Users can override this choices by using **SHIFT** and **CTRL** keys. In this case, inspect the key state to determine the operation the user selected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraginfo.allowedoperations
     * @type {Integer} 
     */
    AllowedOperations {
        get => this.get_AllowedOperations()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_Data() {
        if (!this.HasProp("__ICoreDragInfo")) {
            if ((queryResult := this.QueryInterface(ICoreDragInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragInfo := ICoreDragInfo(outPtr)
        }

        return this.__ICoreDragInfo.get_Data()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Modifiers() {
        if (!this.HasProp("__ICoreDragInfo")) {
            if ((queryResult := this.QueryInterface(ICoreDragInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragInfo := ICoreDragInfo(outPtr)
        }

        return this.__ICoreDragInfo.get_Modifiers()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__ICoreDragInfo")) {
            if ((queryResult := this.QueryInterface(ICoreDragInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragInfo := ICoreDragInfo(outPtr)
        }

        return this.__ICoreDragInfo.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedOperations() {
        if (!this.HasProp("__ICoreDragInfo2")) {
            if ((queryResult := this.QueryInterface(ICoreDragInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragInfo2 := ICoreDragInfo2(outPtr)
        }

        return this.__ICoreDragInfo2.get_AllowedOperations()
    }

;@endregion Instance Methods
}
