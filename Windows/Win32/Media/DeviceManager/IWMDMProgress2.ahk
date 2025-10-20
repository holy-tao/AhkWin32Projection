#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMProgress.ahk

/**
 * The optional, application-implemented IWMDMProgress2 interface extends the IWMDMProgress::End method by providing a status indicator.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmprogress2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMProgress2 extends IWMDMProgress{
    /**
     * The interface identifier for IWMDMProgress2
     * @type {Guid}
     */
    static IID => Guid("{3a43f550-b383-4e92-b04a-e6bbc660fefc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {HRESULT} hrCompletionCode 
     * @returns {HRESULT} 
     */
    End2(hrCompletionCode) {
        result := ComCall(6, this, "int", hrCompletionCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
