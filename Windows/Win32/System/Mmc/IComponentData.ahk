#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IComponentData interface enables MMC to communicate with snap-ins. Similar to the IComponent interface, IComponentData is typically implemented at the document level and is closely associated with items (folders) being displayed in the scope pane.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icomponentdata
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IComponentData extends IUnknown{
    /**
     * The interface identifier for IComponentData
     * @type {Guid}
     */
    static IID => Guid("{955ab28a-5218-11d0-a985-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IUnknown>} pUnknown 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pUnknown) {
        result := ComCall(3, this, "ptr", pUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponent>} ppComponent 
     * @returns {HRESULT} 
     */
    CreateComponent(ppComponent) {
        result := ComCall(4, this, "ptr", ppComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} lpDataObject 
     * @param {Integer} event 
     * @param {LPARAM} arg 
     * @param {LPARAM} param3 
     * @returns {HRESULT} 
     */
    Notify(lpDataObject, event, arg, param3) {
        result := ComCall(5, this, "ptr", lpDataObject, "int", event, "ptr", arg, "ptr", param3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Destroy() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} cookie 
     * @param {Integer} type 
     * @param {Pointer<IDataObject>} ppDataObject 
     * @returns {HRESULT} 
     */
    QueryDataObject(cookie, type, ppDataObject) {
        result := ComCall(7, this, "ptr", cookie, "int", type, "ptr", ppDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SCOPEDATAITEM>} pScopeDataItem 
     * @returns {HRESULT} 
     */
    GetDisplayInfo(pScopeDataItem) {
        result := ComCall(8, this, "ptr", pScopeDataItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} lpDataObjectA 
     * @param {Pointer<IDataObject>} lpDataObjectB 
     * @returns {HRESULT} 
     */
    CompareObjects(lpDataObjectA, lpDataObjectB) {
        result := ComCall(9, this, "ptr", lpDataObjectA, "ptr", lpDataObjectB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
