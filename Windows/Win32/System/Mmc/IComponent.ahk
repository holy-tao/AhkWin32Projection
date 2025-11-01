#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IComponent interface a base class for all derived interfaces such as IMPEG2Component and it describes the general characteristics of a component, which is an elementary stream within the program stream.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponent)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-icomponent
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IComponent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponent
     * @type {Guid}
     */
    static IID => Guid("{43136eb2-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Notify", "Destroy", "QueryDataObject", "GetResultViewType", "GetDisplayInfo", "CompareObjects"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IConsole} lpConsole 
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
    Initialize(lpConsole) {
        result := ComCall(3, this, "ptr", lpConsole, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} lpDataObject 
     * @param {Integer} event 
     * @param {LPARAM} arg 
     * @param {LPARAM} param3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-notify
     */
    Notify(lpDataObject, event, arg, param3) {
        result := ComCall(4, this, "ptr", lpDataObject, "int", event, "ptr", arg, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-destroy
     */
    Destroy(cookie) {
        result := ComCall(5, this, "ptr", cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cookie 
     * @param {Integer} type 
     * @param {Pointer<IDataObject>} ppDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-querydataobject
     */
    QueryDataObject(cookie, type, ppDataObject) {
        result := ComCall(6, this, "ptr", cookie, "int", type, "ptr*", ppDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cookie 
     * @param {Pointer<PWSTR>} ppViewType 
     * @param {Pointer<Integer>} pViewOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-getresultviewtype
     */
    GetResultViewType(cookie, ppViewType, pViewOptions) {
        pViewOptionsMarshal := pViewOptions is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", cookie, "ptr", ppViewType, pViewOptionsMarshal, pViewOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RESULTDATAITEM>} pResultDataItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-getdisplayinfo
     */
    GetDisplayInfo(pResultDataItem) {
        result := ComCall(8, this, "ptr", pResultDataItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} lpDataObjectA 
     * @param {IDataObject} lpDataObjectB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-compareobjects
     */
    CompareObjects(lpDataObjectA, lpDataObjectB) {
        result := ComCall(9, this, "ptr", lpDataObjectA, "ptr", lpDataObjectB, "HRESULT")
        return result
    }
}
