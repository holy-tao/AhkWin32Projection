#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\CertificateExtension.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ISubjectAlternativeNameInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISubjectAlternativeNameInfo2
     * @type {Guid}
     */
    static IID => Guid("{437a78c6-1c51-41ea-b34a-3d654398a370}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EmailNames", "get_IPAddresses", "get_Urls", "get_DnsNames", "get_DistinguishedNames", "get_PrincipalNames", "get_Extension"]

    /**
     * @type {IVector<HSTRING>} 
     */
    EmailNames {
        get => this.get_EmailNames()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    IPAddresses {
        get => this.get_IPAddresses()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    Urls {
        get => this.get_Urls()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    DnsNames {
        get => this.get_DnsNames()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    DistinguishedNames {
        get => this.get_DistinguishedNames()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    PrincipalNames {
        get => this.get_PrincipalNames()
    }

    /**
     * @type {CertificateExtension} 
     */
    Extension {
        get => this.get_Extension()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_EmailNames() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_IPAddresses() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Urls() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DnsNames() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DistinguishedNames() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_PrincipalNames() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {CertificateExtension} 
     */
    get_Extension() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CertificateExtension(value)
    }
}
