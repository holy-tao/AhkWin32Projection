#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Allows the policy module to communicate with Certificate Services.
 * @see https://docs.microsoft.com/windows/win32/api//certif/nn-certif-icertserverpolicy
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertServerPolicy extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertServerPolicy
     * @type {Guid}
     */
    static IID => Guid("{aa000922-ffbe-11cf-8800-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContext", "GetRequestProperty", "GetRequestAttribute", "GetCertificateProperty", "SetCertificateProperty", "GetCertificateExtension", "GetCertificateExtensionFlags", "SetCertificateExtension", "EnumerateExtensionsSetup", "EnumerateExtensions", "EnumerateExtensionsClose", "EnumerateAttributesSetup", "EnumerateAttributes", "EnumerateAttributesClose"]

    /**
     * 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-setcontext
     */
    SetContext(Context) {
        result := ComCall(7, this, "int", Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {Integer} PropertyType 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getrequestproperty
     */
    GetRequestProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(8, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Pointer<BSTR>} pstrAttributeValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getrequestattribute
     */
    GetRequestAttribute(strAttributeName, pstrAttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(9, this, "ptr", strAttributeName, "ptr", pstrAttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {Integer} PropertyType 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getcertificateproperty
     */
    GetCertificateProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(10, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {Integer} PropertyType 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-setcertificateproperty
     */
    SetCertificateProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(11, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strExtensionName 
     * @param {Integer} Type 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getcertificateextension
     */
    GetCertificateExtension(strExtensionName, Type, pvarValue) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(12, this, "ptr", strExtensionName, "int", Type, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pExtFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getcertificateextensionflags
     */
    GetCertificateExtensionFlags(pExtFlags) {
        pExtFlagsMarshal := pExtFlags is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pExtFlagsMarshal, pExtFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strExtensionName 
     * @param {Integer} Type 
     * @param {Integer} ExtFlags 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-setcertificateextension
     */
    SetCertificateExtension(strExtensionName, Type, ExtFlags, pvarValue) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(14, this, "ptr", strExtensionName, "int", Type, "int", ExtFlags, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateextensionssetup
     */
    EnumerateExtensionsSetup(Flags) {
        result := ComCall(15, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrExtensionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateextensions
     */
    EnumerateExtensions(pstrExtensionName) {
        result := ComCall(16, this, "ptr", pstrExtensionName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateextensionsclose
     */
    EnumerateExtensionsClose() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateattributessetup
     */
    EnumerateAttributesSetup(Flags) {
        result := ComCall(18, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrAttributeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateattributes
     */
    EnumerateAttributes(pstrAttributeName) {
        result := ComCall(19, this, "ptr", pstrAttributeName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateattributesclose
     */
    EnumerateAttributesClose() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}
