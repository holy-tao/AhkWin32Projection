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
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<WMT_TIMECODE_EXTENSION_DATA>} pStart 
     * @param {Pointer<WMT_TIMECODE_EXTENSION_DATA>} pEnd 
     * @returns {HRESULT} 
     */
    SetRangeByTimecode(wStreamNum, pStart, pEnd) {
        result := ComCall(24, this, "ushort", wStreamNum, "ptr", pStart, "ptr", pEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} qwFrameNumber 
     * @param {Integer} cFramesToRead 
     * @param {Pointer<UInt64>} pcnsStartTime 
     * @returns {HRESULT} 
     */
    SetRangeByFrameEx(wStreamNum, qwFrameNumber, cFramesToRead, pcnsStartTime) {
        result := ComCall(25, this, "ushort", wStreamNum, "uint", qwFrameNumber, "int64", cFramesToRead, "uint*", pcnsStartTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<IWMReaderAllocatorEx>} pAllocator 
     * @returns {HRESULT} 
     */
    SetAllocateForOutput(dwOutputNum, pAllocator) {
        result := ComCall(26, this, "uint", dwOutputNum, "ptr", pAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<IWMReaderAllocatorEx>} ppAllocator 
     * @returns {HRESULT} 
     */
    GetAllocateForOutput(dwOutputNum, ppAllocator) {
        result := ComCall(27, this, "uint", dwOutputNum, "ptr", ppAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<IWMReaderAllocatorEx>} pAllocator 
     * @returns {HRESULT} 
     */
    SetAllocateForStream(wStreamNum, pAllocator) {
        result := ComCall(28, this, "ushort", wStreamNum, "ptr", pAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSreamNum 
     * @param {Pointer<IWMReaderAllocatorEx>} ppAllocator 
     * @returns {HRESULT} 
     */
    GetAllocateForStream(dwSreamNum, ppAllocator) {
        result := ComCall(29, this, "ushort", dwSreamNum, "ptr", ppAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
