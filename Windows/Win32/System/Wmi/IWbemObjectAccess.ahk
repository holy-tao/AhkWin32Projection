#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemClassObject.ahk

/**
 * Provides access to the methods and properties of an object.
 * @remarks
 * 
 * The 
 * <b>IWbemObjectAccess</b> methods that read and write data perform very little data validation. Because 
 * <b>IWbemObjectAccess</b> methods directly access properties, you can get and set properties much more rapidly than you can using standard object access techniques such as 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-get">IWbemClassObject::Get</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-put">IWbemClassObject::Put</a>.
 * 
 * <div class="alert"><b>Note</b>  To maximize its speed, 
 * <b>IWbemObjectAccess</b> is completely unchecked. It is the responsibility of the user to ensure that all handles are proper, and that write buffers are correctly sized. Read and write operations are not intrinsically thread-safe. You should call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectaccess-lock">IWbemObjectAccess::Lock</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectaccess-unlock">IWbemObjectAccess::Unlock</a> methods to prevent 
 * <b>IWbemObjectAccess</b> objects from concurrent access on multiple threads.</div>
 * <div> </div>
 * Property handles are the same for all instances of a class. Therefore, it is only necessary to retrieve a handle one time.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemobjectaccess
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemObjectAccess extends IWbemClassObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemObjectAccess
     * @type {Guid}
     */
    static IID => Guid("{49353c9a-516b-11d1-aea6-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyHandle", "WritePropertyValue", "ReadPropertyValue", "ReadDWORD", "WriteDWORD", "ReadQWORD", "WriteQWORD", "GetPropertyInfoByHandle", "Lock", "Unlock"]

    /**
     * The GetPropertyHandle method returns a unique handle that identifies a property. You can use this handle to identify properties when using IWbemObjectAccess methods to read or write property values.
     * @param {PWSTR} wszPropertyName Constant, null-terminated string of 16-bit Unicode characters that contains the property name.
     * @param {Pointer<Integer>} pType Pointer to a <b>CIMTYPE</b> used to return the CIM type of the property.
     * @param {Pointer<Integer>} plHandle Pointer to an integer used to return the property handle.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-getpropertyhandle
     */
    GetPropertyHandle(wszPropertyName, pType, plHandle) {
        wszPropertyName := wszPropertyName is String ? StrPtr(wszPropertyName) : wszPropertyName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        plHandleMarshal := plHandle is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, "ptr", wszPropertyName, pTypeMarshal, pType, plHandleMarshal, plHandle, "HRESULT")
        return result
    }

    /**
     * The WritePropertyValue method writes a specified number of bytes to a property identified by a property handle. Use this method to set string and all other non-DWORD or non-QWORD data.
     * @param {Integer} lHandle Integer that contains the handle that identifies this property.
     * @param {Integer} lNumBytes Integer that contains the number of bytes being written to the property. For nonstring property values, <i>lNumBytes</i> must be the correct data size of the property type specified. For string property values such as reference, string, and datetime, <i>lNumBytes</i> must be the length of the specified string in bytes, and the string itself must be of an even length in bytes and be followed with a null-termination character.
     * @param {Pointer<Integer>} aData Pointer to the constant byte type array that contains the data.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-writepropertyvalue
     */
    WritePropertyValue(lHandle, lNumBytes, aData) {
        aDataMarshal := aData is VarRef ? "char*" : "ptr"

        result := ComCall(28, this, "int", lHandle, "int", lNumBytes, aDataMarshal, aData, "HRESULT")
        return result
    }

    /**
     * The ReadPropertyValue method returns a specified number of bytes of a property associated with a property handle.
     * @param {Integer} lHandle Integer that contains the handle identifying this property.
     * @param {Integer} lBufferSize Integer that contains the buffer size.
     * @param {Pointer<Integer>} plNumBytes Pointer to an integer used to return the number of bytes read.
     * @param {Pointer<Integer>} aData Pointer to an array used to return the property data.
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful; otherwise, this method returns an <b>HRESULT</b> with one of the following values.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-readpropertyvalue
     */
    ReadPropertyValue(lHandle, lBufferSize, plNumBytes, aData) {
        plNumBytesMarshal := plNumBytes is VarRef ? "int*" : "ptr"
        aDataMarshal := aData is VarRef ? "char*" : "ptr"

        result := ComCall(29, this, "int", lHandle, "int", lBufferSize, plNumBytesMarshal, plNumBytes, aDataMarshal, aData, "HRESULT")
        return result
    }

    /**
     * The ReadDWORD method reads 32 bits of property data using a property handle.
     * @param {Integer} lHandle Integer that contains the handle that identifies this property.
     * @returns {Integer} Pointer to a 32-bit unsigned integer used to return the data.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-readdword
     */
    ReadDWORD(lHandle) {
        result := ComCall(30, this, "int", lHandle, "uint*", &pdw := 0, "HRESULT")
        return pdw
    }

    /**
     * The WriteDWORD method writes 32 bits of data to a property identified by a property handle.
     * @param {Integer} lHandle Integer that contains the handle identifying this property.
     * @param {Integer} dw Unsigned 32-bit integer that contains the data being written.
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-writedword
     */
    WriteDWORD(lHandle, dw) {
        result := ComCall(31, this, "int", lHandle, "uint", dw, "HRESULT")
        return result
    }

    /**
     * The ReadQWORD method reads 64 bits of property data identified by a property handle.
     * @param {Integer} lHandle Integer that contains the handle identifying the property.
     * @returns {Integer} Pointer to a unsigned 64-bit integer used to return the data being read.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-readqword
     */
    ReadQWORD(lHandle) {
        result := ComCall(32, this, "int", lHandle, "uint*", &pqw := 0, "HRESULT")
        return pqw
    }

    /**
     * The WriteQWORD method writes 64 bits of data to a property by using a property handle.
     * @param {Integer} lHandle Integer that contains the handle that identifies this property.
     * @param {Integer} pw Unsigned 64-bit integer that contains the data written to the specified property.
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-writeqword
     */
    WriteQWORD(lHandle, pw) {
        result := ComCall(33, this, "int", lHandle, "uint", pw, "HRESULT")
        return result
    }

    /**
     * The GetPropertyInfoByHandle method returns the name and data type of the property that is associated with a property handle.
     * @param {Integer} lHandle Integer that contains the handle identifying the property.
     * @param {Pointer<BSTR>} pstrName Pointer to a string used to return the name of the specified property.
     * @param {Pointer<Integer>} pType Pointer to a <b>CIMTYPE</b> used to return the type of the property.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-getpropertyinfobyhandle
     */
    GetPropertyInfoByHandle(lHandle, pstrName, pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, "int", lHandle, "ptr", pstrName, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * The Lock method prevents other threads from updating an IWbemObjectAccess object until it is unlocked.
     * @param {Integer} lFlags Reserved. This parameter is currently ignored and is reserved for future use.
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-lock
     */
    Lock(lFlags) {
        result := ComCall(35, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The Unlock method allows other threads to update the property values of an IWbemObjectAccess object.
     * @param {Integer} lFlags Reserved. This parameter is currently ignored and is reserved for future use.
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemobjectaccess-unlock
     */
    Unlock(lFlags) {
        result := ComCall(36, this, "int", lFlags, "HRESULT")
        return result
    }
}
