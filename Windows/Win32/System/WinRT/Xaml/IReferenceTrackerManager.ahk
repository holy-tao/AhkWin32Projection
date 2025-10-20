#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IReferenceTrackerManager extends IUnknown{
    /**
     * The interface identifier for IReferenceTrackerManager
     * @type {Guid}
     */
    static IID => Guid("{3cf184b4-7ccb-4dda-8455-7e6ce99a3298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    ReferenceTrackingStarted() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} findFailed 
     * @returns {HRESULT} 
     */
    FindTrackerTargetsCompleted(findFailed) {
        result := ComCall(4, this, "char", findFailed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReferenceTrackingCompleted() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceTrackerHost>} value 
     * @returns {HRESULT} 
     */
    SetReferenceTrackerHost(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
