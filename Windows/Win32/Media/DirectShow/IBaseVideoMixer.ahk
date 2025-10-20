#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBaseVideoMixer extends IUnknown{
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
     * 
     * @param {Integer} iPin 
     * @returns {HRESULT} 
     */
    SetLeadPin(iPin) {
        result := ComCall(3, this, "int", iPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piPin 
     * @returns {HRESULT} 
     */
    GetLeadPin(piPin) {
        result := ComCall(4, this, "int*", piPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piPinCount 
     * @returns {HRESULT} 
     */
    GetInputPinCount(piPinCount) {
        result := ComCall(5, this, "int*", piPinCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pbValue 
     * @returns {HRESULT} 
     */
    IsUsingClock(pbValue) {
        result := ComCall(6, this, "int*", pbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bValue 
     * @returns {HRESULT} 
     */
    SetUsingClock(bValue) {
        result := ComCall(7, this, "int", bValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pbValue 
     * @returns {HRESULT} 
     */
    GetClockPeriod(pbValue) {
        result := ComCall(8, this, "int*", pbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bValue 
     * @returns {HRESULT} 
     */
    SetClockPeriod(bValue) {
        result := ComCall(9, this, "int", bValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
