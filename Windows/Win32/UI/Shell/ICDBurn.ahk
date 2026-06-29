#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that determine whether a system has hardware for writing to CD, the drive letter of a CD writer device, and programmatically initiate a CD writing session.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-icdburn
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICDBurn extends IUnknown {
    /**
     * The interface identifier for ICDBurn
     * @type {Guid}
     */
    static IID := Guid("{3d73a659-e5d0-4d42-afc0-5121ba425c8d}")

    /**
     * The class identifier for CDBurn
     * @type {Guid}
     */
    static CLSID := Guid("{fbeb8a05-beee-4442-804e-409d6c4515e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICDBurn interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRecorderDriveLetter : IntPtr
        Burn                   : IntPtr
        HasRecordableDrive     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICDBurn.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the drive letter of a CD drive that has been marked as write-enabled.
     * @remarks
     * The drive whose letter designation is returned by this method is the drive that has the <b>Enable cd writing on this drive</b> option selected. This option is found on the drive's property sheet. Only one drive on a system can have this option selected.
     * 			
     * 
     * If a recordable CD drive is present but that option has been deselected, the method will return an error code.
     * @param {PWSTR} pszDrive Type: <b>LPWSTR</b>
     * 
     * A pointer to a string containing the drive letter, for example "F:\".
     * @param {Integer} cch Type: <b>UINT</b>
     * 
     * The size of the string, in characters, pointed to by pszDrive. This value will normally be 4. Values larger than 4 are allowed, but the extra characters will be ignored by this method. Values less than 4 will generate an E_INVALIDARG error.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icdburn-getrecorderdriveletter
     */
    GetRecorderDriveLetter(pszDrive, cch) {
        pszDrive := pszDrive is String ? StrPtr(pszDrive) : pszDrive

        result := ComCall(3, this, "ptr", pszDrive, "uint", cch, "HRESULT")
        return result
    }

    /**
     * Instructs data to be copied from the staging area to a writable CD.
     * @remarks
     * The <i>staging area</i> has a default location of %userprofile%\Local Settings\Application Data\Microsoft\CD Burning. Its actual path can be retrieved through <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetfolderpatha">SHGetFolderPath</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetspecialfolderpatha">SHGetSpecialFolderPath</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetfolderlocation">SHGetFolderLocation</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetspecialfolderlocation">SHGetSpecialFolderLocation</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetfolderpathandsubdira">SHGetFolderPathAndSubDir</a> by using the CSIDL_CDBURN_AREA value.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The handle of the parent window of the UI.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icdburn-burn
     */
    Burn(_hwnd) {
        result := ComCall(4, this, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * Scans the system for a CD drive with write-capability, returning TRUE if one is found.
     * @remarks
     * This search does not rely on the state of the <b>Enable cd writing on this drive</b> option found on the drive's property sheet. Instead, the determination is based on IMAPI.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a Boolean value containing <b>TRUE</b> if a suitable device is located, <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icdburn-hasrecordabledrive
     */
    HasRecordableDrive() {
        result := ComCall(5, this, BOOL.Ptr, &pfHasRecorder := 0, "HRESULT")
        return pfHasRecorder
    }

    Query(iid) {
        if (ICDBurn.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRecorderDriveLetter := CallbackCreate(GetMethod(implObj, "GetRecorderDriveLetter"), flags, 3)
        this.vtbl.Burn := CallbackCreate(GetMethod(implObj, "Burn"), flags, 2)
        this.vtbl.HasRecordableDrive := CallbackCreate(GetMethod(implObj, "HasRecordableDrive"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRecorderDriveLetter)
        CallbackFree(this.vtbl.Burn)
        CallbackFree(this.vtbl.HasRecordableDrive)
    }
}
