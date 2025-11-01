#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmObject.ahk

/**
 * Base interface for all quota interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotabase
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaBase extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmQuotaBase
     * @type {Guid}
     */
    static IID => Guid("{1568a795-3924-4118-b74b-68d8f0fa5daf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QuotaLimit", "put_QuotaLimit", "get_QuotaFlags", "put_QuotaFlags", "get_Thresholds", "AddThreshold", "DeleteThreshold", "ModifyThreshold", "CreateThresholdAction", "EnumThresholdActions"]

    /**
     * 
     * @param {Pointer<VARIANT>} quotaLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-get_quotalimit
     */
    get_QuotaLimit(quotaLimit) {
        result := ComCall(12, this, "ptr", quotaLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} quotaLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-put_quotalimit
     */
    put_QuotaLimit(quotaLimit) {
        result := ComCall(13, this, "ptr", quotaLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} quotaFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-get_quotaflags
     */
    get_QuotaFlags(quotaFlags) {
        quotaFlagsMarshal := quotaFlags is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, quotaFlagsMarshal, quotaFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} quotaFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-put_quotaflags
     */
    put_QuotaFlags(quotaFlags) {
        result := ComCall(15, this, "int", quotaFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} thresholds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-get_thresholds
     */
    get_Thresholds(thresholds) {
        result := ComCall(16, this, "ptr*", thresholds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-addthreshold
     */
    AddThreshold(threshold) {
        result := ComCall(17, this, "int", threshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-deletethreshold
     */
    DeleteThreshold(threshold) {
        result := ComCall(18, this, "int", threshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @param {Integer} newThreshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-modifythreshold
     */
    ModifyThreshold(threshold, newThreshold) {
        result := ComCall(19, this, "int", threshold, "int", newThreshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @param {Integer} actionType 
     * @param {Pointer<IFsrmAction>} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-createthresholdaction
     */
    CreateThresholdAction(threshold, actionType, action) {
        result := ComCall(20, this, "int", threshold, "int", actionType, "ptr*", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @param {Pointer<IFsrmCollection>} actions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-enumthresholdactions
     */
    EnumThresholdActions(threshold, actions) {
        result := ComCall(21, this, "int", threshold, "ptr*", actions, "HRESULT")
        return result
    }
}
