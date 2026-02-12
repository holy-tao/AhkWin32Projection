#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferSink interface is exposed by the Stream Buffer Sink filter. Use this interface to lock the filter before capture and to create new recordings.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSink)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nn-sbe-istreambuffersink
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
     * @remarks
     * The profile describes the number of input streams, their media types, and the location of the stub file that points to the temporary backing files. The profile must be locked before the Stream Buffer Source filter can read data from the backing files. Applications can lock the profile explicitly by calling the <b>LockProfile</b> method, or implicitly by running the filter graph that contains the Stream Buffer Sink filter.
     * 
     * After the profile is locked, the Stream Buffer Sink filter does not accept any new pin connections. Pins already connected can be reconnected, but only with the same media type. The profile is unlocked when the graph stops.
     * 
     * The stub file is automatically deleted when the last process closes the file handle. This occurs when the capture graph stops and no render graphs are reading the file.
     * 
     * After the first successful call to this method, further calls with the same value of <i>pszFileName</i> return S_FALSE. Further calls with a different value for <i>pszFileName</i> fail and return E_UNEXPECTED.
     * 
     * The name of the stub file can be given to the Stream Buffer Source filter through that filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifilesourcefilter-load">IFileSourceFilter::Load</a> method.
     * 
     * <h3><a id="Windows_Vista_or_later"></a><a id="windows_vista_or_later"></a><a id="WINDOWS_VISTA_OR_LATER"></a>Windows Vista or later</h3>
     * This method requires administrator privileges, unless you first call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambufferconfigure3-setnamespace">IStreamBufferConfigure3::SetNamespace</a> with the value <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambuffersink-lockprofile
     */
    LockProfile(pszStreamBufferFilename) {
        pszStreamBufferFilename := pszStreamBufferFilename is String ? StrPtr(pszStreamBufferFilename) : pszStreamBufferFilename

        result := ComCall(3, this, "ptr", pszStreamBufferFilename, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This topic applies only to Windows XP Service Pack 1 or later.
     * @remarks
     * The Stream Buffer Sink filter's profile must be locked, either explicitly or implicitly, before you call this method. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambuffersink-lockprofile">IStreamBufferSink::LockProfile</a>.
     * 
     * The returned <b>IUnknown</b> interface has an outstanding reference count. The caller must release the interface.
     * @param {PWSTR} pszFilename Pointer to a null-terminated wide-character string that contains the file name for the recording.
     * @param {Integer} dwRecordType 
     * @returns {IUnknown} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/recording-object">Recording</a> object's <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambuffersink-createrecorder
     */
    CreateRecorder(pszFilename, dwRecordType) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename

        result := ComCall(4, this, "ptr", pszFilename, "uint", dwRecordType, "ptr*", &pRecordingIUnknown := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pRecordingIUnknown)
    }

    /**
     * This topic applies only to Windows XP Service Pack 1 or later.
     * @remarks
     * When the filter's profile is locked, the number of streams and their media types are fixed. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambuffersink-lockprofile">IStreamBufferSink::LockProfile</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambuffersink-isprofilelocked
     */
    IsProfileLocked() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
