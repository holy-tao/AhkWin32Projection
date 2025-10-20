#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITravelLogStg extends IUnknown{
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
     * 
     * @param {PWSTR} pszUrl 
     * @param {PWSTR} pszTitle 
     * @param {Pointer<ITravelLogEntry>} ptleRelativeTo 
     * @param {BOOL} fPrepend 
     * @param {Pointer<ITravelLogEntry>} pptle 
     * @returns {HRESULT} 
     */
    CreateEntry(pszUrl, pszTitle, ptleRelativeTo, fPrepend, pptle) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pszTitle, "ptr", ptleRelativeTo, "int", fPrepend, "ptr", pptle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITravelLogEntry>} ptle 
     * @returns {HRESULT} 
     */
    TravelTo(ptle) {
        result := ComCall(4, this, "ptr", ptle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<IEnumTravelLogEntry>} ppenum 
     * @returns {HRESULT} 
     */
    EnumEntries(flags, ppenum) {
        result := ComCall(5, this, "int", flags, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<IEnumTravelLogEntry>} ppenum 
     * @returns {HRESULT} 
     */
    FindEntries(flags, pszUrl, ppenum) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(6, this, "int", flags, "ptr", pszUrl, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<UInt32>} pcEntries 
     * @returns {HRESULT} 
     */
    GetCount(flags, pcEntries) {
        result := ComCall(7, this, "int", flags, "uint*", pcEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITravelLogEntry>} ptle 
     * @returns {HRESULT} 
     */
    RemoveEntry(ptle) {
        result := ComCall(8, this, "ptr", ptle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iOffset 
     * @param {Pointer<ITravelLogEntry>} ptle 
     * @returns {HRESULT} 
     */
    GetRelativeEntry(iOffset, ptle) {
        result := ComCall(9, this, "int", iOffset, "ptr", ptle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
