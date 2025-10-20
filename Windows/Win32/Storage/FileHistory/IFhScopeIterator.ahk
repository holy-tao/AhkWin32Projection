#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFhScopeIterator interface allows client applications to enumerate individual items in an inclusion or exclusion list. To retrieve inclusion and exclusion lists, call the IFhConfigMgr::GetIncludeExcludeRules method.
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nn-fhcfg-ifhscopeiterator
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class IFhScopeIterator extends IUnknown{
    /**
     * The interface identifier for IFhScopeIterator
     * @type {Guid}
     */
    static IID => Guid("{3197abce-532a-44c6-8615-f3666566a720}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveToNextItem() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Item 
     * @returns {HRESULT} 
     */
    GetItem(Item) {
        result := ComCall(4, this, "ptr", Item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
