#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMTimecodeDisplay interface controls an external SMPTE/MIDI timecode display device.DirectShow currently does not provide any filters that implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtimecodedisplay
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTimecodeDisplay extends IUnknown{
    /**
     * The interface identifier for IAMTimecodeDisplay
     * @type {Guid}
     */
    static IID => Guid("{9b496ce2-811b-11cf-8c77-00aa006b6814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    GetTCDisplayEnable(pState) {
        result := ComCall(3, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    SetTCDisplayEnable(State) {
        result := ComCall(4, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Param 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetTCDisplay(Param, pValue) {
        result := ComCall(5, this, "int", Param, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Param 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetTCDisplay(Param, Value) {
        result := ComCall(6, this, "int", Param, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
