#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MPEG_REQUEST_TYPE.ahk" { MPEG_REQUEST_TYPE }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\MPEG2_FILTER.ahk" { MPEG2_FILTER }
#Import ".\MPEG_CONTEXT.ahk" { MPEG_CONTEXT }
#Import ".\MPEG_STREAM_BUFFER.ahk" { MPEG_STREAM_BUFFER }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMpeg2Stream interface represents a stream of MPEG-2 data. The IMpeg2Data::GetStreamOfSections method returns a pointer to this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMpeg2Stream)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nn-mpeg2data-impeg2stream
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMpeg2Stream extends IUnknown {
    /**
     * The interface identifier for IMpeg2Stream
     * @type {Guid}
     */
    static IID := Guid("{400cc286-32a0-4ce4-9041-39571125a635}")

    /**
     * The class identifier for Mpeg2Stream
     * @type {Guid}
     */
    static CLSID := Guid("{f91d96c7-8509-4d0b-ab26-a0dd10904bb7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMpeg2Stream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize       : IntPtr
        SupplyDataBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMpeg2Stream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Initialize method initializes the MPEG2Stream object. This method should be called once, immediately after creating the object. The IMpeg2Data::GetStreamOfSections method calls this method internally, so typically an application will not call it.
     * @param {MPEG_REQUEST_TYPE} requestType Specifies the request type, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ne-mpeg2structs-mpeg_request_type">MPEG_REQUEST_TYPE</a> value.
     * @param {IMpeg2Data} pMpeg2Data Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables filter.
     * @param {Pointer<MPEG_CONTEXT>} pContext Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_context">MPEG_CONTEXT</a> structure. This structure indicates the MPEG-2 source.
     * @param {Integer} pid Specifies a packet identifier (PID), indicating which packets in the transport stream are requested.
     * @param {Integer} tid Specifies a table identifier (TID), indicating which table sections to retrieve.
     * @param {Pointer<MPEG2_FILTER>} pFilter Optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter">MPEG2_FILTER</a> structure. The caller can use this parameter to exclude packets based on additional MPEG-2 header fields. This parameter can be <b>NULL</b>.
     * @param {HANDLE} hDataReadyEvent Handle to an event. The filter signals this event whenever it receives new data.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * Invalid or <b>NULL</b> pointer argument.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method has been called on this object already.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2stream-initialize
     */
    Initialize(requestType, pMpeg2Data, pContext, pid, tid, pFilter, hDataReadyEvent) {
        result := ComCall(3, this, MPEG_REQUEST_TYPE, requestType, "ptr", pMpeg2Data, MPEG_CONTEXT.Ptr, pContext, "ushort", pid, "char", tid, MPEG2_FILTER.Ptr, pFilter, HANDLE, hDataReadyEvent, "HRESULT")
        return result
    }

    /**
     * The SupplyDataBuffer method provides a buffer for the Mpeg2Stream object to write data.
     * @remarks
     * The first time this method is called, it starts a worker thread that streams data to the buffer. When the data arrives, the <b>MPEG2Stream</b> object signals the event that was passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nf-mpeg2data-impeg2stream-initialize">IMpeg2Stream::Initialize</a> method. (Typically an application specifies the event handle when it calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nf-mpeg2data-impeg2data-getstreamofsections">IMpeg2Data::GetStreamOfSections</a>.)
     * 
     * When the event is signaled, examine the <b>hr</b> field of the <b>MPEG_STREAM_BUFFER</b> structure. If this value is a success code, the request was successful and the buffer contains valid data. To get more data, call the <b>SupplyDataBuffer</b> method again and wait for the event to be signaled.
     * 
     * The section headers are not converted from network byte order or otherwise processed.
     * 
     * If the object is still waiting for data, this method returns E_FAIL.
     * @param {Pointer<MPEG_STREAM_BUFFER>} pStreamBuffer Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_stream_buffer">MPEG_STREAM_BUFFER</a> structure allocated by the caller. This structure contains a pointer to the buffer, also allocated by the caller. The buffer must be at least 4096 bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * The method succeeded.
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
     * Invalid argument or <b>NULL</b> parameter.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2stream-supplydatabuffer
     */
    SupplyDataBuffer(pStreamBuffer) {
        result := ComCall(4, this, MPEG_STREAM_BUFFER.Ptr, pStreamBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMpeg2Stream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 8)
        this.vtbl.SupplyDataBuffer := CallbackCreate(GetMethod(implObj, "SupplyDataBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.SupplyDataBuffer)
    }
}
