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
        plLevelMarshal := plLevel is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plLevelMarshal, plLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMin 
     * @returns {HRESULT} 
     */
    get_Min(plMin) {
        plMinMarshal := plMin is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plMinMarshal, plMin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMax 
     * @returns {HRESULT} 
     */
    get_Max(plMax) {
        plMaxMarshal := plMax is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plMaxMarshal, plMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penDirection 
     * @returns {HRESULT} 
     */
    get_Direction(penDirection) {
        penDirectionMarshal := penDirection is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, penDirectionMarshal, penDirection, "HRESULT")
        return result
    }
}
