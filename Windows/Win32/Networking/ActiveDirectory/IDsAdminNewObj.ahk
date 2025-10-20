#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsAdminNewObj interface is used by a primary or secondary object creation wizard extension to obtain page count data and to control the command buttons in the wizard.
 * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nn-dsadmin-idsadminnewobj
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminNewObj extends IUnknown{
    /**
     * The interface identifier for IDsAdminNewObj
     * @type {Guid}
     */
    static IID => Guid("{f2573587-e6fc-11d2-82af-00c04f68928b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} nCurrIndex 
     * @param {BOOL} bValid 
     * @returns {HRESULT} 
     */
    SetButtons(nCurrIndex, bValid) {
        result := ComCall(3, this, "uint", nCurrIndex, "int", bValid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnTotal 
     * @param {Pointer<Int32>} pnStartIndex 
     * @returns {HRESULT} 
     */
    GetPageCounts(pnTotal, pnStartIndex) {
        result := ComCall(4, this, "int*", pnTotal, "int*", pnStartIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
