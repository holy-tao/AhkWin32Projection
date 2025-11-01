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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppSpecific", "put_AppSpecific", "get_Duration", "put_Duration", "get_Frequency", "put_Frequency"]

    /**
     * 
     * @param {Pointer<Integer>} plAppSpecific 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-get_appspecific
     */
    get_AppSpecific(plAppSpecific) {
        plAppSpecificMarshal := plAppSpecific is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plAppSpecificMarshal, plAppSpecific, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lAppSpecific 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-put_appspecific
     */
    put_AppSpecific(lAppSpecific) {
        result := ComCall(8, this, "int", lAppSpecific, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-get_duration
     */
    get_Duration(plDuration) {
        plDurationMarshal := plDuration is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plDurationMarshal, plDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-put_duration
     */
    put_Duration(lDuration) {
        result := ComCall(10, this, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} plFrequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-get_frequency
     */
    get_Frequency(Index, plFrequency) {
        plFrequencyMarshal := plFrequency is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", Index, plFrequencyMarshal, plFrequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} lFrequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-put_frequency
     */
    put_Frequency(Index, lFrequency) {
        result := ComCall(12, this, "int", Index, "int", lFrequency, "HRESULT")
        return result
    }
}
