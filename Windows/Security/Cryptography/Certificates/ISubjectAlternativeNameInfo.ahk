#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ISubjectAlternativeNameInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISubjectAlternativeNameInfo
     * @type {Guid}
     */
    static IID => Guid("{582859f1-569d-4c20-be7b-4e1c9a0bc52b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EmailName", "get_IPAddress", "get_Url", "get_DnsName", "get_DistinguishedName", "get_PrincipalName"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    EmailName {
        get => this.get_EmailName()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    IPAddress {
        get => this.get_IPAddress()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Url {
        get => this.get_Url()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    DnsName {
        get => this.get_DnsName()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    DistinguishedName {
        get => this.get_DistinguishedName()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    PrincipalName {
        get => this.get_PrincipalName()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_EmailName() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_IPAddress() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Url() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DnsName() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DistinguishedName() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PrincipalName() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
