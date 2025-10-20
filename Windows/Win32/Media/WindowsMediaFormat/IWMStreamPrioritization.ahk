#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMStreamPrioritization interface provides methods to set and read priority records for a file.Stream prioritization allows content creators to specify the priority of the streams in an ASF file.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamprioritization
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamPrioritization extends IUnknown{
    /**
     * The interface identifier for IWMStreamPrioritization
     * @type {Guid}
     */
    static IID => Guid("{8c1c6090-f9a8-4748-8ec3-dd1108ba1e77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<WM_STREAM_PRIORITY_RECORD>} pRecordArray 
     * @param {Pointer<UInt16>} pcRecords 
     * @returns {HRESULT} 
     */
    GetPriorityRecords(pRecordArray, pcRecords) {
        result := ComCall(3, this, "ptr", pRecordArray, "ushort*", pcRecords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WM_STREAM_PRIORITY_RECORD>} pRecordArray 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     */
    SetPriorityRecords(pRecordArray, cRecords) {
        result := ComCall(4, this, "ptr", pRecordArray, "ushort", cRecords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
