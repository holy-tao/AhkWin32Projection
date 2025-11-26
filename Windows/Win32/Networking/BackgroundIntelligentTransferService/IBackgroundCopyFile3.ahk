#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyFile2.ahk

/**
 * Use this interface to retrieve the name of the temporary file that contains the downloaded content and to validate the file so that peers can request its content.
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibackgroundcopyfile3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile3 extends IBackgroundCopyFile2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyFile3
     * @type {Guid}
     */
    static IID => Guid("{659cdeaa-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTemporaryName", "SetValidationState", "GetValidationState", "IsDownloadedFromPeer"]

    /**
     * Gets the full path of the temporary file that contains the content of the download.
     * @returns {PWSTR} Null-terminated string that contains the full path of the temporary file. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppFileName</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyfile3-gettemporaryname
     */
    GetTemporaryName() {
        result := ComCall(8, this, "ptr*", &pFilename := 0, "HRESULT")
        return pFilename
    }

    /**
     * Sets the validation state of this file.
     * @param {BOOL} state Set to <b>TRUE</b> if the file content is valid, otherwise, <b>FALSE</b>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot validate the file until the download is complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_RECORD_DELETED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cached record associated with this file has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyfile3-setvalidationstate
     */
    SetValidationState(state) {
        result := ComCall(9, this, "int", state, "HRESULT")
        return result
    }

    /**
     * Gets the current validation state of this file.
     * @returns {BOOL} <b>TRUE</b> if the contents of the file is valid, otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyfile3-getvalidationstate
     */
    GetValidationState() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Gets a value that determines if any part of the file was downloaded from a peer.
     * @returns {BOOL} Is <b>TRUE</b> if any part of the file was downloaded from a peer; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyfile3-isdownloadedfrompeer
     */
    IsDownloadedFromPeer() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
