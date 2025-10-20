#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderTimecode interface provides access to information about SMPTE (Society of Motion Picture and Television Engineers) time code ranges.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreadertimecode
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderTimecode extends IUnknown{
    /**
     * The interface identifier for IWMReaderTimecode
     * @type {Guid}
     */
    static IID => Guid("{f369e2f0-e081-4fe6-8450-b810b2f410d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<UInt16>} pwRangeCount 
     * @returns {HRESULT} 
     */
    GetTimecodeRangeCount(wStreamNum, pwRangeCount) {
        result := ComCall(3, this, "ushort", wStreamNum, "ushort*", pwRangeCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} wRangeNum 
     * @param {Pointer<UInt32>} pStartTimecode 
     * @param {Pointer<UInt32>} pEndTimecode 
     * @returns {HRESULT} 
     */
    GetTimecodeRangeBounds(wStreamNum, wRangeNum, pStartTimecode, pEndTimecode) {
        result := ComCall(4, this, "ushort", wStreamNum, "ushort", wRangeNum, "uint*", pStartTimecode, "uint*", pEndTimecode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
