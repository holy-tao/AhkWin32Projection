#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WM_WRITER_STATISTICS_EX.ahk
#Include .\IWMWriterAdvanced2.ahk

/**
 * The IWMWriterAdvanced3 interface provides additional functionality for the writer object.IWMWriterAdvanced3 exists for every instance of the writer object. To obtain a pointer to this interface, call QueryInterface on the writer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriteradvanced3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterAdvanced3 extends IWMWriterAdvanced2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterAdvanced3
     * @type {Guid}
     */
    static IID => Guid("{2cd6492d-7c37-4e76-9d3b-59261183a22e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatisticsEx", "SetNonBlocking"]

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {WM_WRITER_STATISTICS_EX} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced3-getstatisticsex
     */
    GetStatisticsEx(wStreamNum) {
        pStats := WM_WRITER_STATISTICS_EX()
        result := ComCall(16, this, "ushort", wStreamNum, "ptr", pStats, "HRESULT")
        return pStats
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced3-setnonblocking
     */
    SetNonBlocking() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
