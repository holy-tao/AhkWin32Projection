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
     * 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     */
    SetContext(Context) {
        result := ComCall(7, this, "int", Context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {Integer} PropertyType 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     */
    GetRequestProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(8, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Pointer<BSTR>} pstrAttributeValue 
     * @returns {HRESULT} 
     */
    GetRequestAttribute(strAttributeName, pstrAttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(9, this, "ptr", strAttributeName, "ptr", pstrAttributeValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {Integer} PropertyType 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     */
    GetCertificateProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(10, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {Integer} PropertyType 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     */
    SetCertificateProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(11, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strExtensionName 
     * @param {Integer} Type 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    GetCertificateExtension(strExtensionName, Type, pvarValue) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(12, this, "ptr", strExtensionName, "int", Type, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pExtFlags 
     * @returns {HRESULT} 
     */
    GetCertificateExtensionFlags(pExtFlags) {
        result := ComCall(13, this, "int*", pExtFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strExtensionName 
     * @param {Integer} Type 
     * @param {Integer} ExtFlags 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    SetCertificateExtension(strExtensionName, Type, ExtFlags, pvarValue) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(14, this, "ptr", strExtensionName, "int", Type, "int", ExtFlags, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    EnumerateExtensionsSetup(Flags) {
        result := ComCall(15, this, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrExtensionName 
     * @returns {HRESULT} 
     */
    EnumerateExtensions(pstrExtensionName) {
        result := ComCall(16, this, "ptr", pstrExtensionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnumerateExtensionsClose() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    EnumerateAttributesSetup(Flags) {
        result := ComCall(18, this, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrAttributeName 
     * @returns {HRESULT} 
     */
    EnumerateAttributes(pstrAttributeName) {
        result := ComCall(19, this, "ptr", pstrAttributeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnumerateAttributesClose() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
