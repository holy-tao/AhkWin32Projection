#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IEventObjectCollection.ahk
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
     * @returns {IEventObjectCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-getsubscriptions
     */
    GetSubscriptions(eventIID, bstrMethodName, optionalCriteria, optionalErrorIndex) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName
        optionalCriteria := optionalCriteria is String ? BSTR.Alloc(optionalCriteria).Value : optionalCriteria

        optionalErrorIndexMarshal := optionalErrorIndex is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", eventIID, "ptr", bstrMethodName, "ptr", optionalCriteria, optionalErrorIndexMarshal, optionalErrorIndex, "ptr*", &ppCollection := 0, "HRESULT")
        return IEventObjectCollection(ppCollection)
    }

    /**
     * 
     * @param {Pointer<Guid>} eventIID 
     * @param {BSTR} bstrMethodName 
     * @param {BSTR} bstrCriteria 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-setdefaultquery
     */
    SetDefaultQuery(eventIID, bstrMethodName, bstrCriteria) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName
        bstrCriteria := bstrCriteria is String ? BSTR.Alloc(bstrCriteria).Value : bstrCriteria

        result := ComCall(5, this, "ptr", eventIID, "ptr", bstrMethodName, "ptr", bstrCriteria, "int*", &errorIndex := 0, "HRESULT")
        return errorIndex
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-get_allowinprocactivation
     */
    get_AllowInprocActivation() {
        result := ComCall(6, this, "int*", &pfAllowInprocActivation := 0, "HRESULT")
        return pfAllowInprocActivation
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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-get_fireinparallel
     */
    get_FireInParallel() {
        result := ComCall(8, this, "int*", &pfFireInParallel := 0, "HRESULT")
        return pfFireInParallel
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
