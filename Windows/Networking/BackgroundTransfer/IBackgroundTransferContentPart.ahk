#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates a [BackgroundTransferContentPart](backgroundtransfercontentpart.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransfercontentpartfactory
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundTransferContentPart extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTransferContentPart
     * @type {Guid}
     */
    static IID => Guid("{e8e15657-d7d1-4ed8-838e-674ac217ace6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHeader", "SetText", "SetFile"]

    /**
     * 
     * @param {HSTRING} headerName 
     * @param {HSTRING} headerValue 
     * @returns {HRESULT} 
     */
    SetHeader(headerName, headerValue) {
        if(headerName is String) {
            pin := HSTRING.Create(headerName)
            headerName := pin.Value
        }
        headerName := headerName is Win32Handle ? NumGet(headerName, "ptr") : headerName
        if(headerValue is String) {
            pin := HSTRING.Create(headerValue)
            headerValue := pin.Value
        }
        headerValue := headerValue is Win32Handle ? NumGet(headerValue, "ptr") : headerValue

        result := ComCall(6, this, "ptr", headerName, "ptr", headerValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetTextAlign function sets the text-alignment flags for the specified device context.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> functions use the text-alignment flags to position a string of text on a display or other device. The flags specify the relationship between a reference point and a rectangle that bounds the text. The reference point is either the current position or a point passed to a text output function.
     * 
     * The rectangle that bounds the text is formed by the character cells in the text string.
     * 
     * The best way to get left-aligned text is to use either
     * 
     * 
     * ```cpp
     * 
     * SetTextAlign (hdc, GetTextAlign(hdc) & (~TA_CENTER))
     * 
     * ```
     * 
     * 
     * or
     * 
     * 
     * ```cpp
     * 
     * SetTextAlign (hdc,TA_LEFT | <other flags>)
     * 
     * ```
     * 
     * 
     * You can also use <b>SetTextAlign</b> (hdc, TA_LEFT) for this purpose, but this loses any vertical or right-to-left settings.
     * 
     * <div class="alert"><b>Note</b>  You should not use <b>SetTextAlign</b> with TA_UPDATECP when you are using <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptstringout">ScriptStringOut</a>, because selected text is not rendered correctly. If you must use this flag, you can unset and reset it as necessary to avoid the problem.</div>
     * <div> </div>
     * @param {HSTRING} value 
     * @returns {HRESULT} If the function succeeds, the return value is the previous text-alignment setting.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-settextalign
     */
    SetText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
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
     * @param {IStorageFile} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fileapi/nf-fileapi-setfileapistoansi
     */
    SetFile(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
