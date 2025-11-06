#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Exported by the server engine and is called by exit modules.
 * @see https://docs.microsoft.com/windows/win32/api//certif/nn-certif-icertserverexit
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertServerExit extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertServerExit
     * @type {Guid}
     */
    static IID => Guid("{4ba9eb90-732c-11d0-8816-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContext", "GetRequestProperty", "GetRequestAttribute", "GetCertificateProperty", "GetCertificateExtension", "GetCertificateExtensionFlags", "EnumerateExtensionsSetup", "EnumerateExtensions", "EnumerateExtensionsClose", "EnumerateAttributesSetup", "EnumerateAttributes", "EnumerateAttributesClose"]

    /**
     * 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-setcontext
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
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getrequestproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getrequestattribute
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
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getcertificateproperty
     */
    GetCertificateProperty(strPropertyName, PropertyType) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        pvarPropertyValue := VARIANT()
        result := ComCall(10, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }

    /**
     * 
     * @param {BSTR} strExtensionName 
     * @param {Integer} Type 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getcertificateextension
     */
    GetCertificateExtension(strExtensionName, Type) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        pvarValue := VARIANT()
        result := ComCall(11, this, "ptr", strExtensionName, "int", Type, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getcertificateextensionflags
     */
    GetCertificateExtensionFlags() {
        result := ComCall(12, this, "int*", &pExtFlags := 0, "HRESULT")
        return pExtFlags
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateextensionssetup
     */
    EnumerateExtensionsSetup(Flags) {
        result := ComCall(13, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateextensions
     */
    EnumerateExtensions() {
        pstrExtensionName := BSTR()
        result := ComCall(14, this, "ptr", pstrExtensionName, "HRESULT")
        return pstrExtensionName
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateextensionsclose
     */
    EnumerateExtensionsClose() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateattributessetup
     */
    EnumerateAttributesSetup(Flags) {
        result := ComCall(16, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateattributes
     */
    EnumerateAttributes() {
        pstrAttributeName := BSTR()
        result := ComCall(17, this, "ptr", pstrAttributeName, "HRESULT")
        return pstrAttributeName
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateattributesclose
     */
    EnumerateAttributesClose() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
