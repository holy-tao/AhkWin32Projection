#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumTerminal.ahk
#Include .\ITTerminal.ahk
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-get_trackterminals
     */
    get_TrackTerminals() {
        pVariant := VARIANT()
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @returns {IEnumTerminal} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-enumeratetrackterminals
     */
    EnumerateTrackTerminals() {
        result := ComCall(8, this, "ptr*", &ppEnumTerminal := 0, "HRESULT")
        return IEnumTerminal(ppEnumTerminal)
    }

    /**
     * 
     * @param {Integer} MediaType 
     * @param {Integer} TerminalDirection 
     * @returns {ITTerminal} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-createtrackterminal
     */
    CreateTrackTerminal(MediaType, TerminalDirection) {
        result := ComCall(9, this, "int", MediaType, "int", TerminalDirection, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-get_mediatypesinuse
     */
    get_MediaTypesInUse() {
        result := ComCall(10, this, "int*", &plMediaTypesInUse := 0, "HRESULT")
        return plMediaTypesInUse
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmultitrackterminal-get_directionsinuse
     */
    get_DirectionsInUse() {
        result := ComCall(11, this, "int*", &plDirectionsInUsed := 0, "HRESULT")
        return plDirectionsInUsed
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
