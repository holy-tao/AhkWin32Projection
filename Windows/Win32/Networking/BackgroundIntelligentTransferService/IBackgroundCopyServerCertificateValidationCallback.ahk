#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Server certificates are sent when an HTTPS connection is opened. Use this method to implement a callback to be called to validate those server certificates.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bits10_3/nn-bits10_3-ibackgroundcopyservercertificatevalidationcallback
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyServerCertificateValidationCallback extends IUnknown{
    /**
     * The interface identifier for IBackgroundCopyServerCertificateValidationCallback
     * @type {Guid}
     */
    static IID => Guid("{4cec0d02-def7-4158-813a-c32a46945ff7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IBackgroundCopyJob>} job 
     * @param {Pointer<IBackgroundCopyFile>} file 
     * @param {Integer} certLength 
     * @param {Pointer<Byte>} certData 
     * @param {Integer} certEncodingType 
     * @param {Integer} certStoreLength 
     * @param {Pointer<Byte>} certStoreData 
     * @returns {HRESULT} 
     */
    ValidateServerCertificate(job, file, certLength, certData, certEncodingType, certStoreLength, certStoreData) {
        result := ComCall(3, this, "ptr", job, "ptr", file, "uint", certLength, "char*", certData, "uint", certEncodingType, "uint", certStoreLength, "char*", certStoreData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
