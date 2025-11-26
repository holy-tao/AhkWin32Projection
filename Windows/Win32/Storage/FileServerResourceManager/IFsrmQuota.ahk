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
     * @type {VARIANT} 
     */
    QuotaUsed {
        get => this.get_QuotaUsed()
    }

    /**
     * @type {VARIANT} 
     */
    QuotaPeakUsage {
        get => this.get_QuotaPeakUsage()
    }

    /**
     * @type {Float} 
     */
    QuotaPeakUsageTime {
        get => this.get_QuotaPeakUsageTime()
    }

    /**
     * Retrieves the current amount of disk space usage charged to this quota.
     * @remarks
     * 
     * The value is the total disk space usage for the directory and all its subdirectories (recursively). Files, 
     *     directories, streams, metadata, and other file system–specific means of persisting data are 
     *     used in determining the usage.
     * 
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquota-get_quotaused
     */
    get_QuotaUsed() {
        used := VARIANT()
        result := ComCall(28, this, "ptr", used, "HRESULT")
        return used
    }

    /**
     * Retrieves the highest amount of disk space usage charged to this quota.
     * @remarks
     * 
     * The value represents the highest amount of disk space charged to this quota since the last call to 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquota-resetpeakusage">IFsrmQuota::ResetPeakUsage</a>. To reset this value, 
     *     call the <b>ResetPeakUsage</b> method.
     * 
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquota-get_quotapeakusage
     */
    get_QuotaPeakUsage() {
        peakUsage := VARIANT()
        result := ComCall(29, this, "ptr", peakUsage, "HRESULT")
        return peakUsage
    }

    /**
     * Retrieves the date and time that the IFsrmQuota::QuotaPeakUsage property was set.
     * @remarks
     * 
     * The time stamp is set when the quota usage reaches a new, higher peak level, or the peak usage value is 
     *     reset.
     * 
     * To get the highest peak usage value, access the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquota-get_quotapeakusage">QuotaPeakUsage</a> property.
     * 
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquota-get_quotapeakusagetime
     */
    get_QuotaPeakUsageTime() {
        result := ComCall(30, this, "double*", &peakUsageDateTime := 0, "HRESULT")
        return peakUsageDateTime
    }

    /**
     * Resets the peak usage of this quota to the current usage.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquota-resetpeakusage
     */
    ResetPeakUsage() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * Refreshes this object's quota usage information from the current information in FSRM.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquota-refreshusageproperties
     */
    RefreshUsageProperties() {
        result := ComCall(32, this, "HRESULT")
        return result
    }
}
