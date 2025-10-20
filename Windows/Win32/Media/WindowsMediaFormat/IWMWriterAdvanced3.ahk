#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterAdvanced2.ahk

/**
 * The IWMWriterAdvanced3 interface provides additional functionality for the writer object.IWMWriterAdvanced3 exists for every instance of the writer object. To obtain a pointer to this interface, call QueryInterface on the writer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriteradvanced3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterAdvanced3 extends IWMWriterAdvanced2{
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
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<WM_WRITER_STATISTICS_EX>} pStats 
     * @returns {HRESULT} 
     */
    GetStatisticsEx(wStreamNum, pStats) {
        result := ComCall(16, this, "ushort", wStreamNum, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetNonBlocking() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
