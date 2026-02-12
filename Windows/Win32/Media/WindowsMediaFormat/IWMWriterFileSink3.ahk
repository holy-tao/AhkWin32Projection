#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterFileSink2.ahk

/**
 * The IWMWriterFileSink3 interface provides additional functionality to the file sink object. To obtain a pointer to this interface, call QueryInterface on the file sink object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmwriterfilesink3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterFileSink3 extends IWMWriterFileSink2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterFileSink3
     * @type {Guid}
     */
    static IID => Guid("{3fea4feb-2945-47a7-a1dd-c53a8fc4c45c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAutoIndexing", "GetAutoIndexing", "SetControlStream", "GetMode", "OnDataUnitEx", "SetUnbufferedIO", "GetUnbufferedIO", "CompleteOperations"]

    /**
     * The SetAutoIndexing method enables or disables automatic indexing of the file.
     * @remarks
     * The state of automatic indexing must be set before the header is processed. After the header has been processed, any call to <b>SetAutoIndexing</b> results in an error.
     * 
     * Files are indexed by default. To disable indexing, you must call this method, passing False as the parameter.
     * 
     * If you generate an ASF file using bit-rate mutual exclusion for audio content (multiple bit-rate audio), the resulting indexed file will not work with Windows Media Services version 4.1. If you want to stream your file using Windows Media Services 4.1, you must disable automatic indexing before writing the file.
     * @param {BOOL} fDoAutoIndexing Boolean value that is True to automatically index the file.
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
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header has already been received
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setautoindexing
     */
    SetAutoIndexing(fDoAutoIndexing) {
        result := ComCall(16, this, "int", fDoAutoIndexing, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetAutoIndexing method retrieves the current state of automatic indexing for the file.
     * @returns {BOOL} Pointer to a Boolean value that is True if automatic indexing is enabled for the file.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-getautoindexing
     */
    GetAutoIndexing() {
        result := ComCall(17, this, "int*", &pfAutoIndexing := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfAutoIndexing
    }

    /**
     * The SetControlStream method enables you to specify that a stream should be used as a control stream. You can also use this method to indicate that a previously specified control stream should no longer be used as a control stream.
     * @remarks
     * Control streams add accuracy to <b>Start</b> and <b>Stop</b> calls. Instead of trying to find the best starting or stopping place for the file based on times in interleaved streams, the file sink starts and stops the file at exactly the specified time in the control stream. The other streams are then synchronized with the control stream.
     * 
     * You can have more than one control stream, by making multiple calls to this method. The file sink will start or stop at the first encountered instance of the desired time.
     * @param {Integer} wStreamNumber A <b>WORD</b> specifying the stream number to configure. Stream numbers must be in the range of 1 through 63.
     * @param {BOOL} fShouldControlStartAndStop A BOOL specifying whether or not the stream should be used as a control stream.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream number specified by <i>wStreamNumber</i> is greater than the maximum.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setcontrolstream
     */
    SetControlStream(wStreamNumber, fShouldControlStartAndStop) {
        result := ComCall(18, this, "ushort", wStreamNumber, "int", fShouldControlStartAndStop, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetMode method retrieves the supported file sink mode. More than one mode can be supported.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_filesink_mode">WMT_FILESINK_MODE</a> enumeration type or multiple values combined with a bitwise <b>OR</b> operator.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-getmode
     */
    GetMode() {
        result := ComCall(19, this, "uint*", &pdwFileSinkMode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwFileSinkMode
    }

    /**
     * The OnDataUnitEx method is called when the writer has finished sending a data unit.
     * @remarks
     * Applications do not call this method. If you are implementing the <b>IWMWriterFileSink3</b> interface on a custom sink, you have the option of implementing this method. If you do so, your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-getmode">GetMode</a> should return WMT_FM_FILESINK_DATA_UNITS.
     * @param {Pointer<WMT_FILESINK_DATA_UNIT>} pFileSinkDataUnit Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_filesink_data_unit">WMT_FILESINK_DATA_UNIT</a> structure containing the data unit information.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-ondataunitex
     */
    OnDataUnitEx(pFileSinkDataUnit) {
        result := ComCall(20, this, "ptr", pFileSinkDataUnit, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetUnbufferedIO method specifies whether unbuffered I/O is used for the file sink. You can improve performance by using unbuffered I/O for writer sessions with a high bit rate and a long running time.
     * @remarks
     * This method enables the application to override the writer's decision about whether to use unbuffered I/O.
     * 
     * If you want to use unbuffered I/O, you must call this method before writing the header of the file.
     * 
     * This method dynamically allocates a set of buffers to prepare data for unbuffered writing. The size of these buffers is dependent upon the amount of available physical memory.
     * @param {BOOL} fUnbufferedIO A <b>BOOL</b> that specifies whether to use unbuffered I/O.
     * @param {BOOL} fRestrictMemUsage A <b>BOOL</b> that specifies whether memory usage should be restricted. Passing True for this parameter severely limits the size of the buffers used to prepare data for unbuffered writing. This limitation usually counteracts any performance gains from using unbuffered I/O.
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
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header has already been written.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setunbufferedio
     */
    SetUnbufferedIO(fUnbufferedIO, fRestrictMemUsage) {
        result := ComCall(21, this, "int", fUnbufferedIO, "int", fRestrictMemUsage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetUnbufferedIO method ascertains whether unbuffered I/O is used for the file sink.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if unbuffered I/O is used with this file sink.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-getunbufferedio
     */
    GetUnbufferedIO() {
        result := ComCall(22, this, "int*", &pfUnbufferedIO := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfUnbufferedIO
    }

    /**
     * The CompleteOperations method stops the writer sink after completing all operations in progress. This method is used with unbuffered I/O.
     * @remarks
     * This method is called when writes are performed as a result of calls to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-onheader">IWMWriterSink::OnHeader</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-ondataunit">IWMWriterSink::OnDataUnit</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-ondataunitex">IWMWriterFileSink3::OnDataUnitEx</a>. Applications do not call this method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-completeoperations
     */
    CompleteOperations() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
