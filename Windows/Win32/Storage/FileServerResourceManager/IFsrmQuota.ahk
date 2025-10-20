#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmQuotaObject.ahk

/**
 * Used to define a quota for a specified directory and to retrieve use statistics.
 * @remarks
 * 
  * A quota limits the amount of data that the system or any user can store in a directory.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquota
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuota extends IFsrmQuotaObject{
    /**
     * The interface identifier for IFsrmQuota
     * @type {Guid}
     */
    static IID => Guid("{377f739d-9647-4b8e-97d2-5ffce6d759cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * 
     * @param {Pointer<VARIANT>} used 
     * @returns {HRESULT} 
     */
    get_QuotaUsed(used) {
        result := ComCall(28, this, "ptr", used, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} peakUsage 
     * @returns {HRESULT} 
     */
    get_QuotaPeakUsage(peakUsage) {
        result := ComCall(29, this, "ptr", peakUsage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} peakUsageDateTime 
     * @returns {HRESULT} 
     */
    get_QuotaPeakUsageTime(peakUsageDateTime) {
        result := ComCall(30, this, "double*", peakUsageDateTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetPeakUsage() {
        result := ComCall(31, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshUsageProperties() {
        result := ComCall(32, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
