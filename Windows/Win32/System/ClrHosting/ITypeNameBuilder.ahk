#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ITypeNameBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeNameBuilder
     * @type {Guid}
     */
    static IID => Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00523}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenGenericArguments", "CloseGenericArguments", "OpenGenericArgument", "CloseGenericArgument", "AddName", "AddPointer", "AddByRef", "AddSzArray", "AddArray", "AddAssemblySpec", "ToString", "Clear"]

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenGenericArguments() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseGenericArguments() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenGenericArgument() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseGenericArgument() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     */
    AddName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(7, this, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * Include the specified pointer in the set of pointers processed by the Interaction Context object.
     * @remarks
     * Turn pointer filtering on by setting INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext">SetPropertyInteractionContext</a>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-addpointerinteractioncontext
     */
    AddPointer() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddByRef() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddSzArray() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rank 
     * @returns {HRESULT} 
     */
    AddArray(rank) {
        result := ComCall(11, this, "uint", rank, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szAssemblySpec 
     * @returns {HRESULT} 
     */
    AddAssemblySpec(szAssemblySpec) {
        szAssemblySpec := szAssemblySpec is String ? StrPtr(szAssemblySpec) : szAssemblySpec

        result := ComCall(12, this, "ptr", szAssemblySpec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    ToString() {
        pszStringRepresentation := BSTR()
        result := ComCall(13, this, "ptr", pszStringRepresentation, "HRESULT")
        return pszStringRepresentation
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
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
