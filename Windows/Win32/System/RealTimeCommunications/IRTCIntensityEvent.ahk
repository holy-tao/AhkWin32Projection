#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCIntensityEvent extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} plLevel 
     * @returns {HRESULT} 
     */
    get_Level(plLevel) {
        result := ComCall(7, this, "int*", plLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMin 
     * @returns {HRESULT} 
     */
    get_Min(plMin) {
        result := ComCall(8, this, "int*", plMin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMax 
     * @returns {HRESULT} 
     */
    get_Max(plMax) {
        result := ComCall(9, this, "int*", plMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penDirection 
     * @returns {HRESULT} 
     */
    get_Direction(penDirection) {
        result := ComCall(10, this, "int*", penDirection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
