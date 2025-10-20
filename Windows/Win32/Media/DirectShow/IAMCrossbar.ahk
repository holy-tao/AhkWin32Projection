#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMCrossbar interface routes signals from an analog or digital source to a video capture filter.This interface is implemented by the Analog Video Crossbar Filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamcrossbar
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMCrossbar extends IUnknown{
    /**
     * The interface identifier for IAMCrossbar
     * @type {Guid}
     */
    static IID => Guid("{c6e13380-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} OutputPinCount 
     * @param {Pointer<Int32>} InputPinCount 
     * @returns {HRESULT} 
     */
    get_PinCounts(OutputPinCount, InputPinCount) {
        result := ComCall(3, this, "int*", OutputPinCount, "int*", InputPinCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputPinIndex 
     * @param {Integer} InputPinIndex 
     * @returns {HRESULT} 
     */
    CanRoute(OutputPinIndex, InputPinIndex) {
        result := ComCall(4, this, "int", OutputPinIndex, "int", InputPinIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputPinIndex 
     * @param {Integer} InputPinIndex 
     * @returns {HRESULT} 
     */
    Route(OutputPinIndex, InputPinIndex) {
        result := ComCall(5, this, "int", OutputPinIndex, "int", InputPinIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputPinIndex 
     * @param {Pointer<Int32>} InputPinIndex 
     * @returns {HRESULT} 
     */
    get_IsRoutedTo(OutputPinIndex, InputPinIndex) {
        result := ComCall(6, this, "int", OutputPinIndex, "int*", InputPinIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} IsInputPin 
     * @param {Integer} PinIndex 
     * @param {Pointer<Int32>} PinIndexRelated 
     * @param {Pointer<Int32>} PhysicalType 
     * @returns {HRESULT} 
     */
    get_CrossbarPinInfo(IsInputPin, PinIndex, PinIndexRelated, PhysicalType) {
        result := ComCall(7, this, "int", IsInputPin, "int", PinIndex, "int*", PinIndexRelated, "int*", PhysicalType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
