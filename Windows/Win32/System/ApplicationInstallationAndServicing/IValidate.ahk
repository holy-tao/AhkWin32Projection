#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IValidate interface enables authoring tools to validate a Windows Installer package against a set of Internal Consistency Evaluators.
 * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nn-evalcom2-ivalidate
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IValidate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IValidate
     * @type {Guid}
     */
    static IID => Guid("{e482e5c6-e31e-4143-a2e6-dbc3d8e4b8d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenDatabase", "OpenCUB", "CloseDatabase", "CloseCUB", "SetDisplay", "SetStatus", "Validate"]

    /**
     * The OpenDatabase method opens a Windows Installer installation package or merge module for validation.
     * @param {PWSTR} szDatabase The fully qualified path to the installation package or merge module to be opened.  The <i>szDatabase</i> parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} <table>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>szDatabase</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method can also return one or more of the errors returned by the <a href="/windows/desktop/api/msiquery/nf-msiquery-msiopendatabasea">MsiOpenDatabase</a> function. The error is converted to <b>HRESULTS</b> using the <b>HRESULT_FROM_WIN32</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nf-evalcom2-ivalidate-opendatabase
     */
    OpenDatabase(szDatabase) {
        szDatabase := szDatabase is String ? StrPtr(szDatabase) : szDatabase

        result := ComCall(3, this, "ptr", szDatabase, "HRESULT")
        return result
    }

    /**
     * The OpenCUB method opens an Internal Consistency Evaluator (ICE) file that is to be used for validation.
     * @param {PWSTR} szCUBFile The fully qualified path to the <a href="https://docs.microsoft.com/windows/desktop/Msi/internal-consistency-evaluators-ices">Internal Consistency Evaluator (ICE)</a> file to be used for validation.
     * @returns {HRESULT} This method can return one of these values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>szDatabase</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate memory.
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
     * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nf-evalcom2-ivalidate-opencub
     */
    OpenCUB(szCUBFile) {
        szCUBFile := szCUBFile is String ? StrPtr(szCUBFile) : szCUBFile

        result := ComCall(4, this, "ptr", szCUBFile, "HRESULT")
        return result
    }

    /**
     * The CloseDatabase method closes the currently open Windows Installer package or merge module. Windows Installer packages or merge modules can be opened by using the OpenDatabase method.
     * @returns {HRESULT} <table>
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
     *  
     * 
     * This method can also return one or more of the errors returned by the <a href="/windows/desktop/api/msi/nf-msi-msiclosehandle">MsiCloseHandle</a> function. The error is converted to <b>HRESULTS</b> using the <b>HRESULT_FROM_WIN32</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nf-evalcom2-ivalidate-closedatabase
     */
    CloseDatabase() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The CloseCUB method closes an open Internal Consistency Evaluator (ICE) .cub file. Internal Consistency Evaluator (ICE) .cub files can be opened using the OpenCUB method.
     * @returns {HRESULT} This method can return one of these values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nf-evalcom2-ivalidate-closecub
     */
    CloseCUB() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The SetDisplay method enables an authoring tool to obtain ICE status messages through a callback function.
     * @param {Pointer<LPDISPLAYVAL>} pDisplayFunction Specifies a callback function that conforms to the <a href="https://docs.microsoft.com/windows/desktop/api/evalcom2/nc-evalcom2-lpdisplayval">LPDISPLAYVAL</a> specification.
     * @param {Pointer<Void>} pContext A pointer to an application context that is passed to the callback function. This parameter can be used for error checking.  The <i>pContext</i> parameter can be <b>NULL</b>.
     * @returns {HRESULT} This method can return one of these values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDisplayFunction</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nf-evalcom2-ivalidate-setdisplay
     */
    SetDisplay(pDisplayFunction, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", pDisplayFunction, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * The SetStatus method enables an authoring tool to receive information about the progress of validation through a registered callback function.
     * @param {Pointer<LPEVALCOMCALLBACK>} pStatusFunction Specifies a callback function that conforms to the <a href="https://docs.microsoft.com/windows/desktop/api/evalcom2/nc-evalcom2-lpevalcomcallback">LPEVALCOMCALLBACK</a> specification.  The <i>pStatusFunction</i> can be <b>NULL</b>.
     * @param {Pointer<Void>} pContext A pointer to an application context that is passed to the callback function. This parameter can be used for error checking.  The <i>pContext</i> can be <b>NULL</b>.
     * @returns {HRESULT} This method can return one of these values.
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
     * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nf-evalcom2-ivalidate-setstatus
     */
    SetStatus(pStatusFunction, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", pStatusFunction, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * The Validate method performs validation of the installation package or merge module using the specified internal consistency evaluator file.
     * @param {PWSTR} wzICEs Optional parameter that specifies which  <a href="https://docs.microsoft.com/windows/desktop/Msi/internal-consistency-evaluators-ices">Internal Consistency Evaluators (ICE)</a> should run.  You can specify the ICEs in a delimited list or in a custom table. 
     * 
     * When providing a delimited list of ICEs to be run, separate the ICEs in the list by colons (:), for example, "ICE01:ICE03:ICE08".
     * 
     * When providing the name of a custom sequence table, the ICEs to be run can be entered in the custom table. 
     * 
     * If the value of <i>szICEs</i> is <b>NULL</b>, all ICEs in the _ICESequence table are run. The _ICESequence table is the default table provided with orca.msi and msival2.msi.
     * @returns {HRESULT} This method can return one of these values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed. 
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
     * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nf-evalcom2-ivalidate-validate
     */
    Validate(wzICEs) {
        wzICEs := wzICEs is String ? StrPtr(wzICEs) : wzICEs

        result := ComCall(9, this, "ptr", wzICEs, "HRESULT")
        return result
    }
}
