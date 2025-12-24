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
     * @type {Integer} 
     */
    AppSpecific {
        get => this.get_AppSpecific()
        set => this.put_AppSpecific(value)
    }

    /**
     * @type {Integer} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * The get_AppSpecific method retrieves the application-defined tag that identifies the tone to detect.
     * @returns {Integer} Pointer to a value to receive the application-specific identifier for the tone. When the TAPI Server detects the tone, the value of this parameter is passed back to the application in the <b>TE_TONEEVENT</b> event.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdetecttone-get_appspecific
     */
    get_AppSpecific() {
        result := ComCall(7, this, "int*", &plAppSpecific := 0, "HRESULT")
        return plAppSpecific
    }

    /**
     * The put_AppSpecific method sets the application-defined tag that identifies the tone to detect.
     * @param {Integer} lAppSpecific Specifies an application-specific tag that identifies the tone to detect. When the TAPI Server detects the tone, the value of this parameter is passed back to the application in the <b>TE_TONEEVENT</b> event.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdetecttone-put_appspecific
     */
    put_AppSpecific(lAppSpecific) {
        result := ComCall(8, this, "int", lAppSpecific, "HRESULT")
        return result
    }

    /**
     * The get_Duration method retrieves the length of time during which a tone should be present before the TAPI Server generates a tone event.
     * @returns {Integer} Pointer to a value that receives the tone duration, in milliseconds, during which the specified tone should be present.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdetecttone-get_duration
     */
    get_Duration() {
        result := ComCall(9, this, "int*", &plDuration := 0, "HRESULT")
        return plDuration
    }

    /**
     * The put_Duration method sets the length of time during which a tone should be present before the TAPI Server generates a tone event.
     * @param {Integer} lDuration Specifies the tone duration, in milliseconds, during which the specified tone should be present.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdetecttone-put_duration
     */
    put_Duration(lDuration) {
        result := ComCall(10, this, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The get_Frequency method retrieves the frequency of the tone for which the TAPI Server generates a tone event.
     * @param {Integer} Index Specifies the index of the tone.
     * @returns {Integer} Pointer to a value to receive the frequency, in hertz, of the tone. For more information, see the following Remarks section.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdetecttone-get_frequency
     */
    get_Frequency(Index) {
        result := ComCall(11, this, "int", Index, "int*", &plFrequency := 0, "HRESULT")
        return plFrequency
    }

    /**
     * The put_Frequency method sets the frequency of the tone for which the TAPI Server should generate a tone event.
     * @param {Integer} Index Specifies the index of the tone to set.
     * @param {Integer} lFrequency Specifies the frequency, in hertz, of the tone. For more information, see the following Remarks section.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdetecttone-put_frequency
     */
    put_Frequency(Index, lFrequency) {
        result := ComCall(12, this, "int", Index, "int", lFrequency, "HRESULT")
        return result
    }
}
