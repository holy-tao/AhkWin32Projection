#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedEnclosure extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedEnclosure
     * @type {Guid}
     */
    static IID => Guid("{361c26f7-90a4-4e67-ae09-3a36a546436a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Url", "get_Type", "get_Length", "AsyncDownload", "CancelAsyncDownload", "get_DownloadStatus", "get_LastDownloadError", "get_LocalPath", "get_Parent", "get_DownloadUrl", "get_DownloadMimeType", "RemoveFile", "SetFile"]

    /**
     * @type {BSTR} 
     */
    Url {
        get => this.get_Url()
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * @type {Integer} 
     */
    DownloadStatus {
        get => this.get_DownloadStatus()
    }

    /**
     * @type {Integer} 
     */
    LastDownloadError {
        get => this.get_LastDownloadError()
    }

    /**
     * @type {BSTR} 
     */
    LocalPath {
        get => this.get_LocalPath()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {BSTR} 
     */
    DownloadUrl {
        get => this.get_DownloadUrl()
    }

    /**
     * @type {BSTR} 
     */
    DownloadMimeType {
        get => this.get_DownloadMimeType()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Url() {
        enclosureUrl := BSTR()
        result := ComCall(7, this, "ptr", enclosureUrl, "HRESULT")
        return enclosureUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        mimeType := BSTR()
        result := ComCall(8, this, "ptr", mimeType, "HRESULT")
        return mimeType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(9, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadStatus() {
        result := ComCall(12, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastDownloadError() {
        result := ComCall(13, this, "int*", &error := 0, "HRESULT")
        return error
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalPath() {
        localPath := BSTR()
        result := ComCall(14, this, "ptr", localPath, "HRESULT")
        return localPath
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(15, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadUrl() {
        enclosureUrl := BSTR()
        result := ComCall(16, this, "ptr", enclosureUrl, "HRESULT")
        return enclosureUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadMimeType() {
        mimeType := BSTR()
        result := ComCall(17, this, "ptr", mimeType, "HRESULT")
        return mimeType
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFile() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Causes the file I/O functions to use the ANSI character set code page for the current process.
     * @remarks
     * The file I/O functions whose code page is set by <b>SetFileApisToANSI</b> are those 
     *     functions exported by KERNEL32.DLL that accept or return a file name. 
     *     <b>SetFileApisToANSI</b> sets the code page per process, rather than per thread or per 
     *     computer.
     * 
     * The <b>SetFileApisToANSI</b> function complements the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileapistooem">SetFileApisToOEM</a> function, which causes the same set 
     *     of file I/O functions to use the OEM character set code page.
     * 
     * The 8-bit console functions use the OEM code page by default. All other functions use the ANSI code page by 
     *     default. This means that strings returned by the console functions may not be processed correctly by other 
     *     functions, and vice versa. For example, if the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFileA</a> function returns a string that contains 
     *     certain extended ANSI characters, and the 8-bit console functions are set to use the OEM code page, then the 
     *     <a href="https://docs.microsoft.com/windows/console/writeconsole">WriteConsoleA</a> function does not display the string 
     *     properly.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-arefileapisansi">AreFileApisANSI</a> function to determine 
     *     which code page the set of file I/O functions is currently using. Use the 
     *     <a href="https://docs.microsoft.com/windows/console/setconsolecp">SetConsoleCP</a> and 
     *     <a href="https://docs.microsoft.com/windows/console/setconsoleoutputcp">SetConsoleOutputCP</a> functions to set the code page 
     *     for the 8-bit console functions.
     * 
     * To solve the problem of code page incompatibility, it is best to use Unicode for console applications. Console 
     *     applications that use Unicode are much more versatile than those that use 8-bit console functions. Barring that 
     *     solution, a console application can call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileapistooem">SetFileApisToOEM</a> function to cause the 
     *     set of file I/O functions to use OEM character set strings rather than ANSI character set strings. Use the 
     *     <b>SetFileApisToANSI</b> function to set those functions back to the ANSI code 
     *     page.
     * 
     * When dealing with command lines, a console application should obtain the command line in Unicode form and then 
     *     convert it to OEM form using the relevant character-to-OEM functions. Note also that the array in the 
     *     <i>argv</i> parameter of the command-line <b>main</b> function 
     *     contains ANSI character set strings in this case.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BSTR} downloadUrl 
     * @param {BSTR} downloadFilePath 
     * @param {BSTR} downloadMimeType 
     * @param {BSTR} enclosureFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfileapistoansi
     */
    SetFile(downloadUrl, downloadFilePath, downloadMimeType, enclosureFilename) {
        downloadUrl := downloadUrl is String ? BSTR.Alloc(downloadUrl).Value : downloadUrl
        downloadFilePath := downloadFilePath is String ? BSTR.Alloc(downloadFilePath).Value : downloadFilePath
        downloadMimeType := downloadMimeType is String ? BSTR.Alloc(downloadMimeType).Value : downloadMimeType
        enclosureFilename := enclosureFilename is String ? BSTR.Alloc(enclosureFilename).Value : enclosureFilename

        result := ComCall(19, this, "ptr", downloadUrl, "ptr", downloadFilePath, "ptr", downloadMimeType, "ptr", enclosureFilename, "HRESULT")
        return result
    }
}
