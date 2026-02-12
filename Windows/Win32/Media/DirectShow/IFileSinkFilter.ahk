#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFileSinkFilter interface is implemented on filters that write media streams to a file.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifilesinkfilter2">IFileSinkFilter2</a> interface extends <b>IFileSinkFilter</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-ifilesinkfilter
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
     * @remarks
     * If the <i>pszFileName</i> parameter names a nonexistent file, the file will be created. If it names an existing file, the sink filter will overwrite the file without first deleting it.
     * @param {PWSTR} pszFileName Pointer to the name of the file to receive the media samples.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to the type of media samples to be written to the file, and the media type of the sink filter's input pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ifilesinkfilter-setfilename
     */
    SetFileName(pszFileName, pmt) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(3, this, "ptr", pszFileName, "ptr", pmt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetCurFile method retrieves the name and media type of the current file. (IFileSinkFilter.GetCurFile)
     * @remarks
     * If the filter has not opened a file, the method might succeed but return <b>NULL</b> in the <i>ppszFileName</i> parameter. Check the value when the method returns.
     * 
     * The method allocates the memory for the string returned in <i>ppszFileName</i>, and the memory for the format block in the media type (if any). The caller must free them by calling <b>CoTaskMemFree</b>. For the media type, you can use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/freemediatype">FreeMediaType</a> function in the base class library.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ifilesinkfilter-getcurfile
     */
    GetCurFile(ppszFileName, pmt) {
        ppszFileNameMarshal := ppszFileName is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppszFileNameMarshal, ppszFileName, "ptr", pmt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
