#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IStream.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IAssemblyCacheItem interface can be used to install side-by-side assemblies into the side-by-side store using a stream-based installation.
 * @see https://docs.microsoft.com/windows/win32/api//winsxs/nn-winsxs-iassemblycacheitem
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IAssemblyCacheItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAssemblyCacheItem
     * @type {Guid}
     */
    static IID => Guid("{9e3aaeb4-d1cd-11d2-bab9-00c04f8eceae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStream", "Commit", "AbortItem"]

    /**
     * The CreateStream method copies the source of a manifest or module into a stream.
     * @param {Integer} dwFlags Reserved.
     * @param {PWSTR} pszStreamName Pointer to a string value containing the name of the manifest. This becomes the name of the stream.
     * @param {Integer} dwFormat This parameter specifies whether a module or manifest is being copied to a stream.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STREAM_FORMAT_COMPLIB_MODULE"></a><a id="stream_format_complib_module"></a><dl>
     * <dt><b>STREAM_FORMAT_COMPLIB_MODULE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copy  the source  of a module for a non-Windows assembly to a stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STREAM_FORMAT_COMPLIB_MANIFEST"></a><a id="stream_format_complib_manifest"></a><dl>
     * <dt><b>STREAM_FORMAT_COMPLIB_MANIFEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copy  the source  of a manifest for a non-Windows assembly to a stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STREAM_FORMAT_WIN32_MODULE"></a><a id="stream_format_win32_module"></a><dl>
     * <dt><b>STREAM_FORMAT_WIN32_MODULE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copy  the source  of a module for a Windows assembly to a stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STREAM_FORMAT_WIN32_MANIFEST"></a><a id="stream_format_win32_manifest"></a><dl>
     * <dt><b>STREAM_FORMAT_WIN32_MANIFEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copy  the source  of a manifest for a Windows assembly to a stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFormatFlags Reserved.
     * @param {Pointer<Integer>} puliMaxSize Reserved.
     * @returns {IStream} Pointer to the location that contains the pointer to the IStream interface that receives the information.
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblycacheitem-createstream
     */
    CreateStream(dwFlags, pszStreamName, dwFormat, dwFormatFlags, puliMaxSize) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        puliMaxSizeMarshal := puliMaxSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwFlags, "ptr", pszStreamName, "uint", dwFormat, "uint", dwFormatFlags, "ptr*", &ppIStream := 0, puliMaxSizeMarshal, puliMaxSize, "HRESULT")
        return IStream(ppIStream)
    }

    /**
     * The Commit method copies information into the side-by-side store. When this method returns, the assembly is visible in the side-by-side store.
     * @param {Integer} dwFlags This parameter specifies how existing information in the side-by-side store is to be replaced by information for the assembly being installed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IASSEMBLYCACHEITEM_COMMIT_FLAG_REFRESH"></a><a id="iassemblycacheitem_commit_flag_refresh"></a><dl>
     * <dt><b>IASSEMBLYCACHEITEM_COMMIT_FLAG_REFRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replace existing information in the side-by-side store with the information in the assembly being installed if the version in the assembly is greater than or equal to the version of the existing information. This is the default option.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IASSEMBLYCACHEITEM_COMMIT_FLAG_FORCE_REFRESH"></a><a id="iassemblycacheitem_commit_flag_force_refresh"></a><dl>
     * <dt><b>IASSEMBLYCACHEITEM_COMMIT_FLAG_FORCE_REFRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replace existing information in the side-by-side store with the information for the assembly being installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pulDisposition <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_INSTALLED"></a><a id="iassemblycacheitem_commit_disposition_installed"></a><dl>
     * <dt><b>IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The assembly is installed for the first time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_REFRESHED"></a><a id="iassemblycacheitem_commit_disposition_refreshed"></a><dl>
     * <dt><b>IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_REFRESHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The assembly replaces an existing assembly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_ALREADY_INSTALLED"></a><a id="iassemblycacheitem_commit_disposition_already_installed"></a><dl>
     * <dt><b>IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_ALREADY_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The assembly is already installed in the side-by-side assembly store.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblycacheitem-commit
     */
    Commit(dwFlags, pulDisposition) {
        pulDispositionMarshal := pulDisposition is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwFlags, pulDispositionMarshal, pulDisposition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbortItem() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
