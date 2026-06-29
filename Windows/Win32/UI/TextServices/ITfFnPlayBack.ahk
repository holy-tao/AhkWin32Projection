#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The ITfFnPlayBack interface is implemented by the Speech API (SAPI) text service. This interface is used by the TSF manager or a client (application or other text service) to control the audio data for speech input text.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnplayback
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnPlayBack extends ITfFunction {
    /**
     * The interface identifier for ITfFnPlayBack
     * @type {Guid}
     */
    static IID := Guid("{a3a416a4-0f64-11d3-b5b7-00c04fc324a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnPlayBack interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        QueryRange : IntPtr
        Play       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnPlayBack.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnPlayBack::QueryRange method
     * @remarks
     * The current implementation of this method is simple. It clones <i>pRange</i>, places the clone in <i>ppNewRange</i>, sets <i>pfPlayable</i> to <b>TRUE</b> and returns S_OK.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers all or part of the text that contains audio data.
     * @param {Pointer<ITfRange>} ppNewRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> pointer that receives a range object that covers all of the text that contains audio data. If there is no audio data for the text covered by <i>pRange</i>, this parameters receives <b>NULL</b>. In this case, the method returns S_OK, so the caller must verify that this parameter is not <b>NULL</b> before using the pointer.
     * @param {Pointer<BOOL>} pfPlayable Pointer to a <b>BOOL</b> that receives zero if none of the text covered by <i>pRange</i> has any audio data or nonzero otherwise.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnplayback-queryrange
     */
    QueryRange(pRange, ppNewRange, pfPlayable) {
        pfPlayableMarshal := pfPlayable is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pRange, ITfRange.Ptr, ppNewRange, pfPlayableMarshal, pfPlayable, "HRESULT")
        return result
    }

    /**
     * ITfFnPlayBack::Play method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to play the audio data for. This range object is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnplayback-queryrange">ITfFnPlayBack::QueryRange</a>.
     * 
     * If the range has zero length, the range played is expanded to cover the entire spoken phrase. If the range has a nonzero length, the range played is expanded to include the entire word, or words, that the range partially covers.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnplayback-play
     */
    Play(pRange) {
        result := ComCall(5, this, "ptr", pRange, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnPlayBack.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryRange := CallbackCreate(GetMethod(implObj, "QueryRange"), flags, 4)
        this.vtbl.Play := CallbackCreate(GetMethod(implObj, "Play"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryRange)
        CallbackFree(this.vtbl.Play)
    }
}
