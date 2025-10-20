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
     * 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} dwBytesToWrite 
     * @param {Pointer<UInt32>} pdwNumberOfBytesWritten 
     * @returns {HRESULT} 
     */
    Write(pBuffer, dwBytesToWrite, pdwNumberOfBytesWritten) {
        result := ComCall(3, this, "char*", pBuffer, "uint", dwBytesToWrite, "uint*", pdwNumberOfBytesWritten, "int")
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

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
