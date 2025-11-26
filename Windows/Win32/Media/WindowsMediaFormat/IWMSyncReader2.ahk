#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAllocatorEx.ahk
#Include .\IWMSyncReader.ahk

/**
 * The IWMSyncReader2 interface provides advanced features for the synchronous reader.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmsyncreader2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSyncReader2 extends IWMSyncReader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSyncReader2
     * @type {Guid}
     */
    static IID => Guid("{faed3d21-1b6b-4af7-8cb6-3e189bbc187b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRangeByTimecode", "SetRangeByFrameEx", "SetAllocateForOutput", "GetAllocateForOutput", "SetAllocateForStream", "GetAllocateForStream"]

    /**
     * The SetRangeByTimecode method sets a starting and ending time, based on SMPTE time codes, for playback of a file.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Pointer<WMT_TIMECODE_EXTENSION_DATA>} pStart Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_timecode_extension_data">WMT_TIMECODE_EXTENSION_DATA</a> structure containing the starting time code.
     * @param {Pointer<WMT_TIMECODE_EXTENSION_DATA>} pEnd Pointer to a <b>WMT_TIMECODE_EXTENSION_DATA</b> structure containing the ending time code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setrangebytimecode
     */
    SetRangeByTimecode(wStreamNum, pStart, pEnd) {
        result := ComCall(24, this, "ushort", wStreamNum, "ptr", pStart, "ptr", pEnd, "HRESULT")
        return result
    }

    /**
     * The SetRangeByFrameEx method configures the synchronous reader to read a portion of the file specified by a starting video frame number and a number of frames to read. This method also retrieves the presentation time of the requested frame number.
     * @param {Integer} wStreamNum Stream number.
     * @param {Integer} qwFrameNumber Frame number at which to begin playback. The first frame in a file is number 1.
     * @param {Integer} cFramesToRead Count of frames to read. Pass 0 to continue playback to the end of the file.
     * @returns {Integer} Start time in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setrangebyframeex
     */
    SetRangeByFrameEx(wStreamNum, qwFrameNumber, cFramesToRead) {
        result := ComCall(25, this, "ushort", wStreamNum, "uint", qwFrameNumber, "int64", cFramesToRead, "uint*", &pcnsStartTime := 0, "HRESULT")
        return pcnsStartTime
    }

    /**
     * The SetAllocateForOutput method sets a sample allocation callback interface for allocating output samples.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {IWMReaderAllocatorEx} pAllocator Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex">IWMReaderAllocatorEx</a> interface implemented in your application.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setallocateforoutput
     */
    SetAllocateForOutput(dwOutputNum, pAllocator) {
        result := ComCall(26, this, "uint", dwOutputNum, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * The GetAllocateForOutput method retrieves an interface for allocating output samples.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @returns {IWMReaderAllocatorEx} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex">IWMReaderAllocatorEx</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader2-getallocateforoutput
     */
    GetAllocateForOutput(dwOutputNum) {
        result := ComCall(27, this, "uint", dwOutputNum, "ptr*", &ppAllocator := 0, "HRESULT")
        return IWMReaderAllocatorEx(ppAllocator)
    }

    /**
     * The SetAllocateForStream method sets a sample allocation callback interface for allocating stream samples.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {IWMReaderAllocatorEx} pAllocator Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex">IWMReaderAllocatorEx</a> interface implemented in your application.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setallocateforstream
     */
    SetAllocateForStream(wStreamNum, pAllocator) {
        result := ComCall(28, this, "ushort", wStreamNum, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * The GetAllocateForStream method retrieves an interface for allocating stream samples.
     * @param {Integer} dwSreamNum <b>DWORD</b> containing the stream number.
     * @returns {IWMReaderAllocatorEx} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex">IWMReaderAllocatorEx</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader2-getallocateforstream
     */
    GetAllocateForStream(dwSreamNum) {
        result := ComCall(29, this, "ushort", dwSreamNum, "ptr*", &ppAllocator := 0, "HRESULT")
        return IWMReaderAllocatorEx(ppAllocator)
    }
}
