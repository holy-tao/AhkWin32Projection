#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAttachment.ahk

/**
 * Enables applications to send attachment data in a message using a MIME container.
 * @see https://docs.microsoft.com/windows/win32/api//wsdattachment/nn-wsdattachment-iwsdoutboundattachment
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDOutboundAttachment extends IWSDAttachment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDOutboundAttachment
     * @type {Guid}
     */
    static IID => Guid("{aa302f8d-5a22-4ba5-b392-aa8486f4c15d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write", "Close", "Abort"]

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} dwBytesToWrite 
     * @param {Pointer<Integer>} pdwNumberOfBytesWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write
     */
    Write(pBuffer, dwBytesToWrite, pdwNumberOfBytesWritten) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pdwNumberOfBytesWrittenMarshal := pdwNumberOfBytesWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pBufferMarshal, pBuffer, "uint", dwBytesToWrite, pdwNumberOfBytesWrittenMarshal, pdwNumberOfBytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
