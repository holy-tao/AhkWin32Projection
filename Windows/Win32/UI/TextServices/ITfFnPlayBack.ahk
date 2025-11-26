#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnPlayBack interface is implemented by the Speech API (SAPI) text service. This interface is used by the TSF manager or a client (application or other text service) to control the audio data for speech input text.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnplayback
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnPlayBack extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnPlayBack
     * @type {Guid}
     */
    static IID => Guid("{a3a416a4-0f64-11d3-b5b7-00c04fc324a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryRange", "Play"]

    /**
     * ITfFnPlayBack::QueryRange method
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
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnplayback-queryrange
     */
    QueryRange(pRange, ppNewRange, pfPlayable) {
        pfPlayableMarshal := pfPlayable is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pRange, "ptr*", ppNewRange, pfPlayableMarshal, pfPlayable, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnplayback-play
     */
    Play(pRange) {
        result := ComCall(5, this, "ptr", pRange, "HRESULT")
        return result
    }
}
