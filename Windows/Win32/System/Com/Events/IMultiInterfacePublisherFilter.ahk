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
     * Associates an event class with a publisher filter.
     * @param {IMultiInterfaceEventControl} pEIC A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-imultiinterfaceeventcontrol">IMultiInterfaceEventControl</a> interface on an event class object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-imultiinterfacepublisherfilter-initialize
     */
    Initialize(pEIC) {
        result := ComCall(3, this, "ptr", pEIC, "HRESULT")
        return result
    }

    /**
     * Prepares the publisher filter to begin firing a filtered list of subscriptions using a provided firing control. The firing control is contained in the event class object.
     * @param {Pointer<Guid>} iid The interface ID of the interface being fired.
     * @param {BSTR} methodName The name of the event method to be fired.
     * @param {IFiringControl} firingControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ifiringcontrol">IFiringControl</a> interface on the firing control object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-imultiinterfacepublisherfilter-preparetofire
     */
    PrepareToFire(iid, methodName, firingControl) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(4, this, "ptr", iid, "ptr", methodName, "ptr", firingControl, "HRESULT")
        return result
    }
}
