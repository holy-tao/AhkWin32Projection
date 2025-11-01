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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTimecodeRangeCount", "GetTimecodeRangeBounds"]

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<Integer>} pwRangeCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadertimecode-gettimecoderangecount
     */
    GetTimecodeRangeCount(wStreamNum, pwRangeCount) {
        pwRangeCountMarshal := pwRangeCount is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ushort", wStreamNum, pwRangeCountMarshal, pwRangeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} wRangeNum 
     * @param {Pointer<Integer>} pStartTimecode 
     * @param {Pointer<Integer>} pEndTimecode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadertimecode-gettimecoderangebounds
     */
    GetTimecodeRangeBounds(wStreamNum, wRangeNum, pStartTimecode, pEndTimecode) {
        pStartTimecodeMarshal := pStartTimecode is VarRef ? "uint*" : "ptr"
        pEndTimecodeMarshal := pEndTimecode is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ushort", wStreamNum, "ushort", wRangeNum, pStartTimecodeMarshal, pStartTimecode, pEndTimecodeMarshal, pEndTimecode, "HRESULT")
        return result
    }
}
