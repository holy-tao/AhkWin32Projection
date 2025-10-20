#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJobHttpOptions2.ahk

/**
 * Use this interface to set HTTP customer headers to write-only, or to set a server certificate validation callback method that you've implemented.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bits10_3/nn-bits10_3-ibackgroundcopyjobhttpoptions3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJobHttpOptions3 extends IBackgroundCopyJobHttpOptions2{
    /**
     * The interface identifier for IBackgroundCopyJobHttpOptions3
     * @type {Guid}
     */
    static IID => Guid("{8a9263d3-fd4c-4eda-9b28-30132a4d4e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<IUnknown>} certValidationCallback 
     * @returns {HRESULT} 
     */
    SetServerCertificateValidationInterface(certValidationCallback) {
        result := ComCall(13, this, "ptr", certValidationCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MakeCustomHeadersWriteOnly() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
