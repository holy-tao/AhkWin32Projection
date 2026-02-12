#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsReplicaPointer interface provides methods for an ADSI client to access the Replica Pointer attribute.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadsreplicapointer
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
     * @type {BSTR} 
     */
    ServerName {
        get => this.get_ServerName()
        set => this.put_ServerName(value)
    }

    /**
     * @type {Integer} 
     */
    ReplicaType {
        get => this.get_ReplicaType()
        set => this.put_ReplicaType(value)
    }

    /**
     * @type {Integer} 
     */
    ReplicaNumber {
        get => this.get_ReplicaNumber()
        set => this.put_ReplicaNumber(value)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
        set => this.put_Count(value)
    }

    /**
     * @type {VARIANT} 
     */
    ReplicaAddressHints {
        get => this.get_ReplicaAddressHints()
        set => this.put_ReplicaAddressHints(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ServerName() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @returns {HRESULT} 
     */
    put_ServerName(bstrServerName) {
        if(bstrServerName is String) {
            pin := BSTR.Alloc(bstrServerName)
            bstrServerName := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrServerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReplicaType() {
        result := ComCall(9, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnReplicaType 
     * @returns {HRESULT} 
     */
    put_ReplicaType(lnReplicaType) {
        result := ComCall(10, this, "int", lnReplicaType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReplicaNumber() {
        result := ComCall(11, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnReplicaNumber 
     * @returns {HRESULT} 
     */
    put_ReplicaNumber(lnReplicaNumber) {
        result := ComCall(12, this, "int", lnReplicaNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(13, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnCount 
     * @returns {HRESULT} 
     */
    put_Count(lnCount) {
        result := ComCall(14, this, "int", lnCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ReplicaAddressHints() {
        retval := VARIANT()
        result := ComCall(15, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {VARIANT} vReplicaAddressHints 
     * @returns {HRESULT} 
     */
    put_ReplicaAddressHints(vReplicaAddressHints) {
        result := ComCall(16, this, "ptr", vReplicaAddressHints, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
