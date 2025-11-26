#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFileSinkFilter interface is implemented on filters that write media streams to a file.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifilesinkfilter2">IFileSinkFilter2</a> interface extends <b>IFileSinkFilter</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifilesinkfilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFileSinkFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSinkFilter
     * @type {Guid}
     */
    static IID => Guid("{a2104830-7c70-11cf-8bce-00aa00a3f1a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFileName", "GetCurFile"]

    /**
     * The SetFileName method sets the name of the file into which media samples will be written.
     * @param {PWSTR} pszFileName Pointer to the name of the file to receive the media samples.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to the type of media samples to be written to the file, and the media type of the sink filter's input pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifilesinkfilter-setfilename
     */
    SetFileName(pszFileName, pmt) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(3, this, "ptr", pszFileName, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The GetCurFile method retrieves the name and media type of the current file.
     * @param {Pointer<PWSTR>} ppszFileName Address of a pointer that receives the name of the file, as an <b>OLESTR</b> type.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that receives the media type. This parameter can by <b>NULL</b>, in which case the method does not return the media type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
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
     * No file is opened.
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
     * Insufficient memory.
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
     * <b>NULL</b> pointer argument in <i>ppszFileName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifilesinkfilter-getcurfile
     */
    GetCurFile(ppszFileName, pmt) {
        ppszFileNameMarshal := ppszFileName is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppszFileNameMarshal, ppszFileName, "ptr", pmt, "HRESULT")
        return result
    }
}
