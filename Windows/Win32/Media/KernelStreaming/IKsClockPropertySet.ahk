#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsClockPropertySet extends IUnknown{
    /**
     * The interface identifier for IKsClockPropertySet
     * @type {Guid}
     */
    static IID => Guid("{5c5cbd84-e755-11d0-ac18-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int64>} Time 
     * @returns {HRESULT} 
     */
    KsGetTime(Time) {
        result := ComCall(3, this, "int64*", Time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Time 
     * @returns {HRESULT} 
     */
    KsSetTime(Time) {
        result := ComCall(4, this, "int64", Time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} Time 
     * @returns {HRESULT} 
     */
    KsGetPhysicalTime(Time) {
        result := ComCall(5, this, "int64*", Time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Time 
     * @returns {HRESULT} 
     */
    KsSetPhysicalTime(Time) {
        result := ComCall(6, this, "int64", Time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsGetCorrelatedTime(CorrelatedTime) {
        result := ComCall(7, this, "ptr", CorrelatedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsSetCorrelatedTime(CorrelatedTime) {
        result := ComCall(8, this, "ptr", CorrelatedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsGetCorrelatedPhysicalTime(CorrelatedTime) {
        result := ComCall(9, this, "ptr", CorrelatedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsSetCorrelatedPhysicalTime(CorrelatedTime) {
        result := ComCall(10, this, "ptr", CorrelatedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSRESOLUTION>} Resolution 
     * @returns {HRESULT} 
     */
    KsGetResolution(Resolution) {
        result := ComCall(11, this, "ptr", Resolution, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} State 
     * @returns {HRESULT} 
     */
    KsGetState(State) {
        result := ComCall(12, this, "int*", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
