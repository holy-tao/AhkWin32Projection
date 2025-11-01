#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBaseVideoMixer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBaseVideoMixer
     * @type {Guid}
     */
    static IID => Guid("{61ded640-e912-11ce-a099-00aa00479a58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLeadPin", "GetLeadPin", "GetInputPinCount", "IsUsingClock", "SetUsingClock", "GetClockPeriod", "SetClockPeriod"]

    /**
     * 
     * @param {Integer} iPin 
     * @returns {HRESULT} 
     */
    SetLeadPin(iPin) {
        result := ComCall(3, this, "int", iPin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piPin 
     * @returns {HRESULT} 
     */
    GetLeadPin(piPin) {
        result := ComCall(4, this, "int*", piPin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piPinCount 
     * @returns {HRESULT} 
     */
    GetInputPinCount(piPinCount) {
        result := ComCall(5, this, "int*", piPinCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbValue 
     * @returns {HRESULT} 
     */
    IsUsingClock(pbValue) {
        result := ComCall(6, this, "int*", pbValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bValue 
     * @returns {HRESULT} 
     */
    SetUsingClock(bValue) {
        result := ComCall(7, this, "int", bValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbValue 
     * @returns {HRESULT} 
     */
    GetClockPeriod(pbValue) {
        result := ComCall(8, this, "int*", pbValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bValue 
     * @returns {HRESULT} 
     */
    SetClockPeriod(bValue) {
        result := ComCall(9, this, "int", bValue, "HRESULT")
        return result
    }
}
