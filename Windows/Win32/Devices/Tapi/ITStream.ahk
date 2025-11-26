#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumTerminal.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITStream interfaces expose methods that allow an application to retrieve information on a stream; to start, pause, or stop the stream; to select or unselect terminals on a stream; and to obtain a list of terminals selected on the stream.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itstream
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-get_mediatype
     */
    get_MediaType() {
        result := ComCall(7, this, "int*", &plMediaType := 0, "HRESULT")
        return plMediaType
    }

    /**
     * The get_Direction method gets the stream's terminal direction.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-get_direction
     */
    get_Direction() {
        result := ComCall(8, this, "int*", &pTD := 0, "HRESULT")
        return pTD
    }

    /**
     * The get_Name method gets a BSTR representing the name of the stream. This name is used for informational or display purposes.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of stream's name.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(9, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * The StartStream method starts the stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-startstream
     */
    StartStream() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The PauseStream method pauses the stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-pausestream
     */
    PauseStream() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The StopStream method stops the stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-stopstream
     */
    StopStream() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The SelectTerminal method selects an ITTerminal object onto the stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-selectterminal
     */
    SelectTerminal(pTerminal) {
        result := ComCall(13, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * The UnselectTerminal method unselects the terminal from the stream and stops streaming for this stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-unselectterminal
     */
    UnselectTerminal(pTerminal) {
        result := ComCall(14, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * The EnumerateTerminals method enumerates terminals selected on the stream. Provided for C and C++ applications. Automation client applications such as Visual Basic must use the get_Terminals method.
     * @returns {IEnumTerminal} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> terminal enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-enumerateterminals
     */
    EnumerateTerminals() {
        result := ComCall(15, this, "ptr*", &ppEnumTerminal := 0, "HRESULT")
        return IEnumTerminal(ppEnumTerminal)
    }

    /**
     * The get_Terminals method creates a collection of terminals associated with the current stream. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateTerminals method.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface pointers (terminal objects).
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstream-get_terminals
     */
    get_Terminals() {
        pTerminals := VARIANT()
        result := ComCall(16, this, "ptr", pTerminals, "HRESULT")
        return pTerminals
    }
}
