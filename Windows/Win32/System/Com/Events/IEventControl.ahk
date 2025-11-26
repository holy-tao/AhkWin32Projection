#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IEventObjectCollection.ahk
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
     * @type {BOOL} 
     */
    AllowInprocActivation {
        get => this.get_AllowInprocActivation()
        set => this.put_AllowInprocActivation(value)
    }

    /**
     * Assigns a publisher filter to an event method.
     * @param {BSTR} methodName The name of the event method associated with the publisher filter to be assigned.
     * @param {IPublisherFilter} pPublisherFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ipublisherfilter">IPublisherFilter</a> interface on the publisher filter associated with the specified method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventcontrol-setpublisherfilter
     */
    SetPublisherFilter(methodName, pPublisherFilter) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(7, this, "ptr", methodName, "ptr", pPublisherFilter, "HRESULT")
        return result
    }

    /**
     * Indicates whether subscribers can be activated in the publisher's process.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventcontrol-get_allowinprocactivation
     */
    get_AllowInprocActivation() {
        result := ComCall(8, this, "int*", &pfAllowInprocActivation := 0, "HRESULT")
        return pfAllowInprocActivation
    }

    /**
     * Indicates whether subscribers can be activated in the publisher's process.
     * @param {BOOL} fAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventcontrol-put_allowinprocactivation
     */
    put_AllowInprocActivation(fAllowInprocActivation) {
        result := ComCall(9, this, "int", fAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * Retrieves the collection of subscriptions associated with an event method.
     * @param {BSTR} methodName The event method associated with the subscription collection.
     * @param {BSTR} optionalCriteria The query criteria. If this parameter is <b>NULL</b>, the default query specified by the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventcontrol-setdefaultquery">SetDefaultQuery</a> method is used. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @param {Pointer<Integer>} optionalErrorIndex The location, expressed as an offset, of an error in the <i>OptionalCriteria</i> parameter. This parameter cannot be <b>NULL</b>.
     * @returns {IEventObjectCollection} Address of a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a> interface on a collection object that enumerates the subscriptions associated with the event object.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventcontrol-getsubscriptions
     */
    GetSubscriptions(methodName, optionalCriteria, optionalErrorIndex) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName
        optionalCriteria := optionalCriteria is String ? BSTR.Alloc(optionalCriteria).Value : optionalCriteria

        optionalErrorIndexMarshal := optionalErrorIndex is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "ptr", methodName, "ptr", optionalCriteria, optionalErrorIndexMarshal, optionalErrorIndex, "ptr*", &ppCollection := 0, "HRESULT")
        return IEventObjectCollection(ppCollection)
    }

    /**
     * Sets the default query to determine subscribers.
     * @param {BSTR} methodName The name of the method to which the default query is assigned.
     * @param {BSTR} criteria The query criteria. This parameter cannot be <b>NULL</b>. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @returns {Integer} The location, expressed as an offset, of an error in the <i>criteria</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventcontrol-setdefaultquery
     */
    SetDefaultQuery(methodName, criteria) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(11, this, "ptr", methodName, "ptr", criteria, "int*", &errorIndex := 0, "HRESULT")
        return errorIndex
    }
}
