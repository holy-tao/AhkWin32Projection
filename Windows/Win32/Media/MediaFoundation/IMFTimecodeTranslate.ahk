#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Converts between Society of Motion Picture and Television Engineers (SMPTE) time codes and 100-nanosecond time units.
 * @remarks
 * 
 * If an object supports this interface, it must expose the interface as a service. To get a pointer to the interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> with the service identifier <b>MF_TIMECODE_SERVICE</b>.
 * 
 * The Advanced Streaming Format (ASF) media source exposes this interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftimecodetranslate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimecodeTranslate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimecodeTranslate
     * @type {Guid}
     */
    static IID => Guid("{ab9d8661-f7e8-4ef4-9861-89f334f94e74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginConvertTimecodeToHNS", "EndConvertTimecodeToHNS", "BeginConvertHNSToTimecode", "EndConvertHNSToTimecode"]

    /**
     * Starts an asynchronous call to convert Society of Motion Picture and Television Engineers (SMPTE) time code to 100-nanosecond units.
     * @param {Pointer<PROPVARIANT>} pPropVarTimecode Time in SMPTE time code to convert. The <b>vt</b> member of the <b>PROPVARIANT</b> structure is set to <b>VT_I8</b>. The <b>hVal.QuadPart</b> member contains the time in binary coded decimal (BCD) form. See Remarks.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState PPointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pPropVarTimecode</i> is not <b>VT_I8</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <b>Shutdown</b> method was called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BYTESTREAM_NOT_SEEKABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream is not seekable. The time code cannot be read from the end of the byte stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftimecodetranslate-beginconverttimecodetohns
     */
    BeginConvertTimecodeToHNS(pPropVarTimecode, pCallback, punkState) {
        result := ComCall(3, this, "ptr", pPropVarTimecode, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to convert time in Society of Motion Picture and Television Engineers (SMPTE) time code to 100-nanosecond units.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {Integer} Receives the converted time.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftimecodetranslate-endconverttimecodetohns
     */
    EndConvertTimecodeToHNS(pResult) {
        result := ComCall(4, this, "ptr", pResult, "int64*", &phnsTime := 0, "HRESULT")
        return phnsTime
    }

    /**
     * Starts an asynchronous call to convert time in 100-nanosecond units to Society of Motion Picture and Television Engineers (SMPTE) time code.
     * @param {Integer} hnsTime The time to convert, in 100-nanosecond units.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <b>Shutdown</b> method was called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BYTESTREAM_NOT_SEEKABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream is not seekable. The time code cannot be read from the end of the byte stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftimecodetranslate-beginconverthnstotimecode
     */
    BeginConvertHNSToTimecode(hnsTime, pCallback, punkState) {
        result := ComCall(5, this, "int64", hnsTime, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to convert time in 100-nanosecond units to Society of Motion Picture and Television Engineers (SMPTE) time code.
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {PROPVARIANT} A pointer to a <b>PROPVARIANT</b> that receives the converted time. The <b>vt</b> member of the <b>PROPVARIANT</b> structure is set to VT_I8. The <b>hVal.QuadPart</b> member contains the converted time in binary coded decimal (BCD) form. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftimecodetranslate-endconverthnstotimecode
     */
    EndConvertHNSToTimecode(pResult) {
        pPropVarTimecode := PROPVARIANT()
        result := ComCall(6, this, "ptr", pResult, "ptr", pPropVarTimecode, "HRESULT")
        return pPropVarTimecode
    }
}
