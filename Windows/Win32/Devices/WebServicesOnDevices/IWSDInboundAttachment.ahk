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
     * 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} dwBytesToRead 
     * @param {Pointer<UInt32>} pdwNumberOfBytesRead 
     * @returns {HRESULT} 
     */
    Read(pBuffer, dwBytesToRead, pdwNumberOfBytesRead) {
        result := ComCall(3, this, "char*", pBuffer, "uint", dwBytesToRead, "uint*", pdwNumberOfBytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
