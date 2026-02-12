#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICmsDetachedSignatureStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICmsDetachedSignatureStatics
     * @type {Guid}
     */
    static IID => Guid("{3d114cfd-bf9b-4682-9be6-91f57c053808}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateSignatureAsync"]

    /**
     * 
     * @param {IInputStream} data 
     * @param {IIterable<CmsSignerInfo>} signers 
     * @param {IIterable<Certificate>} certificates 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    GenerateSignatureAsync(data, signers, certificates) {
        result := ComCall(6, this, "ptr", data, "ptr", signers, "ptr", certificates, "ptr*", &outputBlob := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, outputBlob)
    }
}
