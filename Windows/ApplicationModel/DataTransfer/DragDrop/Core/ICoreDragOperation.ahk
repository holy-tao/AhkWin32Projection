#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DataPackage.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class ICoreDragOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreDragOperation
     * @type {Guid}
     */
    static IID => Guid("{cc06de4f-6db0-4e62-ab1b-a74a02dc6d85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data", "SetPointerId", "SetDragUIContentFromSoftwareBitmap", "SetDragUIContentFromSoftwareBitmapWithAnchorPoint", "get_DragUIContentMode", "put_DragUIContentMode", "StartAsync"]

    /**
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * @type {Integer} 
     */
    DragUIContentMode {
        get => this.get_DragUIContentMode()
        set => this.put_DragUIContentMode(value)
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackage(value)
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     */
    SetPointerId(pointerId) {
        result := ComCall(7, this, "uint", pointerId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SoftwareBitmap} softwareBitmap_ 
     * @returns {HRESULT} 
     */
    SetDragUIContentFromSoftwareBitmap(softwareBitmap_) {
        result := ComCall(8, this, "ptr", softwareBitmap_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SoftwareBitmap} softwareBitmap_ 
     * @param {POINT} anchorPoint 
     * @returns {HRESULT} 
     */
    SetDragUIContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint) {
        result := ComCall(9, this, "ptr", softwareBitmap_, "ptr", anchorPoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DragUIContentMode() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DragUIContentMode(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    StartAsync() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
