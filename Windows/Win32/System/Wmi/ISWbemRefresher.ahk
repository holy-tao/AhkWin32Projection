#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemRefreshableItem.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemRefresher extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemRefresher
     * @type {Guid}
     */
    static IID => Guid("{14d8250e-d9c2-11d3-b38f-00105a1f473a}")

    /**
     * The class identifier for SWbemRefresher
     * @type {Guid}
     */
    static CLSID => Guid("{d269bf5c-d9c1-11d3-b38f-00105a1f473a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "AddEnum", "Remove", "Refresh", "get_AutoReconnect", "put_AutoReconnect", "DeleteAll"]

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
     * @type {VARIANT_BOOL} 
     */
    AutoReconnect {
        get => this.get_AutoReconnect()
        set => this.put_AutoReconnect(value)
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
     * @param {Integer} iIndex 
     * @returns {ISWbemRefreshableItem} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(iIndex) {
        result := ComCall(8, this, "int", iIndex, "ptr*", &objWbemRefreshableItem := 0, "HRESULT")
        return ISWbemRefreshableItem(objWbemRefreshableItem)
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
     * @param {ISWbemServicesEx} objWbemServices 
     * @param {BSTR} bsInstancePath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemRefreshableItem} 
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace
     */
    Add(objWbemServices, bsInstancePath, iFlags, objWbemNamedValueSet) {
        bsInstancePath := bsInstancePath is String ? BSTR.Alloc(bsInstancePath).Value : bsInstancePath

        result := ComCall(10, this, "ptr", objWbemServices, "ptr", bsInstancePath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemRefreshableItem := 0, "HRESULT")
        return ISWbemRefreshableItem(objWbemRefreshableItem)
    }

    /**
     * 
     * @param {ISWbemServicesEx} objWbemServices 
     * @param {BSTR} bsClassName 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemRefreshableItem} 
     */
    AddEnum(objWbemServices, bsClassName, iFlags, objWbemNamedValueSet) {
        bsClassName := bsClassName is String ? BSTR.Alloc(bsClassName).Value : bsClassName

        result := ComCall(11, this, "ptr", objWbemServices, "ptr", bsClassName, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemRefreshableItem := 0, "HRESULT")
        return ISWbemRefreshableItem(objWbemRefreshableItem)
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Integer} iIndex 
     * @param {Integer} iFlags 
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
    Remove(iIndex, iFlags) {
        result := ComCall(12, this, "int", iIndex, "int", iFlags, "HRESULT")
        return result
    }

    /**
     * RefreshIscsiSendTargetPortal function instructs the iSCSI initiator service to establish a discovery session with the indicated target portal and transmit a SendTargets request to refresh the list of discovered targets for the iSCSI initiator service. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RefreshIScsiSendTargetPortal as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} iFlags 
     * @returns {HRESULT} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-refreshiscsisendtargetportala
     */
    Refresh(iFlags) {
        result := ComCall(13, this, "int", iFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AutoReconnect() {
        result := ComCall(14, this, "short*", &bCount := 0, "HRESULT")
        return bCount
    }

    /**
     * 
     * @param {VARIANT_BOOL} bCount 
     * @returns {HRESULT} 
     */
    put_AutoReconnect(bCount) {
        result := ComCall(15, this, "short", bCount, "HRESULT")
        return result
    }

    /**
     * The DeleteAllGPOLinks function deletes all GPO links for the specified site, domain, or organizational unit.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-deleteallgpolinks
     */
    DeleteAll() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
