#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced2.ahk

/**
 * The IWMReaderAdvanced3 interface provides additional functionality to the reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced3 extends IWMReaderAdvanced2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAdvanced3
     * @type {Guid}
     */
    static IID => Guid("{5dc0674b-f04b-4a4e-9f2a-b1afde2c8100}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StopNetStreaming", "StartAtPosition"]

    /**
     * The StopNetStreaming method halts network streaming. Any samples that have already been received from the network are delivered as usual.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced3-stopnetstreaming
     */
    StopNetStreaming() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * The StartAtPosition method enables you to specify a starting position for a file using one of several offset formats.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number for which <i>pvOffsetStart</i> and <i>pvDuration</i> apply. Passing zero signifies that the offset start and duration apply for all streams in the file. If you pass zero, the only valid values for <i>dwOffsetFormat</i> are WMT_OFFSET_FORMAT_100NS and WMT_OFFSET_FORMAT_PLAYLIST_OFFSET.
     * @param {Pointer<Void>} pvOffsetStart Void pointer to the address containing the offset start. The unit of measurement for the offset is determined by <i>dwOffsetFormat</i>. The unit of measurement also dictates the size of the variable pointed to. The possible variable types are listed according to offset format in the following table.
     * 
     * <table>
     * <tr>
     * <th>Offset format
     *                 </th>
     * <th><i>pvOffsetStart</i> data type
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_100NS</td>
     * <td><b>QWORD</b></td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_FRAME_NUMBERS</td>
     * <td><b>QWORD</b></td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_PLAYLIST_OFFSET</td>
     * <td><b>LONG</b></td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_TIMECODE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_timecode_extension_data">WMT_TIMECODE_EXTENSION_DATA</a>
     * </td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_APPROXIMATE</td>
     * <td><b>QWORD</b></td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pvDuration Void pointer to the address containing the duration of playback. If zero is passed, playback will continue until the end of the file. The unit of measurement for the duration is determined by <i>dwOffsetFormat</i>. The unit of measurement also dictates the size of the variable pointed to. The possible variable types are listed according to offset format in the following table.
     * 
     * <table>
     * <tr>
     * <th>Offset format
     *                 </th>
     * <th><i>pvDuration</i> data type
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_100NS</td>
     * <td><b>QWORD</b></td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_FRAME_NUMBERS</td>
     * <td><b>QWORD</b></td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_PLAYLIST_OFFSET</td>
     * <td><b>QWORD</b></td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_TIMECODE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_timecode_extension_data">WMT_TIMECODE_EXTENSION_DATA</a>
     * </td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_APPROXIMATE</td>
     * <td><b>QWORD</b></td>
     * </tr>
     * </table>
     * @param {Integer} dwOffsetFormat <b>DWORD</b> containing one member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_offset_format">WMT_OFFSET_FORMAT</a> enumeration type. Valid values and their meanings are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_100NS</td>
     * <td>The offset and duration are specified in 100-nanosecond units. This is the same offset format that is supported by the <b>IWMReader::Start</b> method.</td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_FRAME_NUMBERS</td>
     * <td>The offset is specified by the video frame number at which to start playback. The duration is a number of video frames.</td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_PLAYLIST_OFFSET</td>
     * <td>The offset is specified by an offset into a playlist. The duration is specified in 100-nanosecond units.</td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_TIMECODE</td>
     * <td>The offset is specified by a SMPTE time code value. The duration is not a count, but another SMPTE time code value.</td>
     * </tr>
     * <tr>
     * <td>WMT_OFFSET_FORMAT_APPROXIMATE</td>
     * <td>The offset and duration are specified in 100-nanosecond units. When this format is used, playback begins with the closest clean point prior to the time provided. This format is intended to decrease seeking time when the exact sample is not required, such as in a player application's seek bar.</td>
     * </tr>
     * </table>
     * @param {Float} fRate Floating point number indicating playback rate. Normal-speed playback is 1.0; higher numbers cause faster playback, and lower numbers cause slower playback. Numbers less than zero indicate reverse rate (rewinding). The valid range is 1.0 through 10.0, and -1.0 through -10.0.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is passed back to the application on calls to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreadercallback">IWMReaderCallback</a>.
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
     * <i>dwOffsetFormat</i> is WMT_OFFSET_FORMAT_FRAME_NUMBERS and <i>wStreamNum</i> is zero.
     * 
     * OR
     * 
     * <i>pvOffsetStart</i> is <b>NULL</b>, signifying a resume, and the reader is in stop mode. You cannot resume playback when the player has been stopped.
     * 
     * OR
     * 
     * <i>pvOffsetStart</i> is <b>NULL</b>, signifying a resume, and <i>pvDuration</i> is not <b>NULL</b>. You cannot specify a duration for a resume.
     * 
     * OR
     * 
     * No file is open in the reader.
     * 
     * OR
     * 
     * <i>fRate</i> is out of bounds.
     * 
     * OR
     * 
     * The reader receiving broadcast streams. You cannot seek from a broadcasting source.
     * 
     * OR
     * 
     * <i>fRate</i> is negative, indicating a rewind, and the duration would rewind to before the beginning of the file.
     * 
     * OR
     * 
     * <i>dwOffsetFormat</i> is WMT_OFFSET_FORMAT_FRAME_NUMBERS and the file is not indexed and/or is not indexed by frame.
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
     * The method is unable to allocate memory for a message structure required internally.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced3-startatposition
     */
    StartAtPosition(wStreamNum, pvOffsetStart, pvDuration, dwOffsetFormat, fRate, pvContext) {
        pvOffsetStartMarshal := pvOffsetStart is VarRef ? "ptr" : "ptr"
        pvDurationMarshal := pvDuration is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(39, this, "ushort", wStreamNum, pvOffsetStartMarshal, pvOffsetStart, pvDurationMarshal, pvDuration, "int", dwOffsetFormat, "float", fRate, pvContextMarshal, pvContext, "HRESULT")
        return result
    }
}
