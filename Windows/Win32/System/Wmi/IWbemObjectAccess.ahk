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
     * 
     * @param {PWSTR} wszPropertyName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} plHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-getpropertyhandle
     */
    GetPropertyHandle(wszPropertyName, pType, plHandle) {
        wszPropertyName := wszPropertyName is String ? StrPtr(wszPropertyName) : wszPropertyName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        plHandleMarshal := plHandle is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, "ptr", wszPropertyName, pTypeMarshal, pType, plHandleMarshal, plHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Integer} lNumBytes 
     * @param {Pointer<Integer>} aData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-writepropertyvalue
     */
    WritePropertyValue(lHandle, lNumBytes, aData) {
        aDataMarshal := aData is VarRef ? "char*" : "ptr"

        result := ComCall(28, this, "int", lHandle, "int", lNumBytes, aDataMarshal, aData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Integer} lBufferSize 
     * @param {Pointer<Integer>} plNumBytes 
     * @param {Pointer<Integer>} aData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-readpropertyvalue
     */
    ReadPropertyValue(lHandle, lBufferSize, plNumBytes, aData) {
        plNumBytesMarshal := plNumBytes is VarRef ? "int*" : "ptr"
        aDataMarshal := aData is VarRef ? "char*" : "ptr"

        result := ComCall(29, this, "int", lHandle, "int", lBufferSize, plNumBytesMarshal, plNumBytes, aDataMarshal, aData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-readdword
     */
    ReadDWORD(lHandle) {
        result := ComCall(30, this, "int", lHandle, "uint*", &pdw := 0, "HRESULT")
        return pdw
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-writedword
     */
    WriteDWORD(lHandle, dw) {
        result := ComCall(31, this, "int", lHandle, "uint", dw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-readqword
     */
    ReadQWORD(lHandle) {
        result := ComCall(32, this, "int", lHandle, "uint*", &pqw := 0, "HRESULT")
        return pqw
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Integer} pw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-writeqword
     */
    WriteQWORD(lHandle, pw) {
        result := ComCall(33, this, "int", lHandle, "uint", pw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Pointer<BSTR>} pstrName 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-getpropertyinfobyhandle
     */
    GetPropertyInfoByHandle(lHandle, pstrName, pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, "int", lHandle, "ptr", pstrName, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-lock
     */
    Lock(lFlags) {
        result := ComCall(35, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectaccess-unlock
     */
    Unlock(lFlags) {
        result := ComCall(36, this, "int", lFlags, "HRESULT")
        return result
    }
}
