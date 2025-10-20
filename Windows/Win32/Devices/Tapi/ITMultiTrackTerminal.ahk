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
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_TrackTerminals(pVariant) {
        result := ComCall(7, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTerminal>} ppEnumTerminal 
     * @returns {HRESULT} 
     */
    EnumerateTrackTerminals(ppEnumTerminal) {
        result := ComCall(8, this, "ptr", ppEnumTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MediaType 
     * @param {Integer} TerminalDirection 
     * @param {Pointer<ITTerminal>} ppTerminal 
     * @returns {HRESULT} 
     */
    CreateTrackTerminal(MediaType, TerminalDirection, ppTerminal) {
        result := ComCall(9, this, "int", MediaType, "int", TerminalDirection, "ptr", ppTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMediaTypesInUse 
     * @returns {HRESULT} 
     */
    get_MediaTypesInUse(plMediaTypesInUse) {
        result := ComCall(10, this, "int*", plMediaTypesInUse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDirectionsInUsed 
     * @returns {HRESULT} 
     */
    get_DirectionsInUse(plDirectionsInUsed) {
        result := ComCall(11, this, "int*", plDirectionsInUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITTerminal>} pTrackTerminalToRemove 
     * @returns {HRESULT} 
     */
    RemoveTrackTerminal(pTrackTerminalToRemove) {
        result := ComCall(12, this, "ptr", pTrackTerminalToRemove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
