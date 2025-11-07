#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFileSystemBindData.ahk

/**
 * Extends IFileSystemBindData, which stores file system information for optimizing calls to IShellFolder::ParseDisplayName. This interface adds the ability set or get file ID or junction class identifier (CLSID).
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifilesystembinddata">IFileSystemBindData</a> interface, from which it inherits.
 * 
 * To pass the information expressed in this interface to a data source <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a>, an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> object is created (use <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a>) and populated with an object that implements <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifilesystembinddata">IFileSystemBindData</a> by calling the following:
 *   
 * 
 * 
 * ```cpp
 * IBindCtx::RegisterObjectParam(STR_FILE_SYS_BIND_DATA, pfsbd)
 * 
 * ```
 * 
 * 
 *  Where <i>pfsbd</i> is the object that implements <b>IFileSystemBindData</b>.
 * 
 * Implementers of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a> first make the following call.
 *               
 * 
 * 
 * ```cpp
 * IUnknown *punk;
 * pbc->GetObjectParam(STR_FILE_SYS_BIND_DATA, &punk);
 * 
 * ```
 * 
 * 
 *  Next the implementer calls one of the <b>Get</b> methods listed above to retrieve the parameters.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifilesystembinddata2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileSystemBindData2 extends IFileSystemBindData{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSystemBindData2
     * @type {Guid}
     */
    static IID => Guid("{3acf075f-71db-4afa-81f0-3fc4fdf2a5b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFileID", "GetFileID", "SetJunctionCLSID", "GetJunctionCLSID"]

    /**
     * 
     * @param {Integer} liFileID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata2-setfileid
     */
    SetFileID(liFileID) {
        result := ComCall(5, this, "int64", liFileID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata2-getfileid
     */
    GetFileID() {
        result := ComCall(6, this, "int64*", &pliFileID := 0, "HRESULT")
        return pliFileID
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata2-setjunctionclsid
     */
    SetJunctionCLSID(clsid) {
        result := ComCall(7, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesystembinddata2-getjunctionclsid
     */
    GetJunctionCLSID() {
        pclsid := Guid()
        result := ComCall(8, this, "ptr", pclsid, "HRESULT")
        return pclsid
    }
}
