#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferRecComp interface is used to create new content recordings by concatenating existing recordings. The new recording can be created from a mix of reference and content recordings.The Stream Buffer RecComp object exposes this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferRecComp)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferreccomp
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferRecComp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferRecComp
     * @type {Guid}
     */
    static IID => Guid("{9e259a9b-8815-42ae-b09f-221970b154fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Append", "AppendEx", "GetCurrentLength", "Close", "Cancel"]

    /**
     * The Initialize method sets the file name and the profile for the new recording. Call this method once, after creating the RecComp object.
     * @param {PWSTR} pszTargetFilename Null-terminated, wide character string that specifies the file name of the new recording.
     * @param {PWSTR} pszSBRecProfileRef Null-terminated, wide character string that specifies an existing file. This file must be a complete recording, already created by the Stream Buffer Engine.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferreccomp-initialize
     */
    Initialize(pszTargetFilename, pszSBRecProfileRef) {
        pszTargetFilename := pszTargetFilename is String ? StrPtr(pszTargetFilename) : pszTargetFilename
        pszSBRecProfileRef := pszSBRecProfileRef is String ? StrPtr(pszSBRecProfileRef) : pszSBRecProfileRef

        result := ComCall(3, this, "ptr", pszTargetFilename, "ptr", pszSBRecProfileRef, "HRESULT")
        return result
    }

    /**
     * The Append method appends an entire recording to the target file.
     * @param {PWSTR} pszSBRecording Null-terminated, wide character string that contains the name of the file to append.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferreccomp-append
     */
    Append(pszSBRecording) {
        pszSBRecording := pszSBRecording is String ? StrPtr(pszSBRecording) : pszSBRecording

        result := ComCall(4, this, "ptr", pszSBRecording, "HRESULT")
        return result
    }

    /**
     * The AppendEx method appends part of a recording to the target file.
     * @param {PWSTR} pszSBRecording Null-terminated, wide character string that contains the name of the file to append.
     * @param {Integer} rtStart Specifies the start time of the segment to append, in 100-nanosecond units.
     * @param {Integer} rtStop Specifies the stop time of the segment to append, in 100-nanosecond units.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferreccomp-appendex
     */
    AppendEx(pszSBRecording, rtStart, rtStop) {
        pszSBRecording := pszSBRecording is String ? StrPtr(pszSBRecording) : pszSBRecording

        result := ComCall(5, this, "ptr", pszSBRecording, "int64", rtStart, "int64", rtStop, "HRESULT")
        return result
    }

    /**
     * The GetCurrentLength method retrieves the length of the target file.
     * @returns {Integer} Pointer to a variable that receives the current length, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferreccomp-getcurrentlength
     */
    GetCurrentLength() {
        result := ComCall(6, this, "uint*", &pcSeconds := 0, "HRESULT")
        return pcSeconds
    }

    /**
     * The Close method closes the target file.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferreccomp-close
     */
    Close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Cancel method cancels an append operation, if one is in progress. Otherwise, it has no effect.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferreccomp-cancel
     */
    Cancel() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
