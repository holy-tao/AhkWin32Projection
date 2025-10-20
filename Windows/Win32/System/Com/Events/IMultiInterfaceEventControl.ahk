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
     * 
     * @param {Pointer<IMultiInterfacePublisherFilter>} classFilter 
     * @returns {HRESULT} 
     */
    SetMultiInterfacePublisherFilter(classFilter) {
        result := ComCall(3, this, "ptr", classFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} eventIID 
     * @param {BSTR} bstrMethodName 
     * @param {BSTR} optionalCriteria 
     * @param {Pointer<Int32>} optionalErrorIndex 
     * @param {Pointer<IEventObjectCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    GetSubscriptions(eventIID, bstrMethodName, optionalCriteria, optionalErrorIndex, ppCollection) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName
        optionalCriteria := optionalCriteria is String ? BSTR.Alloc(optionalCriteria).Value : optionalCriteria

        result := ComCall(4, this, "ptr", eventIID, "ptr", bstrMethodName, "ptr", optionalCriteria, "int*", optionalErrorIndex, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} eventIID 
     * @param {BSTR} bstrMethodName 
     * @param {BSTR} bstrCriteria 
     * @param {Pointer<Int32>} errorIndex 
     * @returns {HRESULT} 
     */
    SetDefaultQuery(eventIID, bstrMethodName, bstrCriteria, errorIndex) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName
        bstrCriteria := bstrCriteria is String ? BSTR.Alloc(bstrCriteria).Value : bstrCriteria

        result := ComCall(5, this, "ptr", eventIID, "ptr", bstrMethodName, "ptr", bstrCriteria, "int*", errorIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAllowInprocActivation 
     * @returns {HRESULT} 
     */
    get_AllowInprocActivation(pfAllowInprocActivation) {
        result := ComCall(6, this, "ptr", pfAllowInprocActivation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fAllowInprocActivation 
     * @returns {HRESULT} 
     */
    put_AllowInprocActivation(fAllowInprocActivation) {
        result := ComCall(7, this, "int", fAllowInprocActivation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFireInParallel 
     * @returns {HRESULT} 
     */
    get_FireInParallel(pfFireInParallel) {
        result := ComCall(8, this, "ptr", pfFireInParallel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fFireInParallel 
     * @returns {HRESULT} 
     */
    put_FireInParallel(fFireInParallel) {
        result := ComCall(9, this, "int", fFireInParallel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
