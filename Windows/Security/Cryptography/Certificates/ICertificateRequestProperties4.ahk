#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\SubjectAlternativeNameInfo.ahk
#Include .\CertificateExtension.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateRequestProperties4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateRequestProperties4
     * @type {Guid}
     */
    static IID => Guid("{4e429ad2-1c61-4fea-b8fe-135fb19cdce4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SuppressedDefaults", "get_SubjectAlternativeName", "get_Extensions"]

    /**
     * @type {IVector<HSTRING>} 
     */
    SuppressedDefaults {
        get => this.get_SuppressedDefaults()
    }

    /**
     * @type {SubjectAlternativeNameInfo} 
     */
    SubjectAlternativeName {
        get => this.get_SubjectAlternativeName()
    }

    /**
     * @type {IVector<CertificateExtension>} 
     */
    Extensions {
        get => this.get_Extensions()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SuppressedDefaults() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {SubjectAlternativeNameInfo} 
     */
    get_SubjectAlternativeName() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SubjectAlternativeNameInfo(value)
    }

    /**
     * 
     * @returns {IVector<CertificateExtension>} 
     */
    get_Extensions() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(CertificateExtension, value)
    }
}
