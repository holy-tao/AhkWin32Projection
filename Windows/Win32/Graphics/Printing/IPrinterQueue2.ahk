#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrinterQueue.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterQueue2 extends IPrinterQueue{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterQueue2
     * @type {Guid}
     */
    static IID => Guid("{8cd444e8-c9bb-49b3-8e38-e03209416131}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendBidiSetRequestAsync", "GetPrinterQueueView"]

    /**
     * 
     * @param {BSTR} bstrBidiRequest 
     * @param {IPrinterBidiSetRequestCallback} pCallback 
     * @param {Pointer<IPrinterExtensionAsyncOperation>} ppAsyncOperation 
     * @returns {HRESULT} 
     */
    SendBidiSetRequestAsync(bstrBidiRequest, pCallback, ppAsyncOperation) {
        bstrBidiRequest := bstrBidiRequest is String ? BSTR.Alloc(bstrBidiRequest).Value : bstrBidiRequest

        result := ComCall(11, this, "ptr", bstrBidiRequest, "ptr", pCallback, "ptr*", ppAsyncOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulViewOffset 
     * @param {Integer} ulViewSize 
     * @param {Pointer<IPrinterQueueView>} ppJobView 
     * @returns {HRESULT} 
     */
    GetPrinterQueueView(ulViewOffset, ulViewSize, ppJobView) {
        result := ComCall(12, this, "uint", ulViewOffset, "uint", ulViewSize, "ptr*", ppJobView, "HRESULT")
        return result
    }
}
