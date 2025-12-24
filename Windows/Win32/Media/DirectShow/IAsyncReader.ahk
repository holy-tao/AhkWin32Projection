#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMemAllocator.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAsyncReader interface performs an asynchronous data request on a filter.This interface is exposed by output pins that perform asynchronous read operations.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iasyncreader
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAsyncReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncReader
     * @type {Guid}
     */
    static IID => Guid("{56a868aa-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAllocator", "Request", "WaitForNext", "SyncReadAligned", "SyncRead", "Length", "BeginFlush", "EndFlush"]

    /**
     * The RequestAllocator method requests an allocator during the pin connection.
     * @param {IMemAllocator} pPreferred Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imemallocator">IMemAllocator</a> interface on the input pin's preferred allocator, or <b>NULL</b>.
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps Specifies the address of an [ALLOCATOR_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-allocator_properties) structure, allocated by the caller. The caller should fill in any allocator properties that the input pin requires, and set the remaining members to zero.
     * @returns {IMemAllocator} Address of a variable that receives an <b>IMemAllocator</b> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iasyncreader-requestallocator
     */
    RequestAllocator(pPreferred, pProps) {
        result := ComCall(3, this, "ptr", pPreferred, "ptr", pProps, "ptr*", &ppActual := 0, "HRESULT")
        return IMemAllocator(ppActual)
    }

    /**
     * The Request method queues an asynchronous request for data.
     * @param {IMediaSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface of a media sample provided by the caller.
     * @param {Pointer} dwUser Specifies an arbitrary value that is returned when the request completes.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_BADALIGN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is not aligned correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_SAMPLE_TIME_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample was not time stamped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is flushing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_HANDLE_EOF)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested start position is past the end of the file.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iasyncreader-request
     */
    Request(pSample, dwUser) {
        result := ComCall(4, this, "ptr", pSample, "ptr", dwUser, "HRESULT")
        return result
    }

    /**
     * The WaitForNext method waits for the next pending read request to complete.
     * @param {Integer} dwTimeout Specifies a time-out in milliseconds. Use the value INFINITE to wait indefinitely
     * @param {Pointer<IMediaSample>} ppSample Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface pointer.
     * @param {Pointer<Pointer>} pdwUser Pointer to a variable that receives the value of the <i>dwUser</i> parameter specified in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iasyncreader-request">IAsyncReader::Request</a> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out expired, or the pin is flushing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is flushing.
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
     * A read error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reached the end of the file; retrieved fewer bytes than requested.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iasyncreader-waitfornext
     */
    WaitForNext(dwTimeout, ppSample, pdwUser) {
        pdwUserMarshal := pdwUser is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", dwTimeout, "ptr*", ppSample, pdwUserMarshal, pdwUser, "HRESULT")
        return result
    }

    /**
     * The SyncReadAligned method performs a synchronous read. The method blocks until the request is completed. The file positions and the buffer address must be aligned; check the allocator properties for the required alignment.
     * @param {IMediaSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface of a media sample provided by the caller.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_BADALIGN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid alignment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieved fewer bytes than requested. (Probably the end of the file was reached.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iasyncreader-syncreadaligned
     */
    SyncReadAligned(pSample) {
        result := ComCall(6, this, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * The SyncRead method performs a synchronous read. The method blocks until the request is completed. The file positions and the buffer address do not have to be aligned. If the request is not aligned, the method performs a buffered read operation.
     * @param {Integer} llPosition Specifies the byte offset at which to begin reading. The method fails if this value is beyond the end of the file.
     * @param {Integer} lLength Specifies the number of bytes to read.
     * @param {Pointer} pBuffer Pointer to a buffer that receives the data.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieved fewer bytes than requested. (Probably the end of the file was reached.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iasyncreader-syncread
     */
    SyncRead(llPosition, lLength, pBuffer) {
        result := ComCall(7, this, "int64", llPosition, "int", lLength, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * The Length method retrieves the total length of the stream.
     * @param {Pointer<Integer>} pTotal Pointer to a variable that receives the length of the stream, in bytes.
     * @param {Pointer<Integer>} pAvailable Pointer to a variable that receives the portion of the stream that is currently available, in bytes.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_ESTIMATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned values are estimates; for example, if the file is being read over a network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is not open or no longer exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iasyncreader-length
     */
    Length(pTotal, pAvailable) {
        pTotalMarshal := pTotal is VarRef ? "int64*" : "ptr"
        pAvailableMarshal := pAvailable is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, pTotalMarshal, pTotal, pAvailableMarshal, pAvailable, "HRESULT")
        return result
    }

    /**
     * The BeginFlush method begins a flush operation.
     * @returns {HRESULT} Returns S_OK if successful, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iasyncreader-beginflush
     */
    BeginFlush() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The EndFlush method ends a flush operation.
     * @returns {HRESULT} Returns S_OK if successful, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iasyncreader-endflush
     */
    EndFlush() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
