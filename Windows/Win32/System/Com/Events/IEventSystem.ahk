#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IDispatch.ahk

/**
 * Provides access to the event data store.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventsystem
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventSystem extends IDispatch{
    /**
     * The interface identifier for IEventSystem
     * @type {Guid}
     */
    static IID => Guid("{4e14fb9f-2e22-11d1-9964-00c04fbbb345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria 
     * @param {Pointer<Int32>} errorIndex 
     * @param {Pointer<IUnknown>} ppInterface 
     * @returns {HRESULT} 
     */
    Query(progID, queryCriteria, errorIndex, ppInterface) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(7, this, "ptr", progID, "ptr", queryCriteria, "int*", errorIndex, "ptr", ppInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ProgID 
     * @param {Pointer<IUnknown>} pInterface 
     * @returns {HRESULT} 
     */
    Store(ProgID, pInterface) {
        ProgID := ProgID is String ? BSTR.Alloc(ProgID).Value : ProgID

        result := ComCall(8, this, "ptr", ProgID, "ptr", pInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria 
     * @param {Pointer<Int32>} errorIndex 
     * @returns {HRESULT} 
     */
    Remove(progID, queryCriteria, errorIndex) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(9, this, "ptr", progID, "ptr", queryCriteria, "int*", errorIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrEventClassID 
     * @returns {HRESULT} 
     */
    get_EventObjectChangeEventClassID(pbstrEventClassID) {
        result := ComCall(10, this, "ptr", pbstrEventClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria 
     * @param {Pointer<IUnknown>} ppInterface 
     * @returns {HRESULT} 
     */
    QueryS(progID, queryCriteria, ppInterface) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(11, this, "ptr", progID, "ptr", queryCriteria, "ptr", ppInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria 
     * @returns {HRESULT} 
     */
    RemoveS(progID, queryCriteria) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(12, this, "ptr", progID, "ptr", queryCriteria, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
