#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\Certificate.ahk
#Include .\CmsSignerInfo.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICmsDetachedSignature extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICmsDetachedSignature
     * @type {Guid}
     */
    static IID => Guid("{0f1ef154-f65e-4536-8339-5944081db2ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Certificates", "get_Signers", "VerifySignatureAsync"]

    /**
     * @type {IVectorView<Certificate>} 
     */
    Certificates {
        get => this.get_Certificates()
    }

    /**
     * @type {IVectorView<CmsSignerInfo>} 
     */
    Signers {
        get => this.get_Signers()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_Certificates() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Certificate, value)
    }

    /**
     * 
     * @returns {IVectorView<CmsSignerInfo>} 
     */
    get_Signers() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(CmsSignerInfo, value)
    }

    /**
     * 
     * @param {IInputStream} data 
     * @returns {IAsyncOperation<Integer>} 
     */
    VerifySignatureAsync(data) {
        result := ComCall(8, this, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
