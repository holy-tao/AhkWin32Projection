#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumTerminal.ahk
#Include .\ITTerminal.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * This ITMultiTrackTerminal interface is exposed on all multitrack terminals. The interface includes methods for enumerating, creating, and removing tracks. The ITMultiTrackTerminal interface is created by calling QueryInterface on ITTerminal.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nn-tapi3if-itmultitrackterminal
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITMultiTrackTerminal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITMultiTrackTerminal
     * @type {Guid}
     */
    static IID => Guid("{fe040091-ade8-4072-95c9-bf7de8c54b44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TrackTerminals", "EnumerateTrackTerminals", "CreateTrackTerminal", "get_MediaTypesInUse", "get_DirectionsInUse", "RemoveTrackTerminal"]

    /**
     * @type {VARIANT} 
     */
    TrackTerminals {
        get => this.get_TrackTerminals()
    }

    /**
     * @type {Integer} 
     */
    MediaTypesInUse {
        get => this.get_MediaTypesInUse()
    }

    /**
     * @type {Integer} 
     */
    DirectionsInUse {
        get => this.get_DirectionsInUse()
    }

    /**
     * The get_TrackTerminals method creates and returns a collection containing the terminals contained by the multitrack terminal on which this method was called.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITMultiTrackTerminal::get_TrackTerminals</b>. The application must call <b>Release</b> on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a VARIANT containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface pointers for the tracks available.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itmultitrackterminal-get_trackterminals
     */
    get_TrackTerminals() {
        pVariant := VARIANT()
        result := ComCall(7, this, "ptr", pVariant, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVariant
    }

    /**
     * The EnumerateTrackTerminals method creates and returns an enumeration containing the terminals contained by the multitrack terminal on which this method was called.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> interface returned by <b>ITMultiTrackTerminal::EnumerateTrackTerminals</b>. The application must call <b>Release</b> on the 
     * <b>IEnumTerminal</b> interface to free resources associated with it.
     * @returns {IEnumTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> interface enumerating terminals contained in the multitrack terminal.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itmultitrackterminal-enumeratetrackterminals
     */
    EnumerateTrackTerminals() {
        result := ComCall(8, this, "ptr*", &ppEnumTerminal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumTerminal(ppEnumTerminal)
    }

    /**
     * The CreateTrackTerminal method creates a multitrack terminal that can handle a given media type or types and media direction.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITMultiTrackTerminal::CreateTrackTerminal</b>. The application must call <b>Release</b> on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @param {Integer} MediaType_ Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> required for the terminal.
     * @param {Integer} TerminalDirection The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor for the terminal.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itmultitrackterminal-createtrackterminal
     */
    CreateTrackTerminal(MediaType_, TerminalDirection) {
        result := ComCall(9, this, "int", MediaType_, "int", TerminalDirection, "ptr*", &ppTerminal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITTerminal(ppTerminal)
    }

    /**
     * The get_MediaTypesInUse method returns the media types (bitwise ORed) of all tracks managed currently by the multitrack terminal.
     * @returns {Integer} Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> in use.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itmultitrackterminal-get_mediatypesinuse
     */
    get_MediaTypesInUse() {
        result := ComCall(10, this, "int*", &plMediaTypesInUse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plMediaTypesInUse
    }

    /**
     * The get_DirectionsInUse method returns the direction of all tracks managed currently by the multitrack terminal.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor of the directions.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itmultitrackterminal-get_directionsinuse
     */
    get_DirectionsInUse() {
        result := ComCall(11, this, "int*", &plDirectionsInUsed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plDirectionsInUsed
    }

    /**
     * The RemoveTrackTerminal method removes the specified terminal from the collection of track terminals that belong to the multitrack terminal on which the method was called.
     * @remarks
     * The primary use of the 
     * <b>RemoveTrackTerminal</b> method is cleanup during the terminal selection process. For example, if a track has been created, but it has not been selected on a stream, this method can be used to remove the track.
     * 
     * The actual action performed by this method may vary in the actual implementation of the terminal. For instance, calling this method on a File Recording Terminal causes the corresponding file data stream to be removed from the file. Calling this method on a File Playback Terminal fails because its set of terminals is determined solely by file configuration and cannot be changed by the caller.
     * @param {ITTerminal} pTrackTerminalToRemove Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface of the terminal to remove.
     * @returns {HRESULT} This method can return one of these values.
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
     * The <i>pTrackTerminalToRemove</i> parameter is not a valid pointer.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itmultitrackterminal-removetrackterminal
     */
    RemoveTrackTerminal(pTrackTerminalToRemove) {
        result := ComCall(12, this, "ptr", pTrackTerminalToRemove, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
