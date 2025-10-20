#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmQuotaBase.ahk

/**
 * Base class for the quota and automatic quota interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotaobject
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaObject extends IFsrmQuotaBase{
    /**
     * The interface identifier for IFsrmQuotaObject
     * @type {Guid}
     */
    static IID => Guid("{42dc3511-61d5-48ae-b6dc-59fc00c0a8d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_Path(path) {
        result := ComCall(22, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userSid 
     * @returns {HRESULT} 
     */
    get_UserSid(userSid) {
        result := ComCall(23, this, "ptr", userSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userAccount 
     * @returns {HRESULT} 
     */
    get_UserAccount(userAccount) {
        result := ComCall(24, this, "ptr", userAccount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} quotaTemplateName 
     * @returns {HRESULT} 
     */
    get_SourceTemplateName(quotaTemplateName) {
        result := ComCall(25, this, "ptr", quotaTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} matches 
     * @returns {HRESULT} 
     */
    get_MatchesSourceTemplate(matches) {
        result := ComCall(26, this, "ptr", matches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} quotaTemplateName 
     * @returns {HRESULT} 
     */
    ApplyTemplate(quotaTemplateName) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName

        result := ComCall(27, this, "ptr", quotaTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
