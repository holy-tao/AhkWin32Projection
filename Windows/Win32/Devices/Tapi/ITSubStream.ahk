#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITStream.ahk" { ITStream }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IEnumTerminal.ahk" { IEnumTerminal }

/**
 * An ITSubStream is a component of an ITStream, and gives an application finer control over the media streaming.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itsubstream
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITSubStream extends IDispatch {
    /**
     * The interface identifier for ITSubStream
     * @type {Guid}
     */
    static IID := Guid("{ee3bd608-3868-11d2-a045-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITSubStream interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        StartSubStream     : IntPtr
        PauseSubStream     : IntPtr
        StopSubStream      : IntPtr
        SelectTerminal     : IntPtr
        UnselectTerminal   : IntPtr
        EnumerateTerminals : IntPtr
        get_Terminals      : IntPtr
        get_Stream         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITSubStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Terminals {
        get => this.get_Terminals()
    }

    /**
     * @type {ITStream} 
     */
    Stream {
        get => this.get_Stream()
    }

    /**
     * The StartSubStream method starts the substream. See the Remarks section under ITStream::StartStream for additional information.
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
     * <dt><b>TAPI_E_NOTERMINALSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No terminal has been selected on the substream so it cannot be started.
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
     * Substream has already been started.
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
     * This operation is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-startsubstream
     */
    StartSubStream() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The PauseSubStream method pauses the substream.
     * @remarks
     * The difference between pausing and stopping a stream depends on the type of transport.
     * 
     * If the substream pauses successfully, the application receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event">CALL_MEDIA_EVENT</a> with a value of CME_STREAM_INACTIVE and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event_cause">CALL_MEDIA_EVENT_CAUSE</a> equaling CMC_LOCAL_REQUEST.
     * 
     * If the substream fails to pause, the event will be CME_STREAM_FAIL with cause CMC_LOCAL_REQUEST.
     * 
     * A call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itsubstream-startsubstream">StartSubStream</a> restarts the substream.
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
     * <dt><b>TAPI_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-pausesubstream
     */
    PauseSubStream() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The StopSubStream method stops the substream. For additional information, see ITStream::StopStream.
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
     * <dt><b>TAPI_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not support this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-stopsubstream
     */
    StopSubStream() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The SelectTerminal method selects an ITTerminal object onto the substream. See the Remarks section under ITStream::SelectTerminal for additional information.
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
     * Multiple terminals have been selected on the substream, but media mixing or splitting is not possible.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-selectterminal
     */
    SelectTerminal(pTerminal) {
        result := ComCall(10, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * The UnselectTerminal method unselects the terminal from the substream.
     * @remarks
     * Some stream events may be received after streaming has been stopped due to delayed transmission.
     * 
     * Successfully unselecting the last terminal from a substream effectively ceases any existing streaming for this particular substream. Subsequently selecting the same terminal or another terminal restarts such interrupted streaming.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-unselectterminal
     */
    UnselectTerminal(pTerminal) {
        result := ComCall(11, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * The EnumerateTerminals method enumerates terminals selected on the substream. Provided for C and C++ applications. Automation client applications such as Visual Basic must use the get_Terminals method.
     * @remarks
     * This method returns only the terminals selected on the substream. Other terminals may be selected on the stream or on other substreams within the stream; those terminals are not returned.
     * 
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> interface returned by <b>ITSubStream::EnumerateTerminals</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumTerminal</b> interface to free resources associated with it.
     * @returns {IEnumTerminal} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> terminal enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-enumerateterminals
     */
    EnumerateTerminals() {
        result := ComCall(12, this, "ptr*", &ppEnumTerminal := 0, "HRESULT")
        return IEnumTerminal(ppEnumTerminal)
    }

    /**
     * The get_Terminals method creates a collection of terminals associated with the current substream. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateTerminals method.
     * @remarks
     * This method returns only the terminals selected on the substream. Other terminals may be selected on the stream or on other substreams within the stream; those terminals are not returned.
     * 
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITSubStream::get_Terminals</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface pointers (terminal objects).
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-get_terminals
     */
    get_Terminals() {
        pTerminals := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, pTerminals, "HRESULT")
        return pTerminals
    }

    /**
     * The get_Stream method retrieves the pointer to the ITStream interface for the current substream.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface returned by <b>ITSubStream::get_Stream</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface to free resources associated with it.
     * @returns {ITStream} Pointer to current 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-get_stream
     */
    get_Stream() {
        result := ComCall(14, this, "ptr*", &ppITStream := 0, "HRESULT")
        return ITStream(ppITStream)
    }

    Query(iid) {
        if (ITSubStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartSubStream := CallbackCreate(GetMethod(implObj, "StartSubStream"), flags, 1)
        this.vtbl.PauseSubStream := CallbackCreate(GetMethod(implObj, "PauseSubStream"), flags, 1)
        this.vtbl.StopSubStream := CallbackCreate(GetMethod(implObj, "StopSubStream"), flags, 1)
        this.vtbl.SelectTerminal := CallbackCreate(GetMethod(implObj, "SelectTerminal"), flags, 2)
        this.vtbl.UnselectTerminal := CallbackCreate(GetMethod(implObj, "UnselectTerminal"), flags, 2)
        this.vtbl.EnumerateTerminals := CallbackCreate(GetMethod(implObj, "EnumerateTerminals"), flags, 2)
        this.vtbl.get_Terminals := CallbackCreate(GetMethod(implObj, "get_Terminals"), flags, 2)
        this.vtbl.get_Stream := CallbackCreate(GetMethod(implObj, "get_Stream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartSubStream)
        CallbackFree(this.vtbl.PauseSubStream)
        CallbackFree(this.vtbl.StopSubStream)
        CallbackFree(this.vtbl.SelectTerminal)
        CallbackFree(this.vtbl.UnselectTerminal)
        CallbackFree(this.vtbl.EnumerateTerminals)
        CallbackFree(this.vtbl.get_Terminals)
        CallbackFree(this.vtbl.get_Stream)
    }
}
