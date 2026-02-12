#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Converts between Society of Motion Picture and Television Engineers (SMPTE) time codes and 100-nanosecond time units.
 * @remarks
 * If an object supports this interface, it must expose the interface as a service. To get a pointer to the interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> with the service identifier <b>MF_TIMECODE_SERVICE</b>.
 * 
 * The Advanced Streaming Format (ASF) media source exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imftimecodetranslate
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
     * @remarks
     * When the asynchronous method completes, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftimecodetranslate-endconverttimecodetohns">IMFTimecodeTranslate::EndConvertTimecodeToHNS</a> to complete the asynchronous request.
     * 
     * The value of <i>pPropVarTimecode</i> is a 64-bit unsigned value typed as a <b>LONGLONG</b>. The upper <b>DWORD</b> contains the range. (A <i>range</i> is a continuous series of time codes.) The lower <b>DWORD</b> contains the time code in the form of a hexadecimal number <i>0xhhmmssff</i>,  where each 2-byte sequence is read as a decimal value.
     * 
     * 
     * ```cpp
     * void CreateTimeCode(
     *     DWORD dwFrames,
     *     DWORD dwSeconds,
     *     DWORD dwMinutes,
     *     DWORD dwHours,
     *     DWORD dwRange,
     *     PROPVARIANT *pvar
     *     )
     * {
     *     ULONGLONG ullTimecode = ((ULONGLONG)dwRange) << 32;
     * 
     *     ullTimecode +=   dwFrames  % 10;
     *     ullTimecode += (( (ULONGLONG)dwFrames )  / 10) << 4;
     *     ullTimecode += (( (ULONGLONG)dwSeconds ) % 10) << 8;
     *     ullTimecode += (( (ULONGLONG)dwSeconds ) / 10) << 12;
     *     ullTimecode += (( (ULONGLONG)dwMinutes ) % 10) << 16;
     *     ullTimecode += (( (ULONGLONG)dwMinutes ) / 10) << 20;
     *     ullTimecode += (( (ULONGLONG)dwHours )   % 10) << 24;
     *     ullTimecode += (( (ULONGLONG)dwHours )   / 10) << 28;
     * 
     *     pvar->vt = VT_I8;
     *     pvar->hVal.QuadPart = (LONGLONG)ullTimecode;
     * }
     * 
     * ```
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftimecodetranslate-beginconverttimecodetohns
     */
    BeginConvertTimecodeToHNS(pPropVarTimecode, pCallback, punkState) {
        result := ComCall(3, this, "ptr", pPropVarTimecode, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes an asynchronous request to convert time in Society of Motion Picture and Television Engineers (SMPTE) time code to 100-nanosecond units.
     * @remarks
     * Call this method after the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftimecodetranslate-beginconverttimecodetohns">IMFTimecodeTranslate::BeginConvertTimecodeToHNS</a> method completes asynchronously.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {Integer} Receives the converted time.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftimecodetranslate-endconverttimecodetohns
     */
    EndConvertTimecodeToHNS(pResult) {
        result := ComCall(4, this, "ptr", pResult, "int64*", &phnsTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phnsTime
    }

    /**
     * Starts an asynchronous call to convert time in 100-nanosecond units to Society of Motion Picture and Television Engineers (SMPTE) time code.
     * @remarks
     * When the asynchronous method completes, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftimecodetranslate-endconverthnstotimecode">IMFTimecodeTranslate::EndConvertHNSToTimecode</a> to complete the asynchronous request.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftimecodetranslate-beginconverthnstotimecode
     */
    BeginConvertHNSToTimecode(hnsTime, pCallback, punkState) {
        result := ComCall(5, this, "int64", hnsTime, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes an asynchronous request to convert time in 100-nanosecond units to Society of Motion Picture and Television Engineers (SMPTE) time code.
     * @remarks
     * Call this method after the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftimecodetranslate-beginconverthnstotimecode">IMFTimecodeTranslate::BeginConvertHNSToTimecode</a> method completes asynchronously.
     * 
     * The value of <i>pPropVarTimecode</i> is a 64-bit unsigned value typed as a <b>LONGLONG</b>. The upper <b>DWORD</b> contains the range. (A <i>range</i> is a continuous series of time codes.) The lower <b>DWORD</b> contains the time code in the form of a hexadecimal number <i>0xhhmmssff</i>,  where each 2-byte sequence is read as a decimal value.
     * 
     * 
     * ```cpp
     * HRESULT ParseTimeCode(
     *     const PROPVARIANT& var,
     *     DWORD *pdwRange,
     *     DWORD *pdwFrames,
     *     DWORD *pdwSeconds,
     *     DWORD *pdwMinutes,
     *     DWORD *pdwHours
     *     )
     * {
     *     if (var.vt != VT_I8)
     *     {
     *         return E_INVALIDARG;
     *     }
     * 
     *     ULONGLONG ullTimeCode = (ULONGLONG)var.hVal.QuadPart;
     *     DWORD dwTimecode = (DWORD)(ullTimeCode & 0xFFFFFFFF);
     * 
     *     *pdwRange   = (DWORD)(ullTimeCode >> 32);
     *     *pdwFrames  =     dwTimecode & 0x0000000F;
     *     *pdwFrames  += (( dwTimecode & 0x000000F0) >> 4 )  * 10;
     *     *pdwSeconds =   ( dwTimecode & 0x00000F00) >> 8;
     *     *pdwSeconds += (( dwTimecode & 0x0000F000) >> 12 ) * 10;
     *     *pdwMinutes =   ( dwTimecode & 0x000F0000) >> 16;
     *     *pdwMinutes += (( dwTimecode & 0x00F00000) >> 20 ) * 10;
     *     *pdwHours   =   ( dwTimecode & 0x0F000000) >> 24;
     *     *pdwHours   += (( dwTimecode & 0xF0000000) >> 28 ) * 10;
     * 
     *     return S_OK;
     * }
     * 
     * ```
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {PROPVARIANT} A pointer to a <b>PROPVARIANT</b> that receives the converted time. The <b>vt</b> member of the <b>PROPVARIANT</b> structure is set to VT_I8. The <b>hVal.QuadPart</b> member contains the converted time in binary coded decimal (BCD) form. See Remarks.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftimecodetranslate-endconverthnstotimecode
     */
    EndConvertHNSToTimecode(pResult) {
        pPropVarTimecode := PROPVARIANT()
        result := ComCall(6, this, "ptr", pResult, "ptr", pPropVarTimecode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPropVarTimecode
    }
}
