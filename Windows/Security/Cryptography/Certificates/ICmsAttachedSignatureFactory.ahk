#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CmsAttachedSignature.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICmsAttachedSignatureFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICmsAttachedSignatureFactory
     * @type {Guid}
     */
    static IID => Guid("{d0c8fc15-f757-4c64-a362-52cc1c77cffb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCmsAttachedSignature"]

    /**
     * 
     * @param {IBuffer} inputBlob 
     * @returns {CmsAttachedSignature} 
     */
    CreateCmsAttachedSignature(inputBlob) {
        result := ComCall(6, this, "ptr", inputBlob, "ptr*", &cmsSignedData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CmsAttachedSignature(cmsSignedData)
    }
}
