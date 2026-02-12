#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Certificate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateFactory
     * @type {Guid}
     */
    static IID => Guid("{17b4221c-4baf-44a2-9608-04fb62b16942}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCertificate"]

    /**
     * 
     * @param {IBuffer} certBlob 
     * @returns {Certificate} 
     */
    CreateCertificate(certBlob) {
        result := ComCall(6, this, "ptr", certBlob, "ptr*", &certificate_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(certificate_)
    }
}
