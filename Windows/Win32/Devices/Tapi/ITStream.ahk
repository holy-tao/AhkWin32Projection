#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumTerminal.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITStream interfaces expose methods that allow an application to retrieve information on a stream; to start, pause, or stop the stream; to select or unselect terminals on a stream; and to obtain a list of terminals selected on the stream.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nn-tapi3if-itstream
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITStream extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITStream
     * @type {Guid}
     */
    static IID => Guid("{ee3bd605-3868-11d2-a045-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaType", "get_Direction", "get_Name", "StartStream", "PauseStream", "StopStream", "SelectTerminal", "UnselectTerminal", "EnumerateTerminals", "get_Terminals"]

    /**
     * @type {Integer} 
     */
    MediaType {
        get => this.get_MediaType()
    }

    /**
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT} 
     */
    Terminals {
        get => this.get_Terminals()
    }

    /**
     * The get_MediaType method gets the stream's media type.
     * @returns {Integer} Pointer to media type descriptor.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-get_mediatype
     */
    get_MediaType() {
        result := ComCall(7, this, "int*", &plMediaType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plMediaType
    }

    /**
     * The get_Direction method gets the stream's terminal direction.
     * @remarks
     * Terminals of either direction can, in general, be selected on any stream whose media type matches the terminal's media type. However, some MSPs allow only terminals whose terminal direction matches the stream's terminal direction to be selected on a stream.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-get_direction
     */
    get_Direction() {
        result := ComCall(8, this, "int*", &pTD := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pTD
    }

    /**
     * The get_Name method gets a BSTR representing the name of the stream. This name is used for informational or display purposes.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppName</i> parameter.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of stream's name.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(9, this, "ptr", ppName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppName
    }

    /**
     * The StartStream method starts the stream.
     * @remarks
     * Streams start automatically as soon as a call is connected and ready to stream and a terminal is selected. Therefore, most applications do not need to call this method. Applications have to call this method only to start a stream that the application has previously stopped or paused by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-stopstream">ITStream::StopStream</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-pausestream">ITStream::PauseStream</a>.
     * 
     * This call generates events that the application can retrieve if it has registered. Please see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/events">Events</a> overview for information on receiving events.
     * 
     * If the stream starts successfully, the MSP fires a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event">CALL_MEDIA_EVENT</a> with a value of CME_STREAM_ACTIVE event and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event_cause">CALL_MEDIA_EVENT_CAUSE</a> equaling CMC_LOCAL_REQUEST.
     * 
     * If the stream fails to pause, the MSP fires a CME_STREAM_FAIL event with cause CMC_LOCAL_REQUEST.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOTERMINALSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No terminal has been selected on the stream, so it cannot be started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOTSTOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Stream has already been started.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-startstream
     */
    StartStream() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PauseStream method pauses the stream.
     * @remarks
     * The difference between pausing and stopping a stream depends on the type of transport.
     * 
     * If the stream pauses successfully, the MSP should fire 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event">CALL_MEDIA_EVENT</a> with a value of CME_STREAM_INACTIVE and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event_cause">CALL_MEDIA_EVENT_CAUSE</a> equaling CMC_LOCAL_REQUEST.
     * 
     * If the stream fails to pause, the event will be CME_STREAM_FAIL with cause CMC_LOCAL_REQUEST.
     * 
     * A call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-startstream">StartStream</a> restarts the stream.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-pausestream
     */
    PauseStream() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The StopStream method stops the stream.
     * @remarks
     * An application can call this method to stop a stream. The difference between pausing a stream and stopping a stream depends on the type of transport used for the call.
     * 
     * This call generates events that the application can retrieve if it has registered. Please see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/events">Events</a> overview for information on receiving events.
     * 
     * If the stream stops successfully, the application receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event">CALL_MEDIA_EVENT</a> with a value of CME_STREAM_INACTIVE event and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event_cause">CALL_MEDIA_EVENT_CAUSE</a> equaling CMC_LOCAL_REQUEST.
     * 
     * If the stream fails to pause, the application receives a CME_STREAM_FAIL event with cause CMC_LOCAL_REQUEST.
     * 
     * To subsequently restart the stream, the application must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-startstream">StartStream</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not support this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-stopstream
     */
    StopStream() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectTerminal method selects an ITTerminal object onto the stream.
     * @remarks
     * Terminals can be selected at any time, irrespective of whether the transport is in a state that allows it to stream media. If the transport is in a state that allows it to stream media, and the application has not successfully invoked 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-pausestream">ITStream::PauseStream</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-stopstream">ITStream::StopStream</a> on the stream, or has successfully invoked 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-startstream">ITStream::StartStream</a> for this stream more recently than it has successfully invoked <b>ITStream::PauseStream</b> or <b>ITStream::StopStream</b> for this stream, then streaming starts automatically as soon as the terminal is selected. If a terminal is selected on the stream before the transport enters a state in which it can stream media, and no subsequent calls to 
     * <b>StopStream</b> or 
     * <b>PauseStream</b> are made, then the stream starts automatically when the transport enters a state in which it can stream media.
     * 
     * The CME_STREAM_ACTIVE event is generated when streaming actually starts, which may be later than the 
     * <b>SelectTerminal</b> call. The CME_STREAM_FAIL or CME_TERMINAL_FAIL event is generated when streaming actually fails, which may also be later than the 
     * <b>SelectTerminal</b> call.
     * 
     * A terminal can be selected onto a stream only if the results of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminal-get_mediatype">ITTerminal::get_MediaType</a> match 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-get_mediatype">ITStream::get_MediaType</a>. In addition, some MSPs may require a match between 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminal-get_direction">ITTerminal::get_Direction</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itstream-get_direction">ITStream::get_Direction</a>, although the interface does not enforce this.
     * 
     * Some MSPs may not allow more than a certain number of terminals, typically one, to be simultaneously selected on the same stream, but the interface itself does not enforce any such restriction. Selecting multiple terminals at one time on the same stream is useful, for example, to allow recording of an incoming audio stream to a file while listening to the stream on a pair of speakers.
     * 
     * A given terminal can be selected onto only one stream.
     * @param {ITTerminal} pTerminal Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface of selected terminal.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pTerminal</i> parameter is not a valid pointer.
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
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_MAXTERMINALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Multiple terminals have been selected on the stream, but media mixing or splitting is not possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALIDTERMINAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The terminal selected is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-selectterminal
     */
    SelectTerminal(pTerminal) {
        result := ComCall(13, this, "ptr", pTerminal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The UnselectTerminal method unselects the terminal from the stream and stops streaming for this stream.
     * @remarks
     * Some stream events may be received after streaming has been stopped due to delayed transmission.
     * 
     * Successfully unselecting the last terminal from a stream effectively ceases any existing streaming for this particular stream. Subsequently selecting the same terminal or another terminal restarts such interrupted streaming.
     * 
     * Reselection onto a stream with a different terminal, or a newly created one, can have unexpected effects. The filter graph may retain information from the previous terminal that fails to match the new one.
     * @param {ITTerminal} pTerminal Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface terminal to remove from stream.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pTerminal</i> parameter is not a valid pointer.
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
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALIDTERMINAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pTerminal</i> parameter does not point to a valid terminal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not support this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-unselectterminal
     */
    UnselectTerminal(pTerminal) {
        result := ComCall(14, this, "ptr", pTerminal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The EnumerateTerminals method enumerates terminals selected on the stream. Provided for C and C++ applications. Automation client applications such as Visual Basic must use the get_Terminals method.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> interface returned by <b>ITStream::EnumerateTerminals</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumTerminal</b> interface to free resources associated with it.
     * @returns {IEnumTerminal} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> terminal enumerator.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-enumerateterminals
     */
    EnumerateTerminals() {
        result := ComCall(15, this, "ptr*", &ppEnumTerminal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumTerminal(ppEnumTerminal)
    }

    /**
     * The get_Terminals method creates a collection of terminals associated with the current stream. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateTerminals method.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITStream::get_Terminals</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface pointers (terminal objects).
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itstream-get_terminals
     */
    get_Terminals() {
        pTerminals := VARIANT()
        result := ComCall(16, this, "ptr", pTerminals, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pTerminals
    }
}
