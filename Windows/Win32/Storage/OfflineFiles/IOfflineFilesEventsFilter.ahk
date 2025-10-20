#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a mechanism for recipients of published events to restrict the number of event instances they receive.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefileseventsfilter
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesEventsFilter extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesEventsFilter
     * @type {Guid}
     */
    static IID => Guid("{33fc4e1b-0716-40fa-ba65-6e62a84a846f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFilter 
     * @param {Pointer<Int32>} pMatch 
     * @returns {HRESULT} 
     */
    GetPathFilter(ppszFilter, pMatch) {
        result := ComCall(3, this, "ptr", ppszFilter, "int*", pMatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cElements 
     * @param {Pointer<Int32>} prgEvents 
     * @param {Pointer<UInt32>} pcEvents 
     * @returns {HRESULT} 
     */
    GetIncludedEvents(cElements, prgEvents, pcEvents) {
        result := ComCall(4, this, "uint", cElements, "int*", prgEvents, "uint*", pcEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cElements 
     * @param {Pointer<Int32>} prgEvents 
     * @param {Pointer<UInt32>} pcEvents 
     * @returns {HRESULT} 
     */
    GetExcludedEvents(cElements, prgEvents, pcEvents) {
        result := ComCall(5, this, "uint", cElements, "int*", prgEvents, "uint*", pcEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
