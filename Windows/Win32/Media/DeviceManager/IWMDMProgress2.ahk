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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["End2"]

    /**
     * 
     * @param {HRESULT} hrCompletionCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress2-end2
     */
    End2(hrCompletionCode) {
        result := ComCall(6, this, "int", hrCompletionCode, "HRESULT")
        return result
    }
}
