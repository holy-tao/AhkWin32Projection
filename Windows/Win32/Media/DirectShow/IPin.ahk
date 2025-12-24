#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPin.ahk
#Include ..\MediaFoundation\AM_MEDIA_TYPE.ahk
#Include .\PIN_INFO.ahk
#Include .\IEnumMediaTypes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is exposed by all input and output pins.The filter graph manager uses this interface to connect pins and perform flushing operations.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ipin
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPin
     * @type {Guid}
     */
    static IID => Guid("{56a86891-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "ReceiveConnection", "Disconnect", "ConnectedTo", "ConnectionMediaType", "QueryPinInfo", "QueryDirection", "QueryId", "QueryAccept", "EnumMediaTypes", "QueryInternalConnections", "EndOfStream", "BeginFlush", "EndFlush", "NewSegment"]

    /**
     * The Connect method connects the pin to another pin.
     * @param {IPin} pReceivePin Pointer to the receiving pin's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type for the connection. Can be <b>NULL</b>.
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
     * <dt><b>VFW_E_ALREADY_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is already connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NO_ACCEPTABLE_TYPES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot find an acceptable media type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NO_TRANSPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pins cannot agree on a transport, or there is no allocator for the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter is active and the pin does not support dynamic reconnection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_TYPE_NOT_ACCEPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified media type is not acceptable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-connect
     */
    Connect(pReceivePin, pmt) {
        result := ComCall(3, this, "ptr", pReceivePin, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The ReceiveConnection method accepts a connection from another pin.
     * @param {IPin} pConnector Pointer to the connecting pin's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type for the connection.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_ALREADY_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is already connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot connect while filter is active.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_TYPE_NOT_ACCEPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified media type is not acceptable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-receiveconnection
     */
    ReceiveConnection(pConnector, pmt) {
        result := ComCall(4, this, "ptr", pConnector, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The Disconnect method breaks the current pin connection.
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
     * The pin was not connected.
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
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter is active.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-disconnect
     */
    Disconnect() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The ConnectedTo method retrieves a pointer to the connected pin, if any.
     * @returns {IPin} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the other pin. The caller must release the interface. This parameter cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-connectedto
     */
    ConnectedTo() {
        result := ComCall(6, this, "ptr*", &pPin := 0, "HRESULT")
        return IPin(pPin)
    }

    /**
     * The ConnectionMediaType method retrieves the media type for the current pin connection, if any.
     * @returns {AM_MEDIA_TYPE} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that receives the media type.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-connectionmediatype
     */
    ConnectionMediaType() {
        pmt := AM_MEDIA_TYPE()
        result := ComCall(7, this, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The QueryPinInfo method retrieves information about the pin.
     * @returns {PIN_INFO} Pointer to a [PIN_INFO](/windows/desktop/api/strmif/ns-strmif-pin_info) structure that receives the pin information.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-querypininfo
     */
    QueryPinInfo() {
        pInfo := PIN_INFO()
        result := ComCall(8, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * The QueryDirection method gets the direction of the pin (input or output).
     * @returns {Integer} Receives a member of the [PIN_DIRECTION](/windows/desktop/api/strmif/ne-strmif-pin_direction) enumerated type.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-querydirection
     */
    QueryDirection() {
        result := ComCall(9, this, "int*", &pPinDir := 0, "HRESULT")
        return pPinDir
    }

    /**
     * The QueryId method retrieves an identifier for the pin.
     * @returns {PWSTR} Receives a string containing the pin identifier.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-queryid
     */
    QueryId() {
        result := ComCall(10, this, "ptr*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * The QueryAccept method determines whether the pin accepts a specified media type.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type.
     * @returns {HRESULT} Returns one of the following values:
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
     * The pin rejects the media type.
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
     * The pin accepts the media type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-queryaccept
     */
    QueryAccept(pmt) {
        result := ComCall(11, this, "ptr", pmt, "int")
        return result
    }

    /**
     * The EnumMediaTypes method enumerates the pin's preferred media types.
     * @returns {IEnumMediaTypes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienummediatypes">IEnumMediaTypes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-enummediatypes
     */
    EnumMediaTypes() {
        result := ComCall(12, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumMediaTypes(ppEnum)
    }

    /**
     * The QueryInternalConnections method retrieves the pins that are connected internally to this pin (within the filter).
     * @param {Pointer<Integer>} nPin On input, specifies the size of the array. On output, specifies the number of internally connected pins.
     * @returns {IPin} Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> pointers. The caller allocates the array. The method fills the array with <b>IPin</b> pointers. If <i>nPin</i> is zero, this parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-queryinternalconnections
     */
    QueryInternalConnections(nPin) {
        nPinMarshal := nPin is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr*", &apPin := 0, nPinMarshal, nPin, "HRESULT")
        return IPin(apPin)
    }

    /**
     * The EndOfStream method notifies the pin that no additional data is expected, until a new run command is issued to the filter.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is an output pin.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-endofstream
     */
    EndOfStream() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The BeginFlush method begins a flush operation.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is an output pin.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-beginflush
     */
    BeginFlush() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The EndFlush method ends a flush operation.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is an output pin.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-endflush
     */
    EndFlush() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The NewSegment method notifies the pin that media samples received after this call are grouped as a segment, with a common start time, stop time, and rate.
     * @param {Integer} tStart Start time of the segment, relative to the original source, in 100-nanosecond units.
     * @param {Integer} tStop End time of the segment, relative to the original source, in 100-nanosecond units.
     * @param {Float} dRate Rate at which this segment should be processed, as a percentage of the original rate.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipin-newsegment
     */
    NewSegment(tStart, tStop, dRate) {
        result := ComCall(17, this, "int64", tStart, "int64", tStop, "double", dRate, "HRESULT")
        return result
    }
}
