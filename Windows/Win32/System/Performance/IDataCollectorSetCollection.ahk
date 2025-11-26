#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollectorSet.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages a collection of DataCollectorSet objects.To get this interface, call the CoCreateInstance function, passing __uuidof(DataCollectorSetCollection) as the class identifier and __uuidof(IDataCollectorSetCollection) as the interface identifier.Then, to populate the collection, call the IDataCollectorSetCollection::GetDataCollectorSets method.
 * @remarks
 * 
 * To create the object from a script, use the Pla.DataCollectorSetCollection program identifier.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-idatacollectorsetcollection
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IDataCollectorSetCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataCollectorSetCollection
     * @type {Guid}
     */
    static IID => Guid("{03837524-098b-11d8-9414-505054503030}")

    /**
     * The class identifier for DataCollectorSetCollection
     * @type {Guid}
     */
    static CLSID => Guid("{03837525-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Add", "Remove", "Clear", "AddRange", "GetDataCollectorSets"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves the number of data collector sets in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorsetcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the requested data collector set from the collection.
     * @remarks
     * 
     * This property is the object's default property.
     * 
     * 
     * @param {VARIANT} index 
     * @returns {IDataCollectorSet} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorsetcollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &set := 0, "HRESULT")
        return IDataCollectorSet(set)
    }

    /**
     * Retrieves an interface to the enumeration.
     * @remarks
     * 
     * C++ programmers use this property.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN.  To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorset">IDataCollectorSet</a> interface, use the <b>punkVal</b> member of the variant.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorsetcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUnknown(retVal)
    }

    /**
     * Adds a data collector set to the collection.
     * @param {IDataCollectorSet} set An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorset">IDataCollectorSet</a> interface of the data collector set to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorsetcollection-add
     */
    Add(set) {
        result := ComCall(10, this, "ptr", set, "HRESULT")
        return result
    }

    /**
     * Removes a data collector set from the collection.
     * @param {VARIANT} set The zero-based index of the data collector set to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorsetcollection-remove
     */
    Remove(set) {
        result := ComCall(11, this, "ptr", set, "HRESULT")
        return result
    }

    /**
     * Removes all data collector sets from the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorsetcollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more data collector sets to the collection.
     * @param {IDataCollectorSetCollection} sets An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorsetcollection">IDataCollectorSetCollection</a> interface to a collection of one or more data collector sets to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorsetcollection-addrange
     */
    AddRange(sets) {
        result := ComCall(13, this, "ptr", sets, "HRESULT")
        return result
    }

    /**
     * Populates the data collector set collection.
     * @param {BSTR} server The computer whose data collector sets you want to enumerate. You can specify a computer name, a fully qualified domain name, or an IP address (IPv4 or IPv6 format). If <b>NULL</b>, PLA enumerates the sets on the local computer.
     * @param {BSTR} filter If empty, PLA enumerates sets from all namespaces; otherwise, specify a specific namespace to enumerate. The form is &lt;namespace&gt;\*. For possible namespace values, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-commit">IDataCollectorSet::Commit</a>.
     * @returns {HRESULT} Returns S_OK if successful. The following table shows possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(RPC_S_SERVER_UNAVAILABLE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC server is not available. The method is unable to query the data collector set remotely. To query the data collector set from a remote computer running Windows Vista, enable Performance Logs and Alerts in <b>Windows Firewall Settings</b> on the remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_BAD_NETPATH)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the remote computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorsetcollection-getdatacollectorsets
     */
    GetDataCollectorSets(server, filter) {
        server := server is String ? BSTR.Alloc(server).Value : server
        filter := filter is String ? BSTR.Alloc(filter).Value : filter

        result := ComCall(14, this, "ptr", server, "ptr", filter, "HRESULT")
        return result
    }
}
