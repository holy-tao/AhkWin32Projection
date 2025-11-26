#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMsmErrors.ahk
#Include .\IMsmDependencies.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmMerge interface and the IMsmMerge2 interface provide interfaces to the Merge object.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmmerge
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmMerge extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMsmMerge
     * @type {Guid}
     */
    static IID => Guid("{0adda82e-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The class identifier for MsmMerge
     * @type {Guid}
     */
    static CLSID => Guid("{0adda830-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenDatabase", "OpenModule", "CloseDatabase", "CloseModule", "OpenLog", "CloseLog", "Log", "get_Errors", "get_Dependencies", "Merge", "Connect", "ExtractCAB", "ExtractFiles"]

    /**
     * @type {IMsmErrors} 
     */
    Errors {
        get => this.get_Errors()
    }

    /**
     * @type {IMsmDependencies} 
     */
    Dependencies {
        get => this.get_Dependencies()
    }

    /**
     * The OpenDatabase method opens a Windows Installer installation database, located at a specified path, that is to be merged with a module. For more information, see the OpenDatabase method of the Merge object.
     * @param {BSTR} Path Path to the database being opened.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error opening the database.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-opendatabase
     */
    OpenDatabase(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(7, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * The OpenModule method opens a Windows Installer merge module in read-only mode. A module must be opened before it can be merged with an installation database. For more information, see the OpenModule method of the Merge object.
     * @param {BSTR} Path Fully qualified file name that points to a merge module. A <b>LPCWSTR</b> can be used in place of a <b>BSTR</b>.
     * @param {Integer} Language A language identifier (<b>LANGID</b>).
     * @returns {HRESULT} The <b>OpenModule</b> function returns the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file specified is an Windows Installer database, but is not a merge module (missing 
     * <a href="/windows/desktop/Msi/modulesignature-table">ModuleSignature table</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSTALL_LANGUAGE_UNSUPPORTED as HRESULT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The language is not supported by the module.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSTALL_TRANSFORM_FAILURE as HRESULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The language is supported by the module, but there was an error applying the transform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FAILED as HRESULT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file could not be opened as an Windows Installer database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TOO_MANY_OPEN_FILES as HRESULT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is already a module open. Closes the current module first.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-openmodule
     */
    OpenModule(Path, Language) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(8, this, "ptr", Path, "short", Language, "HRESULT")
        return result
    }

    /**
     * The CloseDatabase method closes the currently open Windows Installer database. For more information, see the CloseDatabase method of the Merge object.
     * @param {VARIANT_BOOL} Commit <b>TRUE</b> if changes should be saved, <b>FALSE</b> otherwise.
     * @returns {HRESULT} The <b>CloseDatabase</b> function returns the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error closing the database. The state of the 
     * <a href="/windows/desktop/api/mergemod/nn-mergemod-imsmmerge">IMsmMerge</a> or 
     * <a href="/windows/desktop/api/mergemod/nn-mergemod-imsmmerge2">IMsmMerge2</a> interface is now in an undefined state.
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
     * No database was open.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_CANTSAVE as HRESULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to save database. This error is not generated if <i>bCommit</i> is <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-closedatabase
     */
    CloseDatabase(Commit) {
        result := ComCall(9, this, "short", Commit, "HRESULT")
        return result
    }

    /**
     * The CloseModule method closes the currently open Windows Installer merge module. For more information, see the CloseModule method of the Merge object.
     * @returns {HRESULT} The <b>CloseModule</b> function returns the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error closing the module. The state of the 
     * <a href="/windows/desktop/api/mergemod/nn-mergemod-imsmmerge">IMsmMerge</a> or 
     * <a href="/windows/desktop/api/mergemod/nn-mergemod-imsmmerge2">IMsmMerge2</a> interface is now undefined.
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
     * No module was open.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-closemodule
     */
    CloseModule() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The OpenLog method opens a log file that receives progress and error messages.
     * @param {BSTR} Path Fully qualified file name pointing to a file to open or create. A <b>LPCWSTR</b> may be used in place of a <b>BSTR</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TOO_MANY_OPEN_FILES as HRESULT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is already a log file open.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FAILED as HRESULT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file could not be opened or created.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-openlog
     */
    OpenLog(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(11, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * The CloseLog function method closes the current log. For more information, see the CloseLog method of the Merge object.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error closing the log file.
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
     * No log file was open.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-closelog
     */
    CloseLog() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The Log method writes a text string to the currently open log file. For more information, see the Log method of the Merge object.
     * @param {BSTR} Message The text string to display. A <b>LPCWSTR</b> may be used instead of a <b>BSTR</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error writing to the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument is invalid.
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
     * No log file is open.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-log
     */
    Log(Message) {
        Message := Message is String ? BSTR.Alloc(Message).Value : Message

        result := ComCall(13, this, "ptr", Message, "HRESULT")
        return result
    }

    /**
     * The get_Errors method retrieves the Errors property of the Merge object. This retrieves the current collection of errors.
     * @returns {IMsmErrors} Pointer to a memory location containing another pointer to an <b>IMsmErrors</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-get_errors
     */
    get_Errors() {
        result := ComCall(14, this, "ptr*", &Errors := 0, "HRESULT")
        return IMsmErrors(Errors)
    }

    /**
     * The get_Dependencies method retrieves the Dependencies property of the Merge object.
     * @returns {IMsmDependencies} Pointer to a memory location to be filled with a pointer to a collection of unsatisfied dependencies for the current database. If there is an error, the memory location pointed to by <i>Dependencies</i> is set to null.
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-get_dependencies
     */
    get_Dependencies() {
        result := ComCall(15, this, "ptr*", &Dependencies := 0, "HRESULT")
        return IMsmDependencies(Dependencies)
    }

    /**
     * The Merge method executes a merge of the current database and current module.
     * @param {BSTR} Feature The name of a feature in the database. A <b>LPCWSTR</b> can be used in place of a <b>BSTR</b>.
     * @param {BSTR} RedirectDir The key of an entry in the Directory table of the database. A <b>LPCWSTR</b> can be used in place of a <b>BSTR</b>. This parameter can be null or an empty string.
     * @returns {HRESULT} The <b>Merge</b> function returns the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The merge failed catastrophically. This indicates an operational error, and is not the normal error return for a failed merge.
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
     * The function succeeded, but there were errors and the merge itself may not be valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system ran out of memory and could not complete the operation.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-merge
     */
    Merge(Feature, RedirectDir) {
        Feature := Feature is String ? BSTR.Alloc(Feature).Value : Feature
        RedirectDir := RedirectDir is String ? BSTR.Alloc(RedirectDir).Value : RedirectDir

        result := ComCall(16, this, "ptr", Feature, "ptr", RedirectDir, "HRESULT")
        return result
    }

    /**
     * The Connect method connects a module that has been, or will be, merged into the database to an additional feature. For more information, see the Connect method of the Merge object.
     * @param {BSTR} Feature The name of a feature in the database. A <b>LPCWSTR</b> may be used in place of a <b>BSTR</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
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
     * The connect failed.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-connect
     */
    Connect(Feature) {
        Feature := Feature is String ? BSTR.Alloc(Feature).Value : Feature

        result := ComCall(17, this, "ptr", Feature, "HRESULT")
        return result
    }

    /**
     * The ExtractCAB method extracts the embedded .cab file from a module and saves it as the specified file.
     * @param {BSTR} FileName The fully qualified destination file. A <b>LPCWSTR</b> may be used in place of a <b>BSTR</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FAILED as HRESULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not create the output file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT as HRESULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not write data to the output file.
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
     * Unable to access embedded .cab file.
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
     * No embedded .cab file was found.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-extractcab
     */
    ExtractCAB(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(18, this, "ptr", FileName, "HRESULT")
        return result
    }

    /**
     * The ExtractFiles method extracts the embedded .cab file from a module and then writes those files to the destination directory. For more information, see the ExtractFiles method of the Merge object.
     * @param {BSTR} Path The fully qualified destination directory. A <b>LPCWSTR</b> may be used in place of a <b>BSTR</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_MAKE as HRESULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not create the output path.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FAILED as HRESULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not create the output file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT as HRESULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not write data to the output file.
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
     * Unable to access embedded .cab file, or create temporary file.
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
     * No embedded .cab file was found.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmmerge-extractfiles
     */
    ExtractFiles(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(19, this, "ptr", Path, "HRESULT")
        return result
    }
}
