#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class ISideShowKeyCollection extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowKeyCollection
     * @type {Guid}
     */
    static IID => Guid("{045473bc-a37b-4957-b144-68105411ed8e}")

    /**
     * The class identifier for SideShowKeyCollection
     * @type {Guid}
     */
    static CLSID => Guid("{dfbbdbf8-18de-49b8-83dc-ebc727c62d94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Clear", "GetAt", "GetCount", "RemoveAt"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @returns {HRESULT} 
     */
    Add(Key) {
        result := ComCall(3, this, "ptr", Key, "HRESULT")
        return result
    }

    /**
     * Resets the TPM to its factory-default state.
     * @remarks
     * Running this method can help prepare a TPM-equipped computer for recycling.
     * 
     * To clear the TPM but no longer have the TPM owner authorization, you need physical access to the computer. The [**SetPhysicalPresenceRequest**](setphysicalpresencerequest-win32-tpm.md) method includes functionality to help clear the TPM without TPM owner authorization.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * The following table lists some of the common return codes.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                         | Description                                                                                                                                                                          |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                         | The method was successful.<br/>                                                                                                                                                |
     * | <dl> <dt>**TPM\_E\_AUTHFAIL**</dt> <dt>2150105089 (0x80280001)</dt> </dl>              | The provided owner authorization value cannot perform the request.<br/>                                                                                                        |
     * | <dl> <dt>**TPM\_E\_DEFEND\_LOCK\_RUNNING**</dt> <dt>2150107139 (0x80280803)</dt> </dl> | The TPM is defending against dictionary attacks and is in a time-out period. For more information, see the [**ResetAuthLockOut**](resetauthlockout-win32-tpm.md) method.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/clear-win32-tpm
     */
    Clear() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @returns {HRESULT} 
     */
    GetAt(dwIndex, pKey) {
        result := ComCall(5, this, "uint", dwIndex, "ptr", pKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcElems 
     * @returns {HRESULT} 
     */
    GetCount(pcElems) {
        pcElemsMarshal := pcElems is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pcElemsMarshal, pcElems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     */
    RemoveAt(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "HRESULT")
        return result
    }
}
