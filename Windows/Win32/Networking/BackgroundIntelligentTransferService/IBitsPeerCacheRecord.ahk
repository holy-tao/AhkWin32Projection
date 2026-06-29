#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\BG_FILE_RANGE.ahk" { BG_FILE_RANGE }

/**
 * Use IBitsPeerCacheRecord to get information about a file in the cache.
 * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nn-bits3_0-ibitspeercacherecord
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBitsPeerCacheRecord extends IUnknown {
    /**
     * The interface identifier for IBitsPeerCacheRecord
     * @type {Guid}
     */
    static IID := Guid("{659cdeaf-489e-11d9-a9cd-000d56965251}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBitsPeerCacheRecord interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetId                   : IntPtr
        GetOriginUrl            : IntPtr
        GetFileSize             : IntPtr
        GetFileModificationTime : IntPtr
        GetLastAccessTime       : IntPtr
        IsFileValidated         : IntPtr
        GetFileRanges           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBitsPeerCacheRecord.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the identifier that uniquely identifies the record in the cache.
     * @returns {Guid} Identifier that uniquely identifies the record in the cache.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getid
     */
    GetId() {
        pVal := Guid()
        result := ComCall(3, this, Guid.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the origin URL of the cached file.
     * @remarks
     * This URL may be different than the URL originally specified in the BITS job if <a href="https://docs.microsoft.com/windows/desktop/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setsecurityflags">IBackgroundCopyJobHttpOptions::SetSecurityFlags</a> is set to BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT or BG_HTTP_REDIRECT_POLICY_DISALLOW.
     * @returns {PWSTR} Null-terminated string that contains the origin URL of the cached file. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppOriginUrl</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getoriginurl
     */
    GetOriginUrl() {
        result := ComCall(4, this, PWSTR.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets the size of the file.
     * @returns {Integer} Size of the file, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets the date and time that the file was last modified on the server.
     * @returns {FILETIME} Date and time that the file was last modified on the server. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getfilemodificationtime
     */
    GetFileModificationTime() {
        pVal := FILETIME()
        result := ComCall(6, this, FILETIME.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the date and time that the file was last accessed.
     * @returns {FILETIME} Date and time that the file was last accessed. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getlastaccesstime
     */
    GetLastAccessTime() {
        pVal := FILETIME()
        result := ComCall(7, this, FILETIME.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Determines whether the file has been validated.
     * @remarks
     * The file is available to serve after you validate the file. To validate the file, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-setvalidationstate">IBackgroundCopyFile3::SetValidationState</a> method. The file is implicitly validated if the application calls <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> without calling <b>SetValidationState</b>. To remove the file from the cache after validation, see <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-deleteurl">IBitsPeerCacheAdministration::DeleteUrl</a> and <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-deleterecord">IBitsPeerCacheAdministration::DeleteRecord</a>.
     * @returns {HRESULT} The method returns the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File has been validated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File has not been validated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-isfilevalidated
     */
    IsFileValidated() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Gets the ranges of the file that are in the cache.
     * @remarks
     * The method always returns at least one range (for the complete file). Multiple ranges can be returned if the application called <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-addfilewithranges">IBackgroundCopyJob3::AddFileWithRanges</a> to download one or more ranges of a file.
     * @param {Pointer<Integer>} pRangeCount Number of elements in <i>ppRanges</i>.
     * @param {Pointer<Pointer<BG_FILE_RANGE>>} ppRanges Array of  <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/ns-bits2_0-bg_file_range">BG_FILE_RANGE</a> structures that specify the ranges of the file that are in the cache. When done, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppRanges</i>.
     * @returns {HRESULT} The method returns the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getfileranges
     */
    GetFileRanges(pRangeCount, ppRanges) {
        pRangeCountMarshal := pRangeCount is VarRef ? "uint*" : "ptr"
        ppRangesMarshal := ppRanges is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pRangeCountMarshal, pRangeCount, ppRangesMarshal, ppRanges, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBitsPeerCacheRecord.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 2)
        this.vtbl.GetOriginUrl := CallbackCreate(GetMethod(implObj, "GetOriginUrl"), flags, 2)
        this.vtbl.GetFileSize := CallbackCreate(GetMethod(implObj, "GetFileSize"), flags, 2)
        this.vtbl.GetFileModificationTime := CallbackCreate(GetMethod(implObj, "GetFileModificationTime"), flags, 2)
        this.vtbl.GetLastAccessTime := CallbackCreate(GetMethod(implObj, "GetLastAccessTime"), flags, 2)
        this.vtbl.IsFileValidated := CallbackCreate(GetMethod(implObj, "IsFileValidated"), flags, 1)
        this.vtbl.GetFileRanges := CallbackCreate(GetMethod(implObj, "GetFileRanges"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetOriginUrl)
        CallbackFree(this.vtbl.GetFileSize)
        CallbackFree(this.vtbl.GetFileModificationTime)
        CallbackFree(this.vtbl.GetLastAccessTime)
        CallbackFree(this.vtbl.IsFileValidated)
        CallbackFree(this.vtbl.GetFileRanges)
    }
}
