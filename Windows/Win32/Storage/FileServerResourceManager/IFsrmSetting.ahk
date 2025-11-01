#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to configure FSRM.
 * @remarks
 * 
  * To create this object from a script, use the program identifier, "Fsrm.FsrmSetting".
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmsetting
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmSetting extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmSetting
     * @type {Guid}
     */
    static IID => Guid("{f411d4fd-14be-4260-8c40-03b7c95e608a}")

    /**
     * The class identifier for FsrmSetting
     * @type {Guid}
     */
    static CLSID => Guid("{f556d708-6d4d-4594-9c61-7dbb0dae2a46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmtpServer", "put_SmtpServer", "get_MailFrom", "put_MailFrom", "get_AdminEmail", "put_AdminEmail", "get_DisableCommandLine", "put_DisableCommandLine", "get_EnableScreeningAudit", "put_EnableScreeningAudit", "EmailTest", "SetActionRunLimitInterval", "GetActionRunLimitInterval"]

    /**
     * 
     * @param {Pointer<BSTR>} smtpServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_smtpserver
     */
    get_SmtpServer(smtpServer) {
        result := ComCall(7, this, "ptr", smtpServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} smtpServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_smtpserver
     */
    put_SmtpServer(smtpServer) {
        smtpServer := smtpServer is String ? BSTR.Alloc(smtpServer).Value : smtpServer

        result := ComCall(8, this, "ptr", smtpServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_mailfrom
     */
    get_MailFrom(mailFrom) {
        result := ComCall(9, this, "ptr", mailFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mailFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_mailfrom
     */
    put_MailFrom(mailFrom) {
        mailFrom := mailFrom is String ? BSTR.Alloc(mailFrom).Value : mailFrom

        result := ComCall(10, this, "ptr", mailFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} adminEmail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_adminemail
     */
    get_AdminEmail(adminEmail) {
        result := ComCall(11, this, "ptr", adminEmail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} adminEmail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_adminemail
     */
    put_AdminEmail(adminEmail) {
        adminEmail := adminEmail is String ? BSTR.Alloc(adminEmail).Value : adminEmail

        result := ComCall(12, this, "ptr", adminEmail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} disableCommandLine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_disablecommandline
     */
    get_DisableCommandLine(disableCommandLine) {
        result := ComCall(13, this, "ptr", disableCommandLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} disableCommandLine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_disablecommandline
     */
    put_DisableCommandLine(disableCommandLine) {
        result := ComCall(14, this, "short", disableCommandLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enableScreeningAudit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_enablescreeningaudit
     */
    get_EnableScreeningAudit(enableScreeningAudit) {
        result := ComCall(15, this, "ptr", enableScreeningAudit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enableScreeningAudit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_enablescreeningaudit
     */
    put_EnableScreeningAudit(enableScreeningAudit) {
        result := ComCall(16, this, "short", enableScreeningAudit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-emailtest
     */
    EmailTest(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(17, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} actionType 
     * @param {Integer} delayTimeMinutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-setactionrunlimitinterval
     */
    SetActionRunLimitInterval(actionType, delayTimeMinutes) {
        result := ComCall(18, this, "int", actionType, "int", delayTimeMinutes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} actionType 
     * @param {Pointer<Integer>} delayTimeMinutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-getactionrunlimitinterval
     */
    GetActionRunLimitInterval(actionType, delayTimeMinutes) {
        result := ComCall(19, this, "int", actionType, "int*", delayTimeMinutes, "HRESULT")
        return result
    }
}
