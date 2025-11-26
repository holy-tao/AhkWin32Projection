#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IMpeg2Stream interface represents a stream of MPEG-2 data. The IMpeg2Data::GetStreamOfSections method returns a pointer to this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMpeg2Stream)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nn-mpeg2data-impeg2stream
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMpeg2Stream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMpeg2Stream
     * @type {Guid}
     */
    static IID => Guid("{400cc286-32a0-4ce4-9041-39571125a635}")

    /**
     * The class identifier for Mpeg2Stream
     * @type {Guid}
     */
    static CLSID => Guid("{f91d96c7-8509-4d0b-ab26-a0dd10904bb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SupplyDataBuffer"]

    /**
     * The Initialize method initializes the MPEG2Stream object. This method should be called once, immediately after creating the object. The IMpeg2Data::GetStreamOfSections method calls this method internally, so typically an application will not call it.
     * @param {Integer} requestType Specifies the request type, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ne-mpeg2structs-mpeg_request_type">MPEG_REQUEST_TYPE</a> value.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2stream-initialize
     */
    Initialize(requestType, pMpeg2Data, pContext, pid, tid, pFilter, hDataReadyEvent) {
        hDataReadyEvent := hDataReadyEvent is Win32Handle ? NumGet(hDataReadyEvent, "ptr") : hDataReadyEvent

        result := ComCall(3, this, "int", requestType, "ptr", pMpeg2Data, "ptr", pContext, "ushort", pid, "char", tid, "ptr", pFilter, "ptr", hDataReadyEvent, "HRESULT")
        return result
    }

    /**
     * The SupplyDataBuffer method provides a buffer for the Mpeg2Stream object to write data.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2stream-supplydatabuffer
     */
    SupplyDataBuffer(pStreamBuffer) {
        result := ComCall(4, this, "ptr", pStreamBuffer, "HRESULT")
        return result
    }
}
