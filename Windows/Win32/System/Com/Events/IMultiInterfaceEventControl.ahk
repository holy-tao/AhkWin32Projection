#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IUnknown.ahk

/**
 * Controls the behavior of an event object, the object that fires an event to its subscribers.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-imultiinterfaceeventcontrol
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IMultiInterfaceEventControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiInterfaceEventControl
     * @type {Guid}
     */
    static IID => Guid("{0343e2f5-86f6-11d1-b760-00c04fb926af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMultiInterfacePublisherFilter", "GetSubscriptions", "SetDefaultQuery", "get_AllowInprocActivation", "put_AllowInprocActivation", "get_FireInParallel", "put_FireInParallel"]

    /**
     * 
     * @param {IMultiInterfacePublisherFilter} classFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-setmultiinterfacepublisherfilter
     */
    SetMultiInterfacePublisherFilter(classFilter) {
        result := ComCall(3, this, "ptr", classFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} eventIID 
     * @param {BSTR} bstrMethodName 
     * @param {BSTR} optionalCriteria 
     * @param {Pointer<Integer>} optionalErrorIndex 
     * @param {Pointer<IEventObjectCollection>} ppCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-getsubscriptions
     */
    GetSubscriptions(eventIID, bstrMethodName, optionalCriteria, optionalErrorIndex, ppCollection) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName
        optionalCriteria := optionalCriteria is String ? BSTR.Alloc(optionalCriteria).Value : optionalCriteria

        optionalErrorIndexMarshal := optionalErrorIndex is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", eventIID, "ptr", bstrMethodName, "ptr", optionalCriteria, optionalErrorIndexMarshal, optionalErrorIndex, "ptr*", ppCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} eventIID 
     * @param {BSTR} bstrMethodName 
     * @param {BSTR} bstrCriteria 
     * @param {Pointer<Integer>} errorIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-setdefaultquery
     */
    SetDefaultQuery(eventIID, bstrMethodName, bstrCriteria, errorIndex) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName
        bstrCriteria := bstrCriteria is String ? BSTR.Alloc(bstrCriteria).Value : bstrCriteria

        errorIndexMarshal := errorIndex is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", eventIID, "ptr", bstrMethodName, "ptr", bstrCriteria, errorIndexMarshal, errorIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-get_allowinprocactivation
     */
    get_AllowInprocActivation(pfAllowInprocActivation) {
        result := ComCall(6, this, "ptr", pfAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-put_allowinprocactivation
     */
    put_AllowInprocActivation(fAllowInprocActivation) {
        result := ComCall(7, this, "int", fAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFireInParallel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-get_fireinparallel
     */
    get_FireInParallel(pfFireInParallel) {
        result := ComCall(8, this, "ptr", pfFireInParallel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFireInParallel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-put_fireinparallel
     */
    put_FireInParallel(fFireInParallel) {
        result := ComCall(9, this, "int", fFireInParallel, "HRESULT")
        return result
    }
}
