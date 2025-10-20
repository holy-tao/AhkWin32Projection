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
     * 
     * @param {Pointer<BSTR>} smtpServer 
     * @returns {HRESULT} 
     */
    get_SmtpServer(smtpServer) {
        result := ComCall(7, this, "ptr", smtpServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} smtpServer 
     * @returns {HRESULT} 
     */
    put_SmtpServer(smtpServer) {
        smtpServer := smtpServer is String ? BSTR.Alloc(smtpServer).Value : smtpServer

        result := ComCall(8, this, "ptr", smtpServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailFrom 
     * @returns {HRESULT} 
     */
    get_MailFrom(mailFrom) {
        result := ComCall(9, this, "ptr", mailFrom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailFrom 
     * @returns {HRESULT} 
     */
    put_MailFrom(mailFrom) {
        mailFrom := mailFrom is String ? BSTR.Alloc(mailFrom).Value : mailFrom

        result := ComCall(10, this, "ptr", mailFrom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} adminEmail 
     * @returns {HRESULT} 
     */
    get_AdminEmail(adminEmail) {
        result := ComCall(11, this, "ptr", adminEmail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} adminEmail 
     * @returns {HRESULT} 
     */
    put_AdminEmail(adminEmail) {
        adminEmail := adminEmail is String ? BSTR.Alloc(adminEmail).Value : adminEmail

        result := ComCall(12, this, "ptr", adminEmail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} disableCommandLine 
     * @returns {HRESULT} 
     */
    get_DisableCommandLine(disableCommandLine) {
        result := ComCall(13, this, "ptr", disableCommandLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} disableCommandLine 
     * @returns {HRESULT} 
     */
    put_DisableCommandLine(disableCommandLine) {
        result := ComCall(14, this, "short", disableCommandLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enableScreeningAudit 
     * @returns {HRESULT} 
     */
    get_EnableScreeningAudit(enableScreeningAudit) {
        result := ComCall(15, this, "ptr", enableScreeningAudit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enableScreeningAudit 
     * @returns {HRESULT} 
     */
    put_EnableScreeningAudit(enableScreeningAudit) {
        result := ComCall(16, this, "short", enableScreeningAudit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     */
    EmailTest(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(17, this, "ptr", mailTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} actionType 
     * @param {Integer} delayTimeMinutes 
     * @returns {HRESULT} 
     */
    SetActionRunLimitInterval(actionType, delayTimeMinutes) {
        result := ComCall(18, this, "int", actionType, "int", delayTimeMinutes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} actionType 
     * @param {Pointer<Int32>} delayTimeMinutes 
     * @returns {HRESULT} 
     */
    GetActionRunLimitInterval(actionType, delayTimeMinutes) {
        result := ComCall(19, this, "int", actionType, "int*", delayTimeMinutes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
