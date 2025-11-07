#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelMethod.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IFilteredNamespacePropertyToken extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemoveFilter", "GetFilter", "TrySetFilter"]

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFilter() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IModelMethod} 
     */
    GetFilter() {
        result := ComCall(4, this, "ptr*", &ppFilter := 0, "HRESULT")
        return IModelMethod(ppFilter)
    }

    /**
     * 
     * @param {IModelMethod} pFilter 
     * @returns {HRESULT} 
     */
    TrySetFilter(pFilter) {
        result := ComCall(5, this, "ptr", pFilter, "HRESULT")
        return result
    }
}
