#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DModel2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DModel2
     * @type {Guid}
     */
    static IID => Guid("{c92069c7-c841-47f3-a84e-a149fd08b657}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryPartialRepairAsync", "TryPartialRepairWithTimeAsync", "TryReduceFacesAsync", "TryReduceFacesWithOptionsAsync", "TryReduceFacesWithOptionsAndTimeAsync", "RepairWithProgressAsync"]

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryPartialRepairAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {TimeSpan} maxWaitTime 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryPartialRepairWithTimeAsync(maxWaitTime) {
        result := ComCall(7, this, "ptr", maxWaitTime, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<Boolean, Float>} 
     */
    TryReduceFacesAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetBoolean(), (ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }

    /**
     * 
     * @param {Printing3DFaceReductionOptions} printing3DFaceReductionOptions_ 
     * @returns {IAsyncOperationWithProgress<Boolean, Float>} 
     */
    TryReduceFacesWithOptionsAsync(printing3DFaceReductionOptions_) {
        result := ComCall(9, this, "ptr", printing3DFaceReductionOptions_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetBoolean(), (ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }

    /**
     * 
     * @param {Printing3DFaceReductionOptions} printing3DFaceReductionOptions_ 
     * @param {TimeSpan} maxWait 
     * @returns {IAsyncOperationWithProgress<Boolean, Float>} 
     */
    TryReduceFacesWithOptionsAndTimeAsync(printing3DFaceReductionOptions_, maxWait) {
        result := ComCall(10, this, "ptr", printing3DFaceReductionOptions_, "ptr", maxWait, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetBoolean(), (ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<Boolean, Float>} 
     */
    RepairWithProgressAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetBoolean(), (ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }
}
