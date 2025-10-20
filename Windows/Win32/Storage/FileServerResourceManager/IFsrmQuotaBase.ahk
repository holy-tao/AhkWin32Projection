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
     * 
     * @param {Pointer<VARIANT>} quotaLimit 
     * @returns {HRESULT} 
     */
    get_QuotaLimit(quotaLimit) {
        result := ComCall(12, this, "ptr", quotaLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} quotaLimit 
     * @returns {HRESULT} 
     */
    put_QuotaLimit(quotaLimit) {
        result := ComCall(13, this, "ptr", quotaLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} quotaFlags 
     * @returns {HRESULT} 
     */
    get_QuotaFlags(quotaFlags) {
        result := ComCall(14, this, "int*", quotaFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} quotaFlags 
     * @returns {HRESULT} 
     */
    put_QuotaFlags(quotaFlags) {
        result := ComCall(15, this, "int", quotaFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} thresholds 
     * @returns {HRESULT} 
     */
    get_Thresholds(thresholds) {
        result := ComCall(16, this, "ptr", thresholds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @returns {HRESULT} 
     */
    AddThreshold(threshold) {
        result := ComCall(17, this, "int", threshold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @returns {HRESULT} 
     */
    DeleteThreshold(threshold) {
        result := ComCall(18, this, "int", threshold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @param {Integer} newThreshold 
     * @returns {HRESULT} 
     */
    ModifyThreshold(threshold, newThreshold) {
        result := ComCall(19, this, "int", threshold, "int", newThreshold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @param {Integer} actionType 
     * @param {Pointer<IFsrmAction>} action 
     * @returns {HRESULT} 
     */
    CreateThresholdAction(threshold, actionType, action) {
        result := ComCall(20, this, "int", threshold, "int", actionType, "ptr", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} threshold 
     * @param {Pointer<IFsrmCollection>} actions 
     * @returns {HRESULT} 
     */
    EnumThresholdActions(threshold, actions) {
        result := ComCall(21, this, "int", threshold, "ptr", actions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
