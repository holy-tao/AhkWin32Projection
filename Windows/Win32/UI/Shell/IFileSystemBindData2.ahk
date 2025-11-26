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
     * Sets the unique file identifier for the current file.
     * @param {Integer} liFileID Type: <b>LARGE_INTEGER</b>
     * 
     * A unique file identifier for the current file.  <i>liFileID</i> is a value that is a concatenation of the values <i>nFileIndexHigh</i> and <i>nFileIndexlow</i>, noted in structure <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/ns-fileapi-by_handle_file_information">_by_handle_file_information</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifilesystembinddata2-setfileid
     */
    SetFileID(liFileID) {
        result := ComCall(5, this, "int64", liFileID, "HRESULT")
        return result
    }

    /**
     * Gets the unique file identifier for the current file.
     * @returns {Integer} Type: <b>LARGE_INTEGER*</b>
     * 
     * When this method returns successfully, receives a pointer to the unique file identifier for the current file. <i>pliFileID</i> is a pointer to a value that is a concatenation of the values <i>nFileIndexHigh</i> and <i>nFileIndexlow</i>, noted in structure <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/ns-fileapi-by_handle_file_information">_by_handle_file_information</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifilesystembinddata2-getfileid
     */
    GetFileID() {
        result := ComCall(6, this, "int64*", &pliFileID := 0, "HRESULT")
        return pliFileID
    }

    /**
     * Sets the class identifier (CLSID) of the object that implements IShellFolder, if the current item is a junction point.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * The CLSID for the object that implements <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> with a junction point as its current item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifilesystembinddata2-setjunctionclsid
     */
    SetJunctionCLSID(clsid) {
        result := ComCall(7, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * Gets the class identifier (CLSID) of the object that implements IShellFolder for the item, if the item is a junction point.
     * @returns {Guid} Type: <b>CLSID*</b>
     * 
     * When this method returns successfully, receives a pointer to the CLSID of the object that implements <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> for the current item, if the item is a junction point.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifilesystembinddata2-getjunctionclsid
     */
    GetJunctionCLSID() {
        pclsid := Guid()
        result := ComCall(8, this, "ptr", pclsid, "HRESULT")
        return pclsid
    }
}
