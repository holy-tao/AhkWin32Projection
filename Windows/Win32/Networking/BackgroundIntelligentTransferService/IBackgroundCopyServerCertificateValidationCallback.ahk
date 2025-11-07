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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ValidateServerCertificate"]

    /**
     * 
     * @param {IBackgroundCopyJob} job 
     * @param {IBackgroundCopyFile} file 
     * @param {Integer} certLength 
     * @param {Pointer<Integer>} certData 
     * @param {Integer} certEncodingType 
     * @param {Integer} certStoreLength 
     * @param {Pointer<Integer>} certStoreData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits10_3/nf-bits10_3-ibackgroundcopyservercertificatevalidationcallback-validateservercertificate
     */
    ValidateServerCertificate(job, file, certLength, certData, certEncodingType, certStoreLength, certStoreData) {
        certDataMarshal := certData is VarRef ? "char*" : "ptr"
        certStoreDataMarshal := certStoreData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", job, "ptr", file, "uint", certLength, certDataMarshal, certData, "uint", certEncodingType, "uint", certStoreLength, certStoreDataMarshal, certStoreData, "HRESULT")
        return result
    }
}
