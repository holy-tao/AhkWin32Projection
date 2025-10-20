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
     * 
     * @param {PWSTR} wszPropertyName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Int32>} plHandle 
     * @returns {HRESULT} 
     */
    GetPropertyHandle(wszPropertyName, pType, plHandle) {
        wszPropertyName := wszPropertyName is String ? StrPtr(wszPropertyName) : wszPropertyName

        result := ComCall(27, this, "ptr", wszPropertyName, "int*", pType, "int*", plHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Integer} lNumBytes 
     * @param {Pointer<Byte>} aData 
     * @returns {HRESULT} 
     */
    WritePropertyValue(lHandle, lNumBytes, aData) {
        result := ComCall(28, this, "int", lHandle, "int", lNumBytes, "char*", aData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Integer} lBufferSize 
     * @param {Pointer<Int32>} plNumBytes 
     * @param {Pointer<Byte>} aData 
     * @returns {HRESULT} 
     */
    ReadPropertyValue(lHandle, lBufferSize, plNumBytes, aData) {
        result := ComCall(29, this, "int", lHandle, "int", lBufferSize, "int*", plNumBytes, "char*", aData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Pointer<UInt32>} pdw 
     * @returns {HRESULT} 
     */
    ReadDWORD(lHandle, pdw) {
        result := ComCall(30, this, "int", lHandle, "uint*", pdw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     */
    WriteDWORD(lHandle, dw) {
        result := ComCall(31, this, "int", lHandle, "uint", dw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Pointer<UInt64>} pqw 
     * @returns {HRESULT} 
     */
    ReadQWORD(lHandle, pqw) {
        result := ComCall(32, this, "int", lHandle, "uint*", pqw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Integer} pw 
     * @returns {HRESULT} 
     */
    WriteQWORD(lHandle, pw) {
        result := ComCall(33, this, "int", lHandle, "uint", pw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHandle 
     * @param {Pointer<BSTR>} pstrName 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetPropertyInfoByHandle(lHandle, pstrName, pType) {
        result := ComCall(34, this, "int", lHandle, "ptr", pstrName, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    Lock(lFlags) {
        result := ComCall(35, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    Unlock(lFlags) {
        result := ComCall(36, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
