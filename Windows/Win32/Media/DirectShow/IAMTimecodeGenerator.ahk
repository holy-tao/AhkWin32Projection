#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\TIMECODE_SAMPLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMTimecodeGenerator interface controls how an external SMPTE/MIDI timecode generator supplies data to the filter graph.DirectShow currently does not provide any filters that implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtimecodegenerator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTimecodeGenerator extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTCGMode", "SetTCGMode", "put_VITCLine", "get_VITCLine", "SetTimecode", "GetTimecode"]

    /**
     * 
     * @param {Integer} Param 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-gettcgmode
     */
    GetTCGMode(Param) {
        result := ComCall(3, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Param 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-settcgmode
     */
    SetTCGMode(Param, Value) {
        result := ComCall(4, this, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-put_vitcline
     */
    put_VITCLine(Line) {
        result := ComCall(5, this, "int", Line, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-get_vitcline
     */
    get_VITCLine() {
        result := ComCall(6, this, "int*", &pLine := 0, "HRESULT")
        return pLine
    }

    /**
     * 
     * @param {Pointer<TIMECODE_SAMPLE>} pTimecodeSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-settimecode
     */
    SetTimecode(pTimecodeSample) {
        result := ComCall(7, this, "ptr", pTimecodeSample, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {TIMECODE_SAMPLE} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-gettimecode
     */
    GetTimecode() {
        pTimecodeSample := TIMECODE_SAMPLE()
        result := ComCall(8, this, "ptr", pTimecodeSample, "HRESULT")
        return pTimecodeSample
    }
}
