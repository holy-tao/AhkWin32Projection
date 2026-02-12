#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedEnclosure extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedEnclosure
     * @type {Guid}
     */
    static IID => Guid("{bfbfb953-644f-4792-b69c-dfaca4cbf89a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Url", "Type", "Length", "AsyncDownload", "CancelAsyncDownload", "DownloadStatus", "LastDownloadError", "LocalPath", "Parent", "DownloadUrl", "DownloadMimeType", "RemoveFile", "SetFile"]

    /**
     * Determines a scheme for a specified URL string, and returns a string with an appropriate prefix. (Unicode)
     * @remarks
     * If the URL has a valid scheme, the string will not be modified. However, almost any combination of two or more characters followed by a colon will be parsed as a scheme. Valid characters include some common punctuation marks, such as ".". If your input string fits this description, <b>UrlApplyScheme</b> may treat it as valid and not apply a scheme. To force the function to apply a scheme to a URL, set the <b>URL_APPLY_FORCEAPPLY</b> and <b>URL_APPLY_DEFAULT</b> flags in <i>dwFlags</i>. This combination of flags forces the function to apply a scheme to the URL. Typically, the function will not be able to determine a valid scheme. The second flag guarantees that, if no valid scheme can be determined, the function will apply the default scheme to the URL.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The shlwapi.h header defines UrlApplyScheme as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/shlwapi/nf-shlwapi-urlapplyschemew
     */
    Url() {
        result := ComCall(3, this, "ptr*", &ppszUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszUrl
    }

    /**
     * Type Property (Table) (ADOX)
     * @remarks
     * This property is read-only.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/type-property-table-adox
     */
    Type() {
        result := ComCall(4, this, "ptr*", &ppszMimeType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszMimeType
    }

    /**
     * Length of Column Data
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/odbc/reference/appendixes/length-of-column-data
     */
    Length() {
        result := ComCall(5, this, "uint*", &puiLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiLength
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. | DownloadStatus Element (Msfeeds.h)
     * @remarks
     * Windows Media Player displays a message to users when a download is in progress. If the current active services defines a download status URL, the user can click the message text. When the user clicks the message, the Player navigates to the URL specified by the **DownloadStatus** element so the current active store can provide details about downloads in progress.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/downloadstatus-element
     */
    DownloadStatus() {
        result := ComCall(8, this, "int*", &pfds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfds
    }

    /**
     * 
     * @returns {Integer} 
     */
    LastDownloadError() {
        result := ComCall(9, this, "int*", &pfde := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfde
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    LocalPath() {
        result := ComCall(10, this, "ptr*", &ppszPath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszPath
    }

    /**
     * Parent Property (ADO MD)
     * @remarks
     * A member that is at the top level of a hierarchy (the root) has no parent. This property is supported only on **Member** objects belonging to a [Level](./level-object-ado-md.md) object. An error occurs when this property is referenced from **Member** objects belonging to a [Position](./position-object-ado-md.md) object.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/parent-property-ado-md
     */
    Parent(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(12, this, "ptr*", &ppszUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszUrl
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadMimeType() {
        result := ComCall(13, this, "ptr*", &ppszMimeType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszMimeType
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFile() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {PWSTR} pszDownloadUrl 
     * @param {PWSTR} pszDownloadFilePath 
     * @param {PWSTR} pszDownloadMimeType 
     * @param {PWSTR} pszEnclosureFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fileapi/nf-fileapi-setfileapistoansi
     */
    SetFile(pszDownloadUrl, pszDownloadFilePath, pszDownloadMimeType, pszEnclosureFilename) {
        pszDownloadUrl := pszDownloadUrl is String ? StrPtr(pszDownloadUrl) : pszDownloadUrl
        pszDownloadFilePath := pszDownloadFilePath is String ? StrPtr(pszDownloadFilePath) : pszDownloadFilePath
        pszDownloadMimeType := pszDownloadMimeType is String ? StrPtr(pszDownloadMimeType) : pszDownloadMimeType
        pszEnclosureFilename := pszEnclosureFilename is String ? StrPtr(pszEnclosureFilename) : pszEnclosureFilename

        result := ComCall(15, this, "ptr", pszDownloadUrl, "ptr", pszDownloadFilePath, "ptr", pszDownloadMimeType, "ptr", pszEnclosureFilename, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
