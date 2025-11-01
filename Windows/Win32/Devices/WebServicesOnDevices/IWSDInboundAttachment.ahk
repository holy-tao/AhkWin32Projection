#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAttachment.ahk

/**
 * Allows applications to read MIME-encoded attachment data from an incoming message.
 * @remarks
 * 
  * WSDAPI will provide an object implementing this interface when an attachment stream is received as part of a message.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdattachment/nn-wsdattachment-iwsdinboundattachment
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDInboundAttachment extends IWSDAttachment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDInboundAttachment
     * @type {Guid}
     */
    static IID => Guid("{5bd6ca65-233c-4fb8-9f7a-2641619655c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Close"]

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} dwBytesToRead 
     * @param {Pointer<Integer>} pdwNumberOfBytesRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdinboundattachment-read
     */
    Read(pBuffer, dwBytesToRead, pdwNumberOfBytesRead) {
        result := ComCall(3, this, "char*", pBuffer, "uint", dwBytesToRead, "uint*", pdwNumberOfBytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdinboundattachment-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
