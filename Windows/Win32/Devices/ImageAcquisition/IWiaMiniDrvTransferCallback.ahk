#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaMiniDrvTransferCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaMiniDrvTransferCallback
     * @type {Guid}
     */
    static IID => Guid("{a9d2ee89-2ce5-4ff0-8adb-c961d1d774ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextStream", "SendMessage"]

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrItemName 
     * @param {BSTR} bstrFullItemName 
     * @returns {IStream} 
     */
    GetNextStream(lFlags, bstrItemName, bstrFullItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(3, this, "int", lFlags, "ptr", bstrItemName, "ptr", bstrFullItemName, "ptr*", &ppIStream := 0, "HRESULT")
        return IStream(ppIStream)
    }

    /**
     * Sends the specified message to a window or windows. The SendMessage function calls the window procedure for the specified window and does not return until the window procedure has processed the message.
     * @param {Integer} lFlags 
     * @param {Pointer<WiaTransferParams>} pWiaTransferParams 
     * @returns {HRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-sendmessage
     */
    SendMessage(lFlags, pWiaTransferParams) {
        result := ComCall(4, this, "int", lFlags, "ptr", pWiaTransferParams, "HRESULT")
        return result
    }
}
