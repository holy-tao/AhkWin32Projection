#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferConfigure2.ahk

/**
 * The IStreamBufferConfigure3 interface is exposed by the StreamBufferConfig object.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferConfigure3)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferconfigure3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferConfigure3 extends IStreamBufferConfigure2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferConfigure3
     * @type {Guid}
     */
    static IID => Guid("{7e2d2a1e-7192-4bd7-80c1-061fd1d10402}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStartRecConfig", "GetStartRecConfig", "SetNamespace", "GetNamespace"]

    /**
     * The SetStartRecConfig method specifies whether the IStreamBufferRecordControl::Start method automatically stops the current recording.
     * @param {BOOL} fStartStopsCur If <b>TRUE</b>, the <b>Start</b> method automatically stops the current recording. Otherwise, the <b>Start</b> method fails if another recording is in progress. The default value is <b>FALSE</b>.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferconfigure3-setstartrecconfig
     */
    SetStartRecConfig(fStartStopsCur) {
        result := ComCall(13, this, "int", fStartStopsCur, "HRESULT")
        return result
    }

    /**
     * The GetStartRecConfig method queries whether the IStreamBufferRecordControl::Start method automatically stops the current recording.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the <b>Start</b> method automatically stops the current recording. Otherwise, the <b>Start</b> method fails if another recording is in progress.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferconfigure3-getstartrecconfig
     */
    GetStartRecConfig() {
        result := ComCall(14, this, "int*", &pfStartStopsCur := 0, "HRESULT")
        return pfStartStopsCur
    }

    /**
     * The SetNamespace method specifies a prefix that is added to the names of the synchronization objects that the Stream Buffer Engine uses to synchronize the reader and writer.
     * @param {PWSTR} pszNamespace Pointer to a null-terminated wide character string. If <b>NULL</b>, no prefix is used. Currently, the following values are supported.
     * 
     * <ul>
     * <li>L"Global"</li>
     * <li><b>NULL</b></li>
     * </ul>
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
     * <dt><b>CO_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified prefix is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferconfigure3-setnamespace
     */
    SetNamespace(pszNamespace) {
        pszNamespace := pszNamespace is String ? StrPtr(pszNamespace) : pszNamespace

        result := ComCall(15, this, "ptr", pszNamespace, "HRESULT")
        return result
    }

    /**
     * The GetNamespace method retrieves the prefix that is added to the names of the synchronization objects that the Stream Buffer Engine uses to synchronize the reader and writer.
     * @returns {PWSTR} Receives a pointer to a null-terminated, wide-character string. The caller must free the string by calling <b>CoTaskMemFree</b>. If no prefix is defined, this variable receives a <b>NULL</b> pointer.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferconfigure3-getnamespace
     */
    GetNamespace() {
        result := ComCall(16, this, "ptr*", &ppszNamespace := 0, "HRESULT")
        return ppszNamespace
    }
}
