#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Storage\FileSystem\WIN32_FIND_DATAW.ahk" { WIN32_FIND_DATAW }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that store file system information for optimizing calls to IShellFolder::ParseDisplayName.
 * @remarks
 * <b>IFileSystemBindData</b> stores the file system information in a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure. The object that implements <b>IFileSystemBindData</b> is then stored in a bind context that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a>.
 * 
 * Implement <b>IFileSystemBindData</b> when you want to optimize calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a> and you already have the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure's file information available to you.
 * 
 * To store the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> information prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a>, the client uses the following procedure.
 * 
 * <ol>
 * <li>Create an instance of the object that exposes the <b>IFileSystemBindData</b> interface.</li>
 * <li>Use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata-setfinddata">IFileSystemBindData::SetFindData</a> to store the data in the object.</li>
 * <li>Store the object in a bind context through the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectparam">IBindCtx::RegisterObjectParam</a> method. Set the <i>pszKey</i> parameter to the string <c>L"File System Bind Data"</c> and the <i>punk</i> parameter to the address of the <b>IFileSystemBindData</b> interface.</li>
 * </ol>
 * The bind context is then passed with the call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a>.
 * 
 * <div class="alert"><b>Note</b>  Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifilesystembinddata
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFileSystemBindData extends IUnknown {
    /**
     * The interface identifier for IFileSystemBindData
     * @type {Guid}
     */
    static IID := Guid("{01e18d10-4d8b-11d2-855d-006008059367}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileSystemBindData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFindData : IntPtr
        GetFindData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileSystemBindData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Stores file system information in a WIN32_FIND_DATA structure. This information is used by ParseDisplayName.
     * @remarks
     * After the client stores the file information, the instance of the object itself must be stored in a bind context by using the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectparam">IBindCtx::RegisterObjectParam</a> method with the <i>pszKey</i> parameter set to <c>L"File System Bind Data"</c>.
     * @param {Pointer<WIN32_FIND_DATAW>} pfd Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure that specifies the data you want to store.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata-setfinddata
     */
    SetFindData(pfd) {
        result := ComCall(3, this, WIN32_FIND_DATAW.Ptr, pfd, "HRESULT")
        return result
    }

    /**
     * Gets the file system information stored in the WIN32_FIND_DATA structure.
     * @remarks
     * This method provides bind context information to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a>. The client accesses the object by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getobjectparam">IBindCtx::GetObjectParam</a> with the <i>pszKey</i> parameter set to the string "File System Bind Data".
     * @returns {WIN32_FIND_DATAW} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure that receives the data.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata-getfinddata
     */
    GetFindData() {
        pfd := WIN32_FIND_DATAW()
        result := ComCall(4, this, WIN32_FIND_DATAW.Ptr, pfd, "HRESULT")
        return pfd
    }

    Query(iid) {
        if (IFileSystemBindData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFindData := CallbackCreate(GetMethod(implObj, "SetFindData"), flags, 2)
        this.vtbl.GetFindData := CallbackCreate(GetMethod(implObj, "GetFindData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFindData)
        CallbackFree(this.vtbl.GetFindData)
    }
}
