#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * This ITMultiTrackTerminal interface is exposed on all multitrack terminals. The interface includes methods for enumerating, creating, and removing tracks. The ITMultiTrackTerminal interface is created by calling QueryInterface on ITTerminal.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itmultitrackterminal
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
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-get_trackterminals
     */
    get_TrackTerminals(pVariant) {
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTerminal>} ppEnumTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-enumeratetrackterminals
     */
    EnumerateTrackTerminals(ppEnumTerminal) {
        result := ComCall(8, this, "ptr*", ppEnumTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MediaType 
     * @param {Integer} TerminalDirection 
     * @param {Pointer<ITTerminal>} ppTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-createtrackterminal
     */
    CreateTrackTerminal(MediaType, TerminalDirection, ppTerminal) {
        result := ComCall(9, this, "int", MediaType, "int", TerminalDirection, "ptr*", ppTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMediaTypesInUse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-get_mediatypesinuse
     */
    get_MediaTypesInUse(plMediaTypesInUse) {
        plMediaTypesInUseMarshal := plMediaTypesInUse is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plMediaTypesInUseMarshal, plMediaTypesInUse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDirectionsInUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-get_directionsinuse
     */
    get_DirectionsInUse(plDirectionsInUsed) {
        plDirectionsInUsedMarshal := plDirectionsInUsed is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plDirectionsInUsedMarshal, plDirectionsInUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITTerminal} pTrackTerminalToRemove 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-removetrackterminal
     */
    RemoveTrackTerminal(pTrackTerminalToRemove) {
        result := ComCall(12, this, "ptr", pTrackTerminalToRemove, "HRESULT")
        return result
    }
}
