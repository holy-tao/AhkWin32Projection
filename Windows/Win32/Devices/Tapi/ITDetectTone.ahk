#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITDetectTone interface exposes methods that allow an application to specify the tones and tone characteristics that should cause the TAPI Server to generate a tone event.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itdetecttone
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITDetectTone extends IDispatch {
    /**
     * The interface identifier for ITDetectTone
     * @type {Guid}
     */
    static IID := Guid("{961f79bd-3097-49df-a1d6-909b77e89ca0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITDetectTone interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AppSpecific : IntPtr
        put_AppSpecific : IntPtr
        get_Duration    : IntPtr
        put_Duration    : IntPtr
        get_Frequency   : IntPtr
        put_Frequency   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITDetectTone.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-get_appspecific
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-put_appspecific
     */
    put_AppSpecific(lAppSpecific) {
        result := ComCall(8, this, "int", lAppSpecific, "HRESULT")
        return result
    }

    /**
     * The get_Duration method retrieves the length of time during which a tone should be present before the TAPI Server generates a tone event.
     * @returns {Integer} Pointer to a value that receives the tone duration, in milliseconds, during which the specified tone should be present.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-get_duration
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-put_duration
     */
    put_Duration(lDuration) {
        result := ComCall(10, this, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The get_Frequency method retrieves the frequency of the tone for which the TAPI Server generates a tone event.
     * @remarks
     * You can set up to three frequencies that make up the components of a tone. If fewer than three frequencies are required, specify a value of zero for the unused frequencies. A tone with all three frequencies set to zero is interpreted as silence and can be used for silence detection.
     * @param {Integer} Index Specifies the index of the tone.
     * @returns {Integer} Pointer to a value to receive the frequency, in hertz, of the tone. For more information, see the following Remarks section.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-get_frequency
     */
    get_Frequency(Index) {
        result := ComCall(11, this, "int", Index, "int*", &plFrequency := 0, "HRESULT")
        return plFrequency
    }

    /**
     * The put_Frequency method sets the frequency of the tone for which the TAPI Server should generate a tone event.
     * @remarks
     * You can set up to three frequencies that make up the components of a tone. If fewer than three frequencies are required, specify a value of zero for the unused frequencies. A tone with all three frequencies set to zero is interpreted as silence and can be used for silence detection.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdetecttone-put_frequency
     */
    put_Frequency(Index, lFrequency) {
        result := ComCall(12, this, "int", Index, "int", lFrequency, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITDetectTone.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AppSpecific := CallbackCreate(GetMethod(implObj, "get_AppSpecific"), flags, 2)
        this.vtbl.put_AppSpecific := CallbackCreate(GetMethod(implObj, "put_AppSpecific"), flags, 2)
        this.vtbl.get_Duration := CallbackCreate(GetMethod(implObj, "get_Duration"), flags, 2)
        this.vtbl.put_Duration := CallbackCreate(GetMethod(implObj, "put_Duration"), flags, 2)
        this.vtbl.get_Frequency := CallbackCreate(GetMethod(implObj, "get_Frequency"), flags, 3)
        this.vtbl.put_Frequency := CallbackCreate(GetMethod(implObj, "put_Frequency"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AppSpecific)
        CallbackFree(this.vtbl.put_AppSpecific)
        CallbackFree(this.vtbl.get_Duration)
        CallbackFree(this.vtbl.put_Duration)
        CallbackFree(this.vtbl.get_Frequency)
        CallbackFree(this.vtbl.put_Frequency)
    }
}
