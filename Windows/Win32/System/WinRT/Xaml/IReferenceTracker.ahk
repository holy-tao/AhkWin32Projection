#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IReferenceTracker extends IUnknown{
    /**
     * The interface identifier for IReferenceTracker
     * @type {Guid}
     */
    static IID => Guid("{11d3b13a-180e-4789-a8be-7712882893e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    ConnectFromTrackerSource() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectFromTrackerSource() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFindReferenceTargetsCallback>} callback 
     * @returns {HRESULT} 
     */
    FindTrackerTargets(callback) {
        result := ComCall(5, this, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceTrackerManager>} value 
     * @returns {HRESULT} 
     */
    GetReferenceTrackerManager(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddRefFromTrackerSource() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseFromTrackerSource() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PegFromTrackerSource() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
