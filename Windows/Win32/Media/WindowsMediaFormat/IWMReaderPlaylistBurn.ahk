#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderPlaylistBurn interface verifies that the files in a playlist can be copied to CD, in the order in which they are specified.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderplaylistburn
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderPlaylistBurn extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderPlaylistBurn
     * @type {Guid}
     */
    static IID => Guid("{f28c0300-9baa-4477-a846-1744d9cbf533}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitPlaylistBurn", "GetInitResults", "Cancel", "EndPlaylistBurn"]

    /**
     * The InitPlaylistBurn method initiates the playlist burning process, by checking the files in the playlist to ensure that they are licensed for copying as part of a playlist.
     * @param {Integer} cFiles Number of files in the playlist. This is also the number of members in the array of file names referenced by <i>pwszFilenames</i>.
     * @param {Pointer<PWSTR>} ppwszFilenames Address of an array of <b>WCHAR</b> strings. Each string contains the name of a file in the playlist. You must maintain the file order exactly as it exists in the playlist.
     * @param {IWMStatusCallback} pCallback Address of the <b>IWMStatusCallback</b> implementation that will receive the WMT_INIT_PLAYLIST_BURN status message.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This is passed to the application in calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback. You can use this parameter to differentiate between messages from different objects when sharing a single status callback.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderplaylistburn-initplaylistburn
     */
    InitPlaylistBurn(cFiles, ppwszFilenames, pCallback, pvContext) {
        ppwszFilenamesMarshal := ppwszFilenames is VarRef ? "ptr*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", cFiles, ppwszFilenamesMarshal, ppwszFilenames, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The GetInitResults method retrieves the results of the playlist file check.
     * @param {Integer} cFiles Number of files in the playlist. This is also the number of members in the array referenced by <i>phrStati</i>. This value must be the same as the number of files specified in the original call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderplaylistburn-initplaylistburn">InitPlaylistBurn</a>.
     * @returns {HRESULT} Address of an array of <b>HRESULT</b> values. The members of this array correspond to the file names passed in the original call to <b>InitPlaylistBurn</b>. On output, each member is set to S_OK if the corresponding file is approved for copying as part of the playlist. If a file in the playlist is not licensed for copying, or if an error is encountered, the corresponding member of this array is set to the appropriate <b>HRESULT</b> return code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderplaylistburn-getinitresults
     */
    GetInitResults(cFiles) {
        result := ComCall(4, this, "uint", cFiles, "int*", &phrStati := 0, "HRESULT")
        return phrStati
    }

    /**
     * The Cancel method cancels an initiated playlist burn before initialization is finished.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderplaylistburn-cancel
     */
    Cancel() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The EndPlaylistBurn method completes the playlist burn process. This includes releasing resources and adjusting counts associated with rights in DRM licenses.
     * @param {HRESULT} hrBurnResult Result of the playlist burn. Set to S_OK if the files in the playlist were successfully copied to CD. Otherwise, set to an appropriate <b>HRESULT</b> error code.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderplaylistburn-endplaylistburn
     */
    EndPlaylistBurn(hrBurnResult) {
        result := ComCall(6, this, "int", hrBurnResult, "HRESULT")
        return result
    }
}
