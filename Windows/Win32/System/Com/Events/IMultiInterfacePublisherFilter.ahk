#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IUnknown.ahk

/**
 * Manages a filtered subscription cache for an event method.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-imultiinterfacepublisherfilter
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IMultiInterfacePublisherFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiInterfacePublisherFilter
     * @type {Guid}
     */
    static IID => Guid("{465e5cc1-7b26-11d1-88fb-0080c7d771bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "PrepareToFire"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IMultiInterfaceEventControl} pEIC 
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
    Initialize(pEIC) {
        result := ComCall(3, this, "ptr", pEIC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {BSTR} methodName 
     * @param {IFiringControl} firingControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfacepublisherfilter-preparetofire
     */
    PrepareToFire(iid, methodName, firingControl) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(4, this, "ptr", iid, "ptr", methodName, "ptr", firingControl, "HRESULT")
        return result
    }
}
