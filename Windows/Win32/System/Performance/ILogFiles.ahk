#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\DILogFileItem.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ILogFiles extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILogFiles
     * @type {Guid}
     */
    static IID => Guid("{6a2a97e6-6851-41ea-87ad-2a8225335865}")

    /**
     * The class identifier for LogFiles
     * @type {Guid}
     */
    static CLSID => Guid("{2735d9fd-f6b9-4f19-a5d9-e2d068584bc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item", "Add", "Remove"]

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
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pLong := 0, "HRESULT")
        return pLong
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppIunk := 0, "HRESULT")
        return IUnknown(ppIunk)
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {DILogFileItem} 
     */
    get_Item(index) {
        result := ComCall(9, this, "ptr", index, "ptr*", &ppI := 0, "HRESULT")
        return DILogFileItem(ppI)
    }

    /**
     * Adds an access-allowed access control entry (ACE) to an access control list (ACL). The access is granted to a specified security identifier (SID).
     * @remarks
     * The addition of an access-allowed ACE to an ACL is the most common form of ACL modification.
     * 
     * The <b>AddAccessAllowedAce</b> and <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedace">AddAccessDeniedAce</a> functions add a new ACE to the end of the list of ACEs for the ACL. These functions do not automatically place the new ACE in the proper canonical order. It is the caller's responsibility to ensure that the ACL is in canonical order by adding ACEs in the proper sequence.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure placed in the ACE by the <b>AddAccessAllowedAce</b> function specifies a type and size, but provides no inheritance and no ACE flags.
     * @param {BSTR} pathname 
     * @returns {DILogFileItem} 
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace
     */
    Add(pathname) {
        pathname := pathname is String ? BSTR.Alloc(pathname).Value : pathname

        result := ComCall(10, this, "ptr", pathname, "ptr*", &ppI := 0, "HRESULT")
        return DILogFileItem(ppI)
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {VARIANT} index 
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/removeblockedcommand-win32-tpm
     */
    Remove(index) {
        result := ComCall(11, this, "ptr", index, "HRESULT")
        return result
    }
}
