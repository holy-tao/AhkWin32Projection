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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PropCount", "GetPropName"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfoproperties-propcount
     */
    PropCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfoproperties-getpropname
     */
    GetPropName(ulIndex) {
        result := ComCall(4, this, "uint", ulIndex, "ptr*", &ppszPropName := 0, "HRESULT")
        return ppszPropName
    }
}
