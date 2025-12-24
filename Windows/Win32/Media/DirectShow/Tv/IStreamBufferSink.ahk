#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferSink interface is exposed by the Stream Buffer Sink filter. Use this interface to lock the filter before capture and to create new recordings.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSink)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffersink
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferSink
     * @type {Guid}
     */
    static IID => Guid("{afd1f242-7efd-45ee-ba4e-407a25c9a77a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockProfile", "CreateRecorder", "IsProfileLocked"]

    /**
     * The LockProfile method locks the Stream Buffer Sink filter's profile, thereby fixing the number of streams and their media types. This method can also specify the name and location of the stub file that points to the backing files.
     * @param {PWSTR} pszStreamBufferFilename Pointer to a null-terminated wide-character string that specifies the full path name of the stub file. If the specified file already exists, the method fails. If <i>pszFilename</i> is <b>NULL</b>, the stub file is created in the current directory with a default file name.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded. (Multiple calls with the same parameter.)
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_UNSUPPORTED_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed because there are no streams in the profile.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambuffersink-lockprofile
     */
    LockProfile(pszStreamBufferFilename) {
        pszStreamBufferFilename := pszStreamBufferFilename is String ? StrPtr(pszStreamBufferFilename) : pszStreamBufferFilename

        result := ComCall(3, this, "ptr", pszStreamBufferFilename, "HRESULT")
        return result
    }

    /**
     * This topic applies only to Windows XP Service Pack 1 or later.
     * @param {PWSTR} pszFilename Pointer to a null-terminated wide-character string that contains the file name for the recording.
     * @param {Integer} dwRecordType 
     * @returns {IUnknown} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/recording-object">Recording</a> object's <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambuffersink-createrecorder
     */
    CreateRecorder(pszFilename, dwRecordType) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename

        result := ComCall(4, this, "ptr", pszFilename, "uint", dwRecordType, "ptr*", &pRecordingIUnknown := 0, "HRESULT")
        return IUnknown(pRecordingIUnknown)
    }

    /**
     * This topic applies only to Windows XP Service Pack 1 or later.
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
     * The profile is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is not locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambuffersink-isprofilelocked
     */
    IsProfileLocked() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
