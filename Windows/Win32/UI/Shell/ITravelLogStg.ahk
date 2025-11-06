#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITravelLogEntry.ahk
#Include .\IEnumTravelLogEntry.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITravelLogStg extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITravelLogStg
     * @type {Guid}
     */
    static IID => Guid("{7ebfdd80-ad18-11d3-a4c5-00c04f72d6b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEntry", "TravelTo", "EnumEntries", "FindEntries", "GetCount", "RemoveEntry", "GetRelativeEntry"]

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @param {PWSTR} pszTitle 
     * @param {ITravelLogEntry} ptleRelativeTo 
     * @param {BOOL} fPrepend 
     * @returns {ITravelLogEntry} 
     */
    CreateEntry(pszUrl, pszTitle, ptleRelativeTo, fPrepend) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pszTitle, "ptr", ptleRelativeTo, "int", fPrepend, "ptr*", &pptle := 0, "HRESULT")
        return ITravelLogEntry(pptle)
    }

    /**
     * 
     * @param {ITravelLogEntry} ptle 
     * @returns {HRESULT} 
     */
    TravelTo(ptle) {
        result := ComCall(4, this, "ptr", ptle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {IEnumTravelLogEntry} 
     */
    EnumEntries(flags) {
        result := ComCall(5, this, "int", flags, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumTravelLogEntry(ppenum)
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {PWSTR} pszUrl 
     * @returns {IEnumTravelLogEntry} 
     */
    FindEntries(flags, pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(6, this, "int", flags, "ptr", pszUrl, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumTravelLogEntry(ppenum)
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    GetCount(flags) {
        result := ComCall(7, this, "int", flags, "uint*", &pcEntries := 0, "HRESULT")
        return pcEntries
    }

    /**
     * 
     * @param {ITravelLogEntry} ptle 
     * @returns {HRESULT} 
     */
    RemoveEntry(ptle) {
        result := ComCall(8, this, "ptr", ptle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iOffset 
     * @returns {ITravelLogEntry} 
     */
    GetRelativeEntry(iOffset) {
        result := ComCall(9, this, "int", iOffset, "ptr*", &ptle := 0, "HRESULT")
        return ITravelLogEntry(ptle)
    }
}
