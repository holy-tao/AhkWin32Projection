#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IFilteredNamespacePropertyToken extends IUnknown{
    /**
     * The interface identifier for IFilteredNamespacePropertyToken
     * @type {Guid}
     */
    static IID => Guid("{63832802-2db3-4de7-b76c-197ac15b5ec6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFilter() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelMethod>} ppFilter 
     * @returns {HRESULT} 
     */
    GetFilter(ppFilter) {
        result := ComCall(4, this, "ptr", ppFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelMethod>} pFilter 
     * @returns {HRESULT} 
     */
    TrySetFilter(pFilter) {
        result := ComCall(5, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
