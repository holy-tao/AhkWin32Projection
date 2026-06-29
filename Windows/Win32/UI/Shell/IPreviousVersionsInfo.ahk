#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that checks for previous versions of server files or folders, stored for the purpose of reversion by the shadow copies technology provided with Windows Server 2003.
 * @remarks
 * The CLSID, IID, and definition for this interface are shown in the following example.
 * 
 *                 
 * 
 * 
 * ``` syntax
 * // {596AB062-B4D2-4215-9F74-E9109B0A8153}
 * const CLSID CLSID_PreviousVersions = {0x596AB062, 0xB4D2, 0x4215, 
 *                              {0x9F, 0x74, 0xE9, 0x10, 0x9B, 0x0A, 0x81, 0x53}};
 * 
 * // {76e54780-ad74-48e3-a695-3ba9a0aff10d}
 * const IID IID_IPreviousVersionsInfo = {0x76E54780, 0xAD74, 0x48E3, 
 *                              {0xA6, 0x95, 0x3B, 0xA9, 0xA0, 0xAF, 0xF1, 0x0D}};
 * 
 * MIDL_INTERFACE("76e54780-ad74-48e3-a695-3ba9a0aff10d")
 * IPreviousVersionsInfo : public IUnknown
 * {
 * public:
 *     virtual HRESULT STDMETHODCALLTYPE AreSnapshotsAvailable( 
 *         // [string][in]  LPCWSTR pszPath,
 *         // [in]  BOOL fOkToBeSlow,
 *         // [retval][out]  BOOL *pfAvailable) = 0;
 * };
 * ```
 * 
 * Note that the shadow copies technology does not store entire copies of older versions unless they are deleted; only the changed bits are stored.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ipreviousversionsinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPreviousVersionsInfo extends IUnknown {
    /**
     * The interface identifier for IPreviousVersionsInfo
     * @type {Guid}
     */
    static IID := Guid("{76e54780-ad74-48e3-a695-3ba9a0aff10d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPreviousVersionsInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AreSnapshotsAvailable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPreviousVersionsInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries for the availability of a Windows Server 2003 volume image recorded by the system at an earlier time.
     * @remarks
     * If <b>IPreviousVersionsInfo::AreSnapshotsAvailable</b> is called on a file or folder, the result does not indicate that rollback information is available for that specific file or folder, merely that a snapshot of the entire volume is available. This result is cached and subsequent calls inquiring about anything stored on that same volume access the cached results—with little performance overhead—instead of recontacting the server.
     * 
     * Once the server's response is cached in memory, subsequent calls do not contact the server even if <i>fOkToBeSlow</i> is <b>TRUE</b>. If <i>fOkToBeSlow</i> is <b>FALSE</b> and the server's response is not already cached from a previous call, the method returns E_PENDING. In that case, set <i>fOkToBeSlow</i> to <b>TRUE</b> and call <b>IPreviousVersionsInfo::AreSnapshotsAvailable</b> again to contact the server.
     * 
     * For better performance, a UI thread calling this method should always set <i>fOkToBeSlow</i> to <b>FALSE</b>. If the method returns E_PENDING, follow these steps.
     * 
     *                 
     * 
     * <ul>
     * <li>Create another instance of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-ipreviousversionsinfo">IPreviousVersionsInfo</a> on a background thread.</li>
     * <li>Call <b>IPreviousVersionsInfo::AreSnapshotsAvailable</b> with <i>fOkToBeSlow</i> set to <b>TRUE</b>.</li>
     * <li>Signal the original UI thread to call <b>IPreviousVersionsInfo::AreSnapshotsAvailable</b> again. The results are then pulled from the cache.</li>
     * </ul>
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string containing the fully qualified path to a file or folder on the volume in question.
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Only paths to files and folders stored on a Windows Server 2003 volume are currently supported.
     *           </div>
     * <div> </div>
     * @param {BOOL} fOkToBeSlow Type: <b>BOOL</b>
     * 
     * A boolean value specifying whether a server should be contacted to determine the availability of stored volume images. For more details, see the Remarks section.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a boolean variable containing the result. This value is valid only if the method call succeeds; otherwise, it is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ipreviousversionsinfo-aresnapshotsavailable
     */
    AreSnapshotsAvailable(pszPath, fOkToBeSlow) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(3, this, "ptr", pszPath, BOOL, fOkToBeSlow, BOOL.Ptr, &pfAvailable := 0, "HRESULT")
        return pfAvailable
    }

    Query(iid) {
        if (IPreviousVersionsInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AreSnapshotsAvailable := CallbackCreate(GetMethod(implObj, "AreSnapshotsAvailable"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AreSnapshotsAvailable)
    }
}
