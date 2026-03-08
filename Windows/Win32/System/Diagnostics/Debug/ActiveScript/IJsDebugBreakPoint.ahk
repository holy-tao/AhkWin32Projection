#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugBreakPoint extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsDebugBreakPoint
     * @type {Guid}
     */
    static IID => Guid("{df6773e3-ed8d-488b-8a3e-5812577d1542}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsEnabled", "Enable", "Disable", "Delete", "GetDocumentPosition"]

    /**
     * The IsEnabled method of the Win32\_Tpm class indicates whether the device is enabled. This value can be changed by the Enable and Disable methods.
     * @remarks
     * According to the Trusted Computing Group (TCG) v1.2 specification only the following commands are available when the device is in a deactivated state.
     * 
     * -   TPM\_ContinueSelfTest
     * -   TPM\_DSAP
     * -   TPM\_FlushSpecific
     * -   TPM\_GetCapability
     * -   TPM\_GetTestResult
     * -   TPM\_Init
     * -   TPM\_OIAP
     * -   TPM\_OSAP
     * -   TPM\_OwnerSetDisable
     * -   TPM\_PCR\_Reset
     * -   TPM\_PhysicalDisable
     * -   TPM\_PhysicalEnable
     * -   TPM\_PhysicalSetDeactivated
     * -   TPM\_Reset
     * -   TPM\_SaveState
     * -   TPM\_SelfTestFull
     * -   TPM\_SetCapability
     * -   TPM\_SHA1Complete
     * -   TPM\_SHA1Start
     * -   TPM\_SHA1Update
     * -   TPM\_Startup
     * -   TPM\_TakeOwnership
     * -   TPM\_Terminate\_Handle
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/isenabled-win32-tpm
     */
    IsEnabled() {
        result := ComCall(3, this, "int*", &pIsEnabled := 0, "HRESULT")
        return pIsEnabled
    }

    /**
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/enable-systemrestore
     */
    Enable() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Disables monitoring on a particular drive.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/disable-systemrestore
     */
    Disable() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Deletes an access control entry (ACE) from an access control list (ACL).
     * @remarks
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_size_information">ACL_SIZE_INFORMATION</a> structure retrieved by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getaclinformation">GetAclInformation</a> function to discover the size of the ACL and the number of ACEs it contains. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getace">GetAce</a> function retrieves information about an individual ACE.
     * @returns {HRESULT} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-deleteace
     */
    Delete() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDocumentId 
     * @param {Pointer<Integer>} pCharacterOffset 
     * @param {Pointer<Integer>} pStatementCharCount 
     * @returns {HRESULT} 
     */
    GetDocumentPosition(pDocumentId, pCharacterOffset, pStatementCharCount) {
        pDocumentIdMarshal := pDocumentId is VarRef ? "uint*" : "ptr"
        pCharacterOffsetMarshal := pCharacterOffset is VarRef ? "uint*" : "ptr"
        pStatementCharCountMarshal := pStatementCharCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pDocumentIdMarshal, pDocumentId, pCharacterOffsetMarshal, pCharacterOffset, pStatementCharCountMarshal, pStatementCharCount, "HRESULT")
        return result
    }
}
