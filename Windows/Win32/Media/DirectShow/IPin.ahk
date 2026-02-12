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
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-ipin
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
     * @remarks
     * The <i>pmt</i> parameter can be <b>NULL</b>. It can also specify a partial media type, with a value of GUID_NULL for the major type, subtype, or format.
     * 
     * This method verifies that the connection is possible. If the pin rejects the connection, the method fails. The connecting pin proposes media types by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-receiveconnection">IPin::ReceiveConnection</a> on the receiving pin.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-connect
     */
    Connect(pReceivePin, pmt) {
        result := ComCall(3, this, "ptr", pReceivePin, "ptr", pmt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ReceiveConnection method accepts a connection from another pin.
     * @remarks
     * When an output pin connects, it calls this method on the input pin. The input pin should verify that the specified media type is acceptable. It may also need to check for other connection requirements specific to the owning filter. If the connection is suitable, the input pin should return S_OK, and also do the following:
     * 
     * <ul>
     * <li>Store the media type, and return the same type in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-connectionmediatype">IPin::ConnectionMediaType</a> method.</li>
     * <li>Store the output pin's <b>IPin</b> interface (<i>pConnector</i>), and return this pointer in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-connectedto">IPin::ConnectedTo</a> method.</li>
     * </ul>
     * If the connection is unsuitable, the pin should return an error code.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasepin">CBasePin</a> class implements the basic framework for this method, including storing the media type and <b>IPin</b> pointers.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-receiveconnection
     */
    ReceiveConnection(pConnector, pmt) {
        result := ComCall(4, this, "ptr", pConnector, "ptr", pmt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Disconnect method breaks the current pin connection.
     * @remarks
     * This method fails if the filter is paused or running. If the pin supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipinconnection">IPinConnection</a> interface, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipinconnection-dynamicdisconnect">IPinConnection::DynamicDisconnect</a> to disconnect the pin when the filter is paused or running.
     * 
     * This method does not disconnect the other pin in the pin connection.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-disconnect
     */
    Disconnect() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ConnectedTo method retrieves a pointer to the connected pin, if any.
     * @remarks
     * If the method succeeds, the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface that it returns has an outstanding reference count. Be sure to release it when you are done.
     * @returns {IPin} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the other pin. The caller must release the interface. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-connectedto
     */
    ConnectedTo() {
        result := ComCall(6, this, "ptr*", &pPin := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPin(pPin)
    }

    /**
     * The ConnectionMediaType method retrieves the media type for the current pin connection, if any.
     * @remarks
     * If the pin is connected, this method copies the media type into the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure specified by <i>pmt</i>. The caller must free the media type's format block. You can use the Microsoft® Win32®<b>CoTaskMemFree</b> function, or the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/freemediatype">FreeMediaType</a> helper function.
     * 
     * If the pin is not connected, this method clears the media type specified by <i>pmt</i> and returns an error code.
     * @returns {AM_MEDIA_TYPE} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that receives the media type.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-connectionmediatype
     */
    ConnectionMediaType() {
        pmt := AM_MEDIA_TYPE()
        result := ComCall(7, this, "ptr", pmt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pmt
    }

    /**
     * The QueryPinInfo method retrieves information about the pin.
     * @remarks
     * When the method returns, if the <b>pFilter</b> member of the PIN_INFO structure is non-<b>NULL</b>, it has an outstanding reference count. Be sure to release the interface when you are done.
     * @returns {PIN_INFO} Pointer to a [PIN_INFO](/windows/desktop/api/strmif/ns-strmif-pin_info) structure that receives the pin information.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-querypininfo
     */
    QueryPinInfo() {
        pInfo := PIN_INFO()
        result := ComCall(8, this, "ptr", pInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInfo
    }

    /**
     * The QueryDirection method gets the direction of the pin (input or output).
     * @returns {Integer} Receives a member of the [PIN_DIRECTION](/windows/desktop/api/strmif/ne-strmif-pin_direction) enumerated type.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-querydirection
     */
    QueryDirection() {
        result := ComCall(9, this, "int*", &pPinDir := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPinDir
    }

    /**
     * The QueryId method retrieves an identifier for the pin.
     * @remarks
     * This method supports graph persistence. Use this method to save a pin's state, and the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ibasefilter-findpin">IBaseFilter::FindPin</a> method to restore the state. The pin's identifier string is defined by the filter implementation. The identifier must be unique within the filter.
     * 
     * <div class="alert"><b>Note</b>  The <i>pin identifier</i> is not necessarily the same as the <i>pin name</i> that the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-querypininfo">QueryPinInfo</a> method returns.</div>
     * <div> </div>
     * The filter allocates the returned string using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function. The caller must free it using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Receives a string containing the pin identifier.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-queryid
     */
    QueryId() {
        result := ComCall(10, this, "ptr*", &Id := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Id
    }

    /**
     * The QueryAccept method determines whether the pin accepts a specified media type.
     * @remarks
     * A return value of S_OK indicates that the pin will accept the media type, either on the next sample, or after a pin reconnection. The implementation should take into account the current state of the filter, including connections on other pins, and any properties that can be set on the filter.
     * 
     * Any other return value, including S_FALSE, means that the pin rejects the media type. Therefore, test for S_OK explicitly; do not use the <b>SUCCEEDED</b> macro.
     * 
     * If the filter is running, a return value of S_OK is ambiguous. The pin might accept a format change on the next media sample, without reconnecting; or it might need to reconnect. If the pin supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipinconnection">IPinConnection</a> interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipinconnection-dynamicqueryaccept">IPinConnection::DynamicQueryAccept</a> method, which specifically tests whether the pin can accept the new type without reconnecting.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-queryaccept
     */
    QueryAccept(pmt) {
        result := ComCall(11, this, "ptr", pmt, "int")
        return result
    }

    /**
     * The EnumMediaTypes method enumerates the pin's preferred media types.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienummediatypes">IEnumMediaTypes</a> interface works like a standard COM enumerator. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/enumerating-objects-in-a-filter-graph">Enumerating Objects in a Filter Graph</a>. If the method succeeds, the <b>IEnumMediaTypes</b> interface has an outstanding reference count. Be sure to release it when you are done.
     * @returns {IEnumMediaTypes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienummediatypes">IEnumMediaTypes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-enummediatypes
     */
    EnumMediaTypes() {
        result := ComCall(12, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumMediaTypes(ppEnum)
    }

    /**
     * The QueryInternalConnections method retrieves the pins that are connected internally to this pin (within the filter).
     * @remarks
     * This method returns information about the filter's internal mapping of input pins to output pins. In other words, it describes how the input pins deliver data to the output pins.
     * 
     * In most filters, every input pin connects to every output pin. For example, in a transform filter, one input connects to one output; in a splitter filter, one input connects to multiple outputs. In these cases, the method should simply return E_NOTIMPL.
     * 
     * Otherwise, the method returns an array of <b>IPin</b> pointers, one for each pin that is mapped internally to the pin you have queried. If you call the method on an input pin, the array contains pointers to output pins, and vice versa.
     * 
     * The caller allocates the array of <b>IPin</b> pointers. To get the required array size, call the method once with <i>apPin</i> equal to <b>NULL</b>. The size is returned in the <i>nPin</i> parameter. Then allocate the array and call the method again, setting <i>apPin</i> equal to the address of the array and <i>nPin</i> equal to the array size. The method then fills the array with <b>IPin</b> pointers. Each returned pointer has an outstanding reference count and must be released by the caller.
     * 
     * This method has another use that is now deprecated: The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-graph-manager">Filter Graph Manager</a> treats a filter as being a renderer filter if at least one input pin implements this method but returns zero in <i>nPin</i>. If you are writing a new renderer filter, however, you should implement the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamfiltermiscflags">IAMFilterMiscFlags</a> interface instead of using this method to indicate that the filter is a renderer.
     * @param {Pointer<Integer>} nPin On input, specifies the size of the array. On output, specifies the number of internally connected pins.
     * @returns {IPin} Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> pointers. The caller allocates the array. The method fills the array with <b>IPin</b> pointers. If <i>nPin</i> is zero, this parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-queryinternalconnections
     */
    QueryInternalConnections(nPin) {
        nPinMarshal := nPin is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr*", &apPin := 0, nPinMarshal, nPin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPin(apPin)
    }

    /**
     * The EndOfStream method notifies the pin that no additional data is expected, until a new run command is issued to the filter.
     * @remarks
     * Call this method only on input pins. Output pins return E_UNEXPECTED.
     * 
     * This method sends an end-of-stream notification to the pin. The pin delivers the notification downstream. It must serialize end-of-stream notifications with <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imeminputpin-receive">IMemInputPin::Receive</a> calls. If the pin queues media samples for delivery, it should queue end-of-stream notifications as well. The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-beginflush">IPin::BeginFlush</a> method flushes any queued end-of-stream notifications.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-endofstream
     */
    EndOfStream() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The BeginFlush method begins a flush operation. (IPin.BeginFlush)
     * @remarks
     * Call this method only on input pins. Output pins return E_UNEXPECTED.
     * 
     * In a flush operation, a filter discards whatever data it was processing. It rejects new data until the flush is completed. The flush is completed when the upstream pin calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-endflush">IPin::EndFlush</a> method. Flushing enables the filter graph to be more responsive when events alter the normal data flow. For example, flushing occurs during a seek.
     * 
     * When <c>BeginFlush</c> is called, the filter performs the following steps:
     * 
     * <ol>
     * <li>Passes the <c>IPin::BeginFlush</c> call downstream.</li>
     * <li>Sets an internal flag that causes all data-streaming methods to fail, such as <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imeminputpin-receive">IMemInputPin::Receive</a>.</li>
     * <li>Returns from any blocked calls to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imeminputpin-receive">Receive</a> method.</li>
     * </ol>
     * When the <c>BeginFlush</c> notification reaches a renderer filter, the renderer frees any samples that it holds.
     * 
     * After <c>BeginFlush</c> is called, the pin rejects all samples from upstream, with a return value of S_FALSE, until the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-endflush">IPin::EndFlush</a> method is called.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-beginflush
     */
    BeginFlush() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The EndFlush method ends a flush operation. (IPin.EndFlush)
     * @remarks
     * Call this method only on input pins. Output pins return E_UNEXPECTED.
     * 
     * When this method is called, the filter performs the following actions:
     * 
     * <ol>
     * <li>Waits for all queued samples to be discarded.</li>
     * <li>Frees any buffered data, including any pending end-of-stream notifications.</li>
     * <li>Clears any pending <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-complete">EC_COMPLETE</a> notifications.</li>
     * <li>Calls <c>EndFlush</c> downstream.</li>
     * </ol>
     * When the method returns, the pin can accept new samples.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-endflush
     */
    EndFlush() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The NewSegment method notifies the pin that media samples received after this call are grouped as a segment, with a common start time, stop time, and rate.
     * @remarks
     * A source filter (or parser filter) calls this method at the start of each new stream and after each seek operation. It calls the method on the input pin of the downstream filter, after delivering the previous batch of data and before calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imeminputpin-receive">IMemInputPin::Receive</a> with any new data. The downstream filter propagates the <c>NewSegment</c> call downstream.
     * 
     * Filters can use segment information to process samples. For example, with some formats it is impossible to reconstruct a delta frame without the next key frame. Therefore, if the stop time occurs on a delta frame, the source filter must send some additional frames. The decoder filter determines the final frame based on the segment information. The segment rate is used to render continuous data sources, such as audio data. For example, the audio renderer uses the sampling rate and the segment rate to render the audio data correctly.
     * @param {Integer} tStart Start time of the segment, relative to the original source, in 100-nanosecond units.
     * @param {Integer} tStop End time of the segment, relative to the original source, in 100-nanosecond units.
     * @param {Float} dRate Rate at which this segment should be processed, as a percentage of the original rate.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipin-newsegment
     */
    NewSegment(tStart, tStop, dRate) {
        result := ComCall(17, this, "int64", tStart, "int64", tStop, "double", dRate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
