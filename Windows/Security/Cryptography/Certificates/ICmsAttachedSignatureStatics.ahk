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
class ICmsAttachedSignatureStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICmsAttachedSignatureStatics
     * @type {Guid}
     */
    static IID => Guid("{87989c8e-b0ad-498d-a7f5-78b59bce4b36}")

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
     * @param {IBuffer} data 
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
