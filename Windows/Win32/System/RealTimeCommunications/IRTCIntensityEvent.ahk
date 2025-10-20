#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCIntensityEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCIntensityEvent
     * @type {Guid}
     */
    static IID => Guid("{4c23bf51-390c-4992-a41d-41eec05b2a4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Level", "get_Min", "get_Max", "get_Direction"]

    /**
     * 
     * @param {Pointer<Integer>} plLevel 
     * @returns {HRESULT} 
     */
    get_Level(plLevel) {
        result := ComCall(7, this, "int*", plLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMin 
     * @returns {HRESULT} 
     */
    get_Min(plMin) {
        result := ComCall(8, this, "int*", plMin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMax 
     * @returns {HRESULT} 
     */
    get_Max(plMax) {
        result := ComCall(9, this, "int*", plMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penDirection 
     * @returns {HRESULT} 
     */
    get_Direction(penDirection) {
        result := ComCall(10, this, "int*", penDirection, "HRESULT")
        return result
    }
}
