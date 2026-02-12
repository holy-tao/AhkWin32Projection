#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains methods required for supporting drag and drop.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.icoredropoperationtarget
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class ICoreDropOperationTarget extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreDropOperationTarget
     * @type {Guid}
     */
    static IID => Guid("{d9126196-4c5b-417d-bb37-76381def8db4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnterAsync", "OverAsync", "LeaveAsync", "DropAsync"]

    /**
     * Called when the dragged item enters the drop area.
     * @param {CoreDragInfo} dragInfo The core drag information.
     * @param {CoreDragUIOverride} dragUIOverride_ Overrides to default the drag UI.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.icoredropoperationtarget.enterasync
     */
    EnterAsync(dragInfo, dragUIOverride_) {
        result := ComCall(6, this, "ptr", dragInfo, "ptr", dragUIOverride_, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), returnValue)
    }

    /**
     * Called when the dragged item is over the drop area.
     * @param {CoreDragInfo} dragInfo The core drag information.
     * @param {CoreDragUIOverride} dragUIOverride_ Overrides to default the drag UI.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.icoredropoperationtarget.overasync
     */
    OverAsync(dragInfo, dragUIOverride_) {
        result := ComCall(7, this, "ptr", dragInfo, "ptr", dragUIOverride_, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), returnValue)
    }

    /**
     * Called when a dragged item leaves the target drop area.
     * @param {CoreDragInfo} dragInfo The core drag information.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.icoredropoperationtarget.leaveasync
     */
    LeaveAsync(dragInfo) {
        result := ComCall(8, this, "ptr", dragInfo, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(returnValue)
    }

    /**
     * Called when a dragged item is dropped.
     * @param {CoreDragInfo} dragInfo The core drag information.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.icoredropoperationtarget.dropasync
     */
    DropAsync(dragInfo) {
        result := ComCall(9, this, "ptr", dragInfo, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), returnValue)
    }
}
