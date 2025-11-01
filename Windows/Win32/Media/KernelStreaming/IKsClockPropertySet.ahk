#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsClockPropertySet extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsGetTime", "KsSetTime", "KsGetPhysicalTime", "KsSetPhysicalTime", "KsGetCorrelatedTime", "KsSetCorrelatedTime", "KsGetCorrelatedPhysicalTime", "KsSetCorrelatedPhysicalTime", "KsGetResolution", "KsGetState"]

    /**
     * 
     * @param {Pointer<Integer>} Time 
     * @returns {HRESULT} 
     */
    KsGetTime(Time) {
        TimeMarshal := Time is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, TimeMarshal, Time, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Time 
     * @returns {HRESULT} 
     */
    KsSetTime(Time) {
        result := ComCall(4, this, "int64", Time, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Time 
     * @returns {HRESULT} 
     */
    KsGetPhysicalTime(Time) {
        TimeMarshal := Time is VarRef ? "int64*" : "ptr"

        result := ComCall(5, this, TimeMarshal, Time, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Time 
     * @returns {HRESULT} 
     */
    KsSetPhysicalTime(Time) {
        result := ComCall(6, this, "int64", Time, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsGetCorrelatedTime(CorrelatedTime) {
        result := ComCall(7, this, "ptr", CorrelatedTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsSetCorrelatedTime(CorrelatedTime) {
        result := ComCall(8, this, "ptr", CorrelatedTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsGetCorrelatedPhysicalTime(CorrelatedTime) {
        result := ComCall(9, this, "ptr", CorrelatedTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsSetCorrelatedPhysicalTime(CorrelatedTime) {
        result := ComCall(10, this, "ptr", CorrelatedTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSRESOLUTION>} Resolution 
     * @returns {HRESULT} 
     */
    KsGetResolution(Resolution) {
        result := ComCall(11, this, "ptr", Resolution, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} State 
     * @returns {HRESULT} 
     */
    KsGetState(State) {
        StateMarshal := State is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, StateMarshal, State, "HRESULT")
        return result
    }
}
