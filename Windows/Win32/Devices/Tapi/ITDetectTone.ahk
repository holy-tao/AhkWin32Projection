#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDetectTone interface exposes methods that allow an application to specify the tones and tone characteristics that should cause the TAPI Server to generate a tone event.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdetecttone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDetectTone extends IDispatch{
    /**
     * The interface identifier for ITDetectTone
     * @type {Guid}
     */
    static IID => Guid("{961f79bd-3097-49df-a1d6-909b77e89ca0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plAppSpecific 
     * @returns {HRESULT} 
     */
    get_AppSpecific(plAppSpecific) {
        result := ComCall(7, this, "int*", plAppSpecific, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAppSpecific 
     * @returns {HRESULT} 
     */
    put_AppSpecific(lAppSpecific) {
        result := ComCall(8, this, "int", lAppSpecific, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDuration 
     * @returns {HRESULT} 
     */
    get_Duration(plDuration) {
        result := ComCall(9, this, "int*", plDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     */
    put_Duration(lDuration) {
        result := ComCall(10, this, "int", lDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Int32>} plFrequency 
     * @returns {HRESULT} 
     */
    get_Frequency(Index, plFrequency) {
        result := ComCall(11, this, "int", Index, "int*", plFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} lFrequency 
     * @returns {HRESULT} 
     */
    put_Frequency(Index, lFrequency) {
        result := ComCall(12, this, "int", Index, "int", lFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
