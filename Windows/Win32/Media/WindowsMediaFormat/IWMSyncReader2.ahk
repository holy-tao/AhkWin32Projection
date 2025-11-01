#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<WMT_TIMECODE_EXTENSION_DATA>} pStart 
     * @param {Pointer<WMT_TIMECODE_EXTENSION_DATA>} pEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setrangebytimecode
     */
    SetRangeByTimecode(wStreamNum, pStart, pEnd) {
        result := ComCall(24, this, "ushort", wStreamNum, "ptr", pStart, "ptr", pEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} qwFrameNumber 
     * @param {Integer} cFramesToRead 
     * @param {Pointer<Integer>} pcnsStartTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setrangebyframeex
     */
    SetRangeByFrameEx(wStreamNum, qwFrameNumber, cFramesToRead, pcnsStartTime) {
        result := ComCall(25, this, "ushort", wStreamNum, "uint", qwFrameNumber, "int64", cFramesToRead, "uint*", pcnsStartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {IWMReaderAllocatorEx} pAllocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setallocateforoutput
     */
    SetAllocateForOutput(dwOutputNum, pAllocator) {
        result := ComCall(26, this, "uint", dwOutputNum, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<IWMReaderAllocatorEx>} ppAllocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-getallocateforoutput
     */
    GetAllocateForOutput(dwOutputNum, ppAllocator) {
        result := ComCall(27, this, "uint", dwOutputNum, "ptr*", ppAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {IWMReaderAllocatorEx} pAllocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-setallocateforstream
     */
    SetAllocateForStream(wStreamNum, pAllocator) {
        result := ComCall(28, this, "ushort", wStreamNum, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSreamNum 
     * @param {Pointer<IWMReaderAllocatorEx>} ppAllocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader2-getallocateforstream
     */
    GetAllocateForStream(dwSreamNum, ppAllocator) {
        result := ComCall(29, this, "ushort", dwSreamNum, "ptr*", ppAllocator, "HRESULT")
        return result
    }
}
