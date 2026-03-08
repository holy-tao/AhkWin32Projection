#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemPrivilege.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemPrivilegeSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemPrivilegeSet
     * @type {Guid}
     */
    static IID => Guid("{26ee67bf-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The class identifier for SWbemPrivilegeSet
     * @type {Guid}
     */
    static CLSID => Guid("{26ee67be-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "Remove", "DeleteAll", "AddAsString"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} iPrivilege 
     * @returns {ISWbemPrivilege} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(iPrivilege) {
        result := ComCall(8, this, "int", iPrivilege, "ptr*", &objWbemPrivilege := 0, "HRESULT")
        return ISWbemPrivilege(objWbemPrivilege)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "HRESULT")
        return iCount
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
     * @param {Integer} iPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {ISWbemPrivilege} 
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace
     */
    Add(iPrivilege, bIsEnabled) {
        result := ComCall(10, this, "int", iPrivilege, "short", bIsEnabled, "ptr*", &objWbemPrivilege := 0, "HRESULT")
        return ISWbemPrivilege(objWbemPrivilege)
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Integer} iPrivilege 
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
    Remove(iPrivilege) {
        result := ComCall(11, this, "int", iPrivilege, "HRESULT")
        return result
    }

    /**
     * The DeleteAllGPOLinks function deletes all GPO links for the specified site, domain, or organizational unit.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-deleteallgpolinks
     */
    DeleteAll() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {ISWbemPrivilege} 
     */
    AddAsString(strPrivilege, bIsEnabled) {
        strPrivilege := strPrivilege is String ? BSTR.Alloc(strPrivilege).Value : strPrivilege

        result := ComCall(13, this, "ptr", strPrivilege, "short", bIsEnabled, "ptr*", &objWbemPrivilege := 0, "HRESULT")
        return ISWbemPrivilege(objWbemPrivilege)
    }
}
