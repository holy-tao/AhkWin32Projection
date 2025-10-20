#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMTimecodeGenerator interface controls how an external SMPTE/MIDI timecode generator supplies data to the filter graph.DirectShow currently does not provide any filters that implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtimecodegenerator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTimecodeGenerator extends IUnknown{
    /**
     * The interface identifier for IAMTimecodeGenerator
     * @type {Guid}
     */
    static IID => Guid("{9b496ce0-811b-11cf-8c77-00aa006b6814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Param 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetTCGMode(Param, pValue) {
        result := ComCall(3, this, "int", Param, "int*", pValue, "int")
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
    SetTCGMode(Param, Value) {
        result := ComCall(4, this, "int", Param, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @returns {HRESULT} 
     */
    put_VITCLine(Line) {
        result := ComCall(5, this, "int", Line, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLine 
     * @returns {HRESULT} 
     */
    get_VITCLine(pLine) {
        result := ComCall(6, this, "int*", pLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TIMECODE_SAMPLE>} pTimecodeSample 
     * @returns {HRESULT} 
     */
    SetTimecode(pTimecodeSample) {
        result := ComCall(7, this, "ptr", pTimecodeSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TIMECODE_SAMPLE>} pTimecodeSample 
     * @returns {HRESULT} 
     */
    GetTimecode(pTimecodeSample) {
        result := ComCall(8, this, "ptr", pTimecodeSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
