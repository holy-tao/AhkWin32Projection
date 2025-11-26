#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssComponentEx.ahk

/**
 * Defines additional methods for reporting and retrieving component-level writer errors.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscomponentex2
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssComponentEx2 extends IVssComponentEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssComponentEx2
     * @type {Guid}
     */
    static IID => Guid("{3b5be0f2-07a9-4e4b-bdd3-cfdc8e2c0d2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 48

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFailure", "GetFailure"]

    /**
     * VSS writers call this method to report errors at the component level.
     * @param {HRESULT} hr The error code to be returned to the requester that calls the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponentex2-getfailure">IVssComponentEx2::GetFailure</a> method. 
     *       
     * 
     * The following are the error codes that this method can set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="S_OK"></a><a id="s_ok"></a><dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT"></a><a id="vss_e_writererror_inconsistentsnapshot"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy contains only a subset of the volumes needed by the writer to correctly back up the 
     *         application component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_OUTOFRESOURCES"></a><a id="vss_e_writererror_outofresources"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_OUTOFRESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer ran out of memory or other system resources. The recommended way to handle this error code is 
     *         to wait ten minutes and then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_TIMEOUT"></a><a id="vss_e_writererror_timeout"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer operation failed because of a time-out between the Freeze and Thaw events. The recommended way 
     *         to handle this error code is to wait ten minutes and then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_RETRYABLE"></a><a id="vss_e_writererror_retryable"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_RETRYABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer failed due to an error that would likely not occur if the entire backup, restore, or shadow 
     *         copy creation process was restarted. The recommended way to handle this error code is to wait ten minutes and 
     *         then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_NONRETRYABLE"></a><a id="vss_e_writererror_nonretryable"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_NONRETRYABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer operation failed because of an error that might recur if another shadow copy is created. For 
     *         more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HRESULT} hrApplication An additional error code to be returned to the requester. This parameter is optional.
     * @param {PWSTR} wszApplicationMessage A string containing an error message for the requester  to display to the end user. The writer is responsible for localizing this string if necessary before using it in this method. This parameter is optional and can be <b>NULL</b> or an empty string.
     * @param {Integer} dwReserved This parameter is reserved for future use and should be set to zero.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex2-setfailure
     */
    SetFailure(hr, hrApplication, wszApplicationMessage, dwReserved) {
        wszApplicationMessage := wszApplicationMessage is String ? StrPtr(wszApplicationMessage) : wszApplicationMessage

        result := ComCall(48, this, "int", hr, "int", hrApplication, "ptr", wszApplicationMessage, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * VSS requesters call this method to retrieve component-level errors reported by writers.
     * @param {Pointer<HRESULT>} phr The address of a caller-allocated variable that receives the HRESULT failure code that the writer passed for the <i>hr</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponentex2-setfailure">IVssComponentEx2::SetFailure</a> method. This parameter is required and cannot be <b>NULL</b>.
     * 
     * The following are the supported values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="S_OK"></a><a id="s_ok"></a><dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT"></a><a id="vss_e_writererror_inconsistentsnapshot"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy contains only a subset of the volumes needed by the writer to correctly back up the 
     *         application component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_OUTOFRESOURCES"></a><a id="vss_e_writererror_outofresources"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_OUTOFRESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer ran out of memory or other system resources. The recommended way to handle this error code is 
     *         to wait ten minutes and then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_TIMEOUT"></a><a id="vss_e_writererror_timeout"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer operation failed because of a time-out between the Freeze and Thaw events. The recommended way 
     *         to handle this error code is to wait ten minutes and then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_RETRYABLE"></a><a id="vss_e_writererror_retryable"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_RETRYABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer failed due to an error that would likely not occur if the entire backup, restore, or shadow 
     *         copy creation process was restarted. The recommended way to handle this error code is to wait ten minutes and 
     *         then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_NONRETRYABLE"></a><a id="vss_e_writererror_nonretryable"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_NONRETRYABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer operation failed because of an error that might recur if another shadow copy is created. For 
     *         more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITER_NOT_RESPONDING"></a><a id="vss_e_writer_not_responding"></a><dl>
     * <dt><b>VSS_E_WRITER_NOT_RESPONDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not responding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITER_STATUS_NOT_AVAILABLE"></a><a id="vss_e_writer_status_not_available"></a><dl>
     * <dt><b>VSS_E_WRITER_STATUS_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer status is not available for one or more writers. A writer may have reached the maximum number of available backup and restore sessions.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<HRESULT>} phrApplication The address of a caller-allocated variable that receives the return code that the writer passed for the <i>hrApplication</i> parameter of  the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponentex2-setfailure">SetFailure</a> method. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<BSTR>} pbstrApplicationMessage The address of a caller-allocated variable that receives the application failure message that the writer passed for the <i>wszApplicationMessage</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponentex2-setfailure">SetFailure</a> method. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwReserved The address of a caller-allocated DWORD variable. This parameter is reserved for future use, but it is required and cannot be <b>NULL</b>.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the status of the specified writer. Note that the value of the 
     *         <i>phrFailureWriter</i> parameter must be checked to verify that the writer was successful. 
     *         The writer failure codes can be among those listed in VsWriter.h and in <a href="/windows/desktop/VSS/writer-errors-and-vetoes">Writer Errors and Vetoes</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>phr</i>, <i>phrApplication</i>, <i>pbstrApplicationMessage</i>, or <i>pdwReserved</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * <dt>0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * <dt>0x80042301L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, 
     *         or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex2-getfailure
     */
    GetFailure(phr, phrApplication, pbstrApplicationMessage, pdwReserved) {
        phrMarshal := phr is VarRef ? "int*" : "ptr"
        phrApplicationMarshal := phrApplication is VarRef ? "int*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, phrMarshal, phr, phrApplicationMarshal, phrApplication, "ptr", pbstrApplicationMessage, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }
}
