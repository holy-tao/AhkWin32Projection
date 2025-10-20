#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves the total number of properties associated with a tracking information object and their names.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomtrackinginfoproperties
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComTrackingInfoProperties extends IUnknown{
    /**
     * The interface identifier for IComTrackingInfoProperties
     * @type {Guid}
     */
    static IID => Guid("{789b42be-6f6b-443a-898e-67abf390aa14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    PropCount(pCount) {
        result := ComCall(3, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<PWSTR>} ppszPropName 
     * @returns {HRESULT} 
     */
    GetPropName(ulIndex, ppszPropName) {
        result := ComCall(4, this, "uint", ulIndex, "ptr", ppszPropName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
