#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Storage\FileSystem\WIN32_FIND_DATAW.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that store file system information for optimizing calls to IShellFolder::ParseDisplayName.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifilesystembinddata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileSystemBindData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSystemBindData
     * @type {Guid}
     */
    static IID => Guid("{01e18d10-4d8b-11d2-855d-006008059367}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFindData", "GetFindData"]

    /**
     * 
     * @param {Pointer<WIN32_FIND_DATAW>} pfd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata-setfinddata
     */
    SetFindData(pfd) {
        result := ComCall(3, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {WIN32_FIND_DATAW} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata-getfinddata
     */
    GetFindData() {
        pfd := WIN32_FIND_DATAW()
        result := ComCall(4, this, "ptr", pfd, "HRESULT")
        return pfd
    }
}
