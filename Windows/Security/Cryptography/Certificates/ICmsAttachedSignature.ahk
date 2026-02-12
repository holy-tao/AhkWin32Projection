#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\Certificate.ahk
#Include .\CmsSignerInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICmsAttachedSignature extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICmsAttachedSignature
     * @type {Guid}
     */
    static IID => Guid("{61899d9d-3757-4ecb-bddc-0ca357d7a936}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Certificates", "get_Content", "get_Signers", "VerifySignature"]

    /**
     * @type {IVectorView<Certificate>} 
     */
    Certificates {
        get => this.get_Certificates()
    }

    /**
     */
    Content {
        get => this.get_Content()
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
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_Content(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<CmsSignerInfo>} 
     */
    get_Signers() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(CmsSignerInfo, value)
    }

    /**
     * Verifies that a message signed by using the MakeSignature function was received in the correct sequence and has not been modified.
     * @remarks
     * <div class="alert"><b>Warning</b>  <p class="note">The <b>VerifySignature</b> function will fail if the message was signed using the <a href="https://docs.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha512">RsaSignPssSha512</a> algorithm on a different version of Windows. For example, a message that was signed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function on Windows 8 will cause the <b>VerifySignature</b> function on Windows 8.1 to fail.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sspi/nf-sspi-verifysignature
     */
    VerifySignature() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
