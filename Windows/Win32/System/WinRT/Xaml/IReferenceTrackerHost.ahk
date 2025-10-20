#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IReferenceTrackerHost extends IUnknown{
    /**
     * The interface identifier for IReferenceTrackerHost
     * @type {Guid}
     */
    static IID => Guid("{29a71c6a-3c42-4416-a39d-e2825a07a773}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    DisconnectUnusedReferenceSources(options) {
        result := ComCall(3, this, "int", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseDisconnectedReferenceSources() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyEndOfReferenceTrackingOnThread() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} unknown 
     * @param {Pointer<IReferenceTrackerTarget>} newReference 
     * @returns {HRESULT} 
     */
    GetTrackerTarget(unknown, newReference) {
        result := ComCall(6, this, "ptr", unknown, "ptr", newReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bytesAllocated 
     * @returns {HRESULT} 
     */
    AddMemoryPressure(bytesAllocated) {
        result := ComCall(7, this, "uint", bytesAllocated, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bytesAllocated 
     * @returns {HRESULT} 
     */
    RemoveMemoryPressure(bytesAllocated) {
        result := ComCall(8, this, "uint", bytesAllocated, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
