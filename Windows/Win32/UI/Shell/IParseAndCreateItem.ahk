#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IParseAndCreateItem interface
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iparseandcreateitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IParseAndCreateItem extends IUnknown{
    /**
     * The interface identifier for IParseAndCreateItem
     * @type {Guid}
     */
    static IID => Guid("{67efed0e-e827-4408-b493-78f3982b685c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    SetItem(psi) {
        result := ComCall(3, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetItem(riid, ppv) {
        result := ComCall(4, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
