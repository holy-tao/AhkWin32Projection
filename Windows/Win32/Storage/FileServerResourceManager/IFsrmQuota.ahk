#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmQuotaObject.ahk" { IFsrmQuotaObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to define a quota for a specified directory and to retrieve use statistics.
 * @remarks
 * A quota limits the amount of data that the system or any user can store in a directory.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nn-fsrmquota-ifsrmquota
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmQuota extends IFsrmQuotaObject {
    /**
     * The interface identifier for IFsrmQuota
     * @type {Guid}
     */
    static IID := Guid("{377f739d-9647-4b8e-97d2-5ffce6d759cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmQuota interfaces
    */
    struct Vtbl extends IFsrmQuotaObject.Vtbl {
        get_QuotaUsed          : IntPtr
        get_QuotaPeakUsage     : IntPtr
        get_QuotaPeakUsageTime : IntPtr
        ResetPeakUsage         : IntPtr
        RefreshUsageProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmQuota.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The value is the total disk space usage for the directory and all its subdirectories (recursively). Files, 
     *     directories, streams, metadata, and other file system–specific means of persisting data are 
     *     used in determining the usage.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-get_quotaused
     */
    get_QuotaUsed() {
        used := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, used, "HRESULT")
        return used
    }

    /**
     * Retrieves the highest amount of disk space usage charged to this quota.
     * @remarks
     * The value represents the highest amount of disk space charged to this quota since the last call to 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquota-resetpeakusage">IFsrmQuota::ResetPeakUsage</a>. To reset this value, 
     *     call the <b>ResetPeakUsage</b> method.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-get_quotapeakusage
     */
    get_QuotaPeakUsage() {
        peakUsage := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, peakUsage, "HRESULT")
        return peakUsage
    }

    /**
     * Retrieves the date and time that the IFsrmQuota::QuotaPeakUsage property was set.
     * @remarks
     * The time stamp is set when the quota usage reaches a new, higher peak level, or the peak usage value is 
     *     reset.
     * 
     * To get the highest peak usage value, access the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquota-get_quotapeakusage">QuotaPeakUsage</a> property.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-get_quotapeakusagetime
     */
    get_QuotaPeakUsageTime() {
        result := ComCall(30, this, "double*", &peakUsageDateTime := 0, "HRESULT")
        return peakUsageDateTime
    }

    /**
     * Resets the peak usage of this quota to the current usage.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-resetpeakusage
     */
    ResetPeakUsage() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * Refreshes this object's quota usage information from the current information in FSRM.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquota-refreshusageproperties
     */
    RefreshUsageProperties() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmQuota.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_QuotaUsed := CallbackCreate(GetMethod(implObj, "get_QuotaUsed"), flags, 2)
        this.vtbl.get_QuotaPeakUsage := CallbackCreate(GetMethod(implObj, "get_QuotaPeakUsage"), flags, 2)
        this.vtbl.get_QuotaPeakUsageTime := CallbackCreate(GetMethod(implObj, "get_QuotaPeakUsageTime"), flags, 2)
        this.vtbl.ResetPeakUsage := CallbackCreate(GetMethod(implObj, "ResetPeakUsage"), flags, 1)
        this.vtbl.RefreshUsageProperties := CallbackCreate(GetMethod(implObj, "RefreshUsageProperties"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_QuotaUsed)
        CallbackFree(this.vtbl.get_QuotaPeakUsage)
        CallbackFree(this.vtbl.get_QuotaPeakUsageTime)
        CallbackFree(this.vtbl.ResetPeakUsage)
        CallbackFree(this.vtbl.RefreshUsageProperties)
    }
}
