#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IDispatch.ahk

/**
 * Controls the behavior of an event object, the object that fires an event to its subscribers.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventcontrol
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventControl
     * @type {Guid}
     */
    static IID => Guid("{0343e2f4-86f6-11d1-b760-00c04fb926af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPublisherFilter", "get_AllowInprocActivation", "put_AllowInprocActivation", "GetSubscriptions", "SetDefaultQuery"]

    /**
     * 
     * @param {BSTR} methodName 
     * @param {IPublisherFilter} pPublisherFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventcontrol-setpublisherfilter
     */
    SetPublisherFilter(methodName, pPublisherFilter) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(7, this, "ptr", methodName, "ptr", pPublisherFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventcontrol-get_allowinprocactivation
     */
    get_AllowInprocActivation(pfAllowInprocActivation) {
        result := ComCall(8, this, "ptr", pfAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventcontrol-put_allowinprocactivation
     */
    put_AllowInprocActivation(fAllowInprocActivation) {
        result := ComCall(9, this, "int", fAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} methodName 
     * @param {BSTR} optionalCriteria 
     * @param {Pointer<Integer>} optionalErrorIndex 
     * @param {Pointer<IEventObjectCollection>} ppCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventcontrol-getsubscriptions
     */
    GetSubscriptions(methodName, optionalCriteria, optionalErrorIndex, ppCollection) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName
        optionalCriteria := optionalCriteria is String ? BSTR.Alloc(optionalCriteria).Value : optionalCriteria

        result := ComCall(10, this, "ptr", methodName, "ptr", optionalCriteria, "int*", optionalErrorIndex, "ptr*", ppCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} methodName 
     * @param {BSTR} criteria 
     * @param {Pointer<Integer>} errorIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventcontrol-setdefaultquery
     */
    SetDefaultQuery(methodName, criteria, errorIndex) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(11, this, "ptr", methodName, "ptr", criteria, "int*", errorIndex, "HRESULT")
        return result
    }
}
