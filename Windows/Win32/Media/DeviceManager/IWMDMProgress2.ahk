#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMProgress.ahk

/**
 * The optional, application-implemented IWMDMProgress2 interface extends the IWMDMProgress::End method by providing a status indicator.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmprogress2
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
     * The End2 method extends IWMDMProgress::End by providing a completion status indicator.
     * @remarks
     * <b>IWMDMProgress2</b> is a callback interface provided by the application to Windows Media Device Manager for a particular operation. <b>End2</b> is called when that operation is completed. The <i>hrCompletionCode</i> parameter is the completion status of the operation that was in progress. For example, an application can provide an <b>IWMDMProgress2</b> interface pointer to the <b>Insert2</b> method. When the file transfer done by <b>Insert2</b> is completed, <b>End2</b> is called on the <b>IWMDMProgress2</b> interface pointer with the completion status of the file transfer as the <i>hrCompletion</i> parameter.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmprogress3-end3">IWMDMProgress3::End3</a> provides more information, and should be implemented instead of this method.
     * @param {HRESULT} hrCompletionCode The return value of the operation that ended.
     * @returns {HRESULT} The return value from the method is ignored by Windows Media Device Manager.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress2-end2
     */
    End2(hrCompletionCode) {
        result := ComCall(6, this, "int", hrCompletionCode, "HRESULT")
        return result
    }
}
