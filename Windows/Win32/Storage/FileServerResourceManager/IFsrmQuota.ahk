#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QuotaUsed", "get_QuotaPeakUsage", "get_QuotaPeakUsageTime", "ResetPeakUsage", "RefreshUsageProperties"]

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-get_quotaused
     */
    get_QuotaUsed() {
        used := VARIANT()
        result := ComCall(28, this, "ptr", used, "HRESULT")
        return used
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-get_quotapeakusage
     */
    get_QuotaPeakUsage() {
        peakUsage := VARIANT()
        result := ComCall(29, this, "ptr", peakUsage, "HRESULT")
        return peakUsage
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-get_quotapeakusagetime
     */
    get_QuotaPeakUsageTime() {
        result := ComCall(30, this, "double*", &peakUsageDateTime := 0, "HRESULT")
        return peakUsageDateTime
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-resetpeakusage
     */
    ResetPeakUsage() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-refreshusageproperties
     */
    RefreshUsageProperties() {
        result := ComCall(32, this, "HRESULT")
        return result
    }
}
