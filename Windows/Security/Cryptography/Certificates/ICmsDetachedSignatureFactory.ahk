#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CmsDetachedSignature.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICmsDetachedSignatureFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICmsDetachedSignatureFactory
     * @type {Guid}
     */
    static IID => Guid("{c4ab3503-ae7f-4387-ad19-00f150e48ebb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCmsDetachedSignature"]

    /**
     * 
     * @param {IBuffer} inputBlob 
     * @returns {CmsDetachedSignature} 
     */
    CreateCmsDetachedSignature(inputBlob) {
        result := ComCall(6, this, "ptr", inputBlob, "ptr*", &cmsSignedData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CmsDetachedSignature(cmsSignedData)
    }
}
