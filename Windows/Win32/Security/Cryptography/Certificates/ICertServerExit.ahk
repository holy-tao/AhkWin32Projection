#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getrequestproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getrequestattribute
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
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getcertificateproperty
     */
    GetCertificateProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(10, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strExtensionName 
     * @param {Integer} Type 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getcertificateextension
     */
    GetCertificateExtension(strExtensionName, Type, pvarValue) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(11, this, "ptr", strExtensionName, "int", Type, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pExtFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-getcertificateextensionflags
     */
    GetCertificateExtensionFlags(pExtFlags) {
        pExtFlagsMarshal := pExtFlags is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pExtFlagsMarshal, pExtFlags, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pstrExtensionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateextensions
     */
    EnumerateExtensions(pstrExtensionName) {
        result := ComCall(14, this, "ptr", pstrExtensionName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pstrAttributeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateattributes
     */
    EnumerateAttributes(pstrAttributeName) {
        result := ComCall(17, this, "ptr", pstrAttributeName, "HRESULT")
        return result
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
