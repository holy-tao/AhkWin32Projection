#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WMT_TIMECODE_EXTENSION_DATA.ahk" { WMT_TIMECODE_EXTENSION_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMReaderAllocatorEx.ahk" { IWMReaderAllocatorEx }
#Import ".\IWMSyncReader.ahk" { IWMSyncReader }

/**
 * The IWMSyncReader2 interface provides advanced features for the synchronous reader.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmsyncreader2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMSyncReader2 extends IWMSyncReader {
    /**
     * The interface identifier for IWMSyncReader2
     * @type {Guid}
     */
    static IID := Guid("{faed3d21-1b6b-4af7-8cb6-3e189bbc187b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMSyncReader2 interfaces
    */
    struct Vtbl extends IWMSyncReader.Vtbl {
        SetRangeByTimecode   : IntPtr
        SetRangeByFrameEx    : IntPtr
        SetAllocateForOutput : IntPtr
        GetAllocateForOutput : IntPtr
        SetAllocateForStream : IntPtr
        GetAllocateForStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMSyncReader2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetRangeByTimecode method sets a starting and ending time, based on SMPTE time codes, for playback of a file.
     * @remarks
     * For the method to succeed, the file must be indexed by SMPTE time code.
     * 
     * If the call is successful, all streams are synchronized to the same position based on presentation time.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Pointer<WMT_TIMECODE_EXTENSION_DATA>} pStart Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_timecode_extension_data">WMT_TIMECODE_EXTENSION_DATA</a> structure containing the starting time code.
     * @param {Pointer<WMT_TIMECODE_EXTENSION_DATA>} pEnd Pointer to a <b>WMT_TIMECODE_EXTENSION_DATA</b> structure containing the ending time code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setrangebytimecode
     */
    SetRangeByTimecode(wStreamNum, pStart, pEnd) {
        result := ComCall(24, this, "ushort", wStreamNum, WMT_TIMECODE_EXTENSION_DATA.Ptr, pStart, WMT_TIMECODE_EXTENSION_DATA.Ptr, pEnd, "HRESULT")
        return result
    }

    /**
     * The SetRangeByFrameEx method configures the synchronous reader to read a portion of the file specified by a starting video frame number and a number of frames to read. This method also retrieves the presentation time of the requested frame number.
     * @remarks
     * By getting the presentation time of the requested frame number, you can avoid problems caused by seeking to a delta frame. The synchronous reader begins delivering samples at key frame boundaries. You can ignore frames until you reach the presentation time of your target frame.
     * 
     * The file must be frame-indexed. If the call is successful, all streams are synchronized to the same position based on time.
     * @param {Integer} wStreamNum Stream number.
     * @param {Integer} qwFrameNumber Frame number at which to begin playback. The first frame in a file is number 1.
     * @param {Integer} cFramesToRead Count of frames to read. Pass 0 to continue playback to the end of the file.
     * @returns {Integer} Start time in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setrangebyframeex
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setallocateforoutput
     */
    SetAllocateForOutput(dwOutputNum, pAllocator) {
        result := ComCall(26, this, "uint", dwOutputNum, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * The GetAllocateForOutput method retrieves an interface for allocating output samples.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @returns {IWMReaderAllocatorEx} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex">IWMReaderAllocatorEx</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-getallocateforoutput
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setallocateforstream
     */
    SetAllocateForStream(wStreamNum, pAllocator) {
        result := ComCall(28, this, "ushort", wStreamNum, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * The GetAllocateForStream method retrieves an interface for allocating stream samples.
     * @param {Integer} dwSreamNum <b>DWORD</b> containing the stream number.
     * @returns {IWMReaderAllocatorEx} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex">IWMReaderAllocatorEx</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-getallocateforstream
     */
    GetAllocateForStream(dwSreamNum) {
        result := ComCall(29, this, "ushort", dwSreamNum, "ptr*", &ppAllocator := 0, "HRESULT")
        return IWMReaderAllocatorEx(ppAllocator)
    }

    Query(iid) {
        if (IWMSyncReader2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRangeByTimecode := CallbackCreate(GetMethod(implObj, "SetRangeByTimecode"), flags, 4)
        this.vtbl.SetRangeByFrameEx := CallbackCreate(GetMethod(implObj, "SetRangeByFrameEx"), flags, 5)
        this.vtbl.SetAllocateForOutput := CallbackCreate(GetMethod(implObj, "SetAllocateForOutput"), flags, 3)
        this.vtbl.GetAllocateForOutput := CallbackCreate(GetMethod(implObj, "GetAllocateForOutput"), flags, 3)
        this.vtbl.SetAllocateForStream := CallbackCreate(GetMethod(implObj, "SetAllocateForStream"), flags, 3)
        this.vtbl.GetAllocateForStream := CallbackCreate(GetMethod(implObj, "GetAllocateForStream"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRangeByTimecode)
        CallbackFree(this.vtbl.SetRangeByFrameEx)
        CallbackFree(this.vtbl.SetAllocateForOutput)
        CallbackFree(this.vtbl.GetAllocateForOutput)
        CallbackFree(this.vtbl.SetAllocateForStream)
        CallbackFree(this.vtbl.GetAllocateForStream)
    }
}
