#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsReplicaPointer interface provides methods for an ADSI client to access the Replica Pointer attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsreplicapointer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsReplicaPointer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsReplicaPointer
     * @type {Guid}
     */
    static IID => Guid("{f60fb803-4080-11d1-a3ac-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServerName", "put_ServerName", "get_ReplicaType", "put_ReplicaType", "get_ReplicaNumber", "put_ReplicaNumber", "get_Count", "put_Count", "get_ReplicaAddressHints", "put_ReplicaAddressHints"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ServerName(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @returns {HRESULT} 
     */
    put_ServerName(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(8, this, "ptr", bstrServerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_ReplicaType(retval) {
        result := ComCall(9, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnReplicaType 
     * @returns {HRESULT} 
     */
    put_ReplicaType(lnReplicaType) {
        result := ComCall(10, this, "int", lnReplicaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_ReplicaNumber(retval) {
        result := ComCall(11, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnReplicaNumber 
     * @returns {HRESULT} 
     */
    put_ReplicaNumber(lnReplicaNumber) {
        result := ComCall(12, this, "int", lnReplicaNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Count(retval) {
        result := ComCall(13, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnCount 
     * @returns {HRESULT} 
     */
    put_Count(lnCount) {
        result := ComCall(14, this, "int", lnCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_ReplicaAddressHints(retval) {
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vReplicaAddressHints 
     * @returns {HRESULT} 
     */
    put_ReplicaAddressHints(vReplicaAddressHints) {
        result := ComCall(16, this, "ptr", vReplicaAddressHints, "HRESULT")
        return result
    }
}
