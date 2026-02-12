#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferConfigure interface configures the location, number, and size of the backing files used by the various stream buffer objects.The StreamBufferConfig object exposes this interface.Before calling any of the Set methods on this interface, you must specify a registry key to hold the new settings. For more information, see IStreamBufferInitialize::SetHKEY.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferConfigure)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nn-sbe-istreambufferconfigure
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferConfigure extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferConfigure
     * @type {Guid}
     */
    static IID => Guid("{ce14dfae-4098-4af7-bbf7-d6511f835414}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDirectory", "GetDirectory", "SetBackingFileCount", "GetBackingFileCount", "SetBackingFileDuration", "GetBackingFileDuration"]

    /**
     * The SetDirectory method sets the directory where backing files are saved.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambufferinitialize-sethkey">IStreamBufferInitialize::SetHKEY</a> to specify a registry key where the information will be stored.
     * 
     * The specified directory is used to store backing files. If no directory is specified, the files are saved in a hidden system directory inside the Temp directory. This directory is not used to store files created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/recording-object">Recording</a> objects; those files are stored in a directory specified by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambuffersink-createrecorder">IStreamBufferSink::CreateRecorder</a> method.
     * 
     * Backing files are created as hidden sytem files.
     * @param {PWSTR} pszDirectoryName Pointer to a null-terminated string containing the fully qualified directory name. If the specified directory does not exist, it will be created.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/streambufferconfig-object">StreamBufferConfig</a> object was not initialized.
     * 
     * </td>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambufferconfigure-setdirectory
     */
    SetDirectory(pszDirectoryName) {
        pszDirectoryName := pszDirectoryName is String ? StrPtr(pszDirectoryName) : pszDirectoryName

        result := ComCall(3, this, "ptr", pszDirectoryName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetDirectory method retrieves the directory where backing files are saved.
     * @remarks
     * The caller must free the returned string by calling <b>CoTaskMemFree</b>.
     * @returns {PWSTR} Pointer to a variable that receives the fully qualified directory name.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambufferconfigure-getdirectory
     */
    GetDirectory() {
        result := ComCall(4, this, "ptr*", &ppszDirectoryName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszDirectoryName
    }

    /**
     * The SetBackingFileCount method sets the maximum and minimum number of backing files.
     * @remarks
     * If the reader lags behind the writer by more than <i>dwMin</i> files, the writer starts to send STREAMBUFFER_EC_CONTENT_BECOMING_STALE events. If the reader lags behind the writer by more than <i>dwMax</i> files, the writer begins to overwrite files and sends an STREAMBUFFER_EC_STALE_FILE_DELETED event.
     * 
     * Before calling this method, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambufferinitialize-sethkey">IStreamBufferInitialize::SetHKEY</a> to specify a registry key where the information will be stored.
     * @param {Integer} dwMin Specifies the backing file minimum. The valid range is from 4 to 100.
     * @param {Integer} dwMax Specifies the backing file maximum. The valid range is from 6 to 102, and the value must be at least 2 greater than <i>dwMin</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/streambufferconfig-object">StreamBufferConfig</a> object was not initialized.
     * 
     * </td>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambufferconfigure-setbackingfilecount
     */
    SetBackingFileCount(dwMin, dwMax) {
        result := ComCall(5, this, "uint", dwMin, "uint", dwMax, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetBackingFileCount method retrieves the maximum and minimum number of backing files.
     * @remarks
     * If the reader lags behind the writer by more than <i>pdwMin</i> files, the writer starts to send STREAMBUFFER_EC_CONTENT_BECOMING_STALE events. If the reader lags behind the writer by more than <i>pdwMax</i> files, the writer begins to overwrite files and sends an STREAMBUFFER_EC_STALE_FILE_DELETED event.
     * @param {Pointer<Integer>} pdwMin Pointer to a variable that receives the backing file minimum.
     * @param {Pointer<Integer>} pdwMax Pointer to a variable that receives the backing file maximum.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambufferconfigure-getbackingfilecount
     */
    GetBackingFileCount(pdwMin, pdwMax) {
        pdwMinMarshal := pdwMin is VarRef ? "uint*" : "ptr"
        pdwMaxMarshal := pdwMax is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwMinMarshal, pdwMin, pdwMaxMarshal, pdwMax, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetBackingFileDuration method sets the duration of all backing files.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambufferinitialize-sethkey">IStreamBufferInitialize::SetHKEY</a> to specify a registry key where the information will be stored.
     * @param {Integer} dwSeconds Specifies the file duration, in seconds. The minimum value is 15.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/streambufferconfig-object">StreamBufferConfig</a> object was not initialized.
     * 
     * </td>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambufferconfigure-setbackingfileduration
     */
    SetBackingFileDuration(dwSeconds) {
        result := ComCall(7, this, "uint", dwSeconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetBackingFileDuration method retrieves the duration of each backing file.
     * @returns {Integer} Pointer to a variable that receives the file duration, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambufferconfigure-getbackingfileduration
     */
    GetBackingFileDuration() {
        result := ComCall(8, this, "uint*", &pdwSeconds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwSeconds
    }
}
