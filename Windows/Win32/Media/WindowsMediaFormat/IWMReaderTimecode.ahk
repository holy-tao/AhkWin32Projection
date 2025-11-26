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
     * The GetTimecodeRangeCount method retrieves the total number of SMTPE time code ranges in a specified stream.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. This stream must be indexed by time code.
     * @returns {Integer} Pointer to a <b>WORD</b> containing the number of ranges. If this parameter is 0 on method return, no SMPTE ranges exist in the stream.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreadertimecode-gettimecoderangecount
     */
    GetTimecodeRangeCount(wStreamNum) {
        result := ComCall(3, this, "ushort", wStreamNum, "ushort*", &pwRangeCount := 0, "HRESULT")
        return pwRangeCount
    }

    /**
     * The GetTimecodeRangeBounds method retrieves the starting and ending time codes for a specified SMPTE time code range.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Integer} wRangeNum <b>WORD</b> containing the range number.
     * @param {Pointer<Integer>} pStartTimecode Pointer to a <b>DWORD</b> containing the first time code in the range.
     * @param {Pointer<Integer>} pEndTimecode Pointer to a <b>DWORD</b> containing the last time code in the range.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreadertimecode-gettimecoderangebounds
     */
    GetTimecodeRangeBounds(wStreamNum, wRangeNum, pStartTimecode, pEndTimecode) {
        pStartTimecodeMarshal := pStartTimecode is VarRef ? "uint*" : "ptr"
        pEndTimecodeMarshal := pEndTimecode is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ushort", wStreamNum, "ushort", wRangeNum, pStartTimecodeMarshal, pStartTimecode, pEndTimecodeMarshal, pEndTimecode, "HRESULT")
        return result
    }
}
