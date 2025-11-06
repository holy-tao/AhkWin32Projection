#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getrequestproperty
     */
    GetRequestProperty(strPropertyName, PropertyType) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        pvarPropertyValue := VARIANT()
        result := ComCall(8, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getrequestattribute
     */
    GetRequestAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        pstrAttributeValue := BSTR()
        result := ComCall(9, this, "ptr", strAttributeName, "ptr", pstrAttributeValue, "HRESULT")
        return pstrAttributeValue
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {Integer} PropertyType 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getcertificateproperty
     */
    GetCertificateProperty(strPropertyName, PropertyType) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        pvarPropertyValue := VARIANT()
        result := ComCall(10, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getcertificateextension
     */
    GetCertificateExtension(strExtensionName, Type) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        pvarValue := VARIANT()
        result := ComCall(12, this, "ptr", strExtensionName, "int", Type, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-getcertificateextensionflags
     */
    GetCertificateExtensionFlags() {
        result := ComCall(13, this, "int*", &pExtFlags := 0, "HRESULT")
        return pExtFlags
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateextensions
     */
    EnumerateExtensions() {
        pstrExtensionName := BSTR()
        result := ComCall(16, this, "ptr", pstrExtensionName, "HRESULT")
        return pstrExtensionName
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateattributes
     */
    EnumerateAttributes() {
        pstrAttributeName := BSTR()
        result := ComCall(19, this, "ptr", pstrAttributeName, "HRESULT")
        return pstrAttributeName
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
