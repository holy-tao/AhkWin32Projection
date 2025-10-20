#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide component information.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwiccomponentinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICComponentInfo extends IUnknown{
    /**
     * The interface identifier for IWICComponentInfo
     * @type {Guid}
     */
    static IID => Guid("{23bc3f0a-698b-4357-886b-f24d50671334}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetComponentType(pType) {
        result := ComCall(3, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     */
    GetCLSID(pclsid) {
        result := ComCall(4, this, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pStatus 
     * @returns {HRESULT} 
     */
    GetSigningStatus(pStatus) {
        result := ComCall(5, this, "uint*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchAuthor 
     * @param {PWSTR} wzAuthor 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetAuthor(cchAuthor, wzAuthor, pcchActual) {
        wzAuthor := wzAuthor is String ? StrPtr(wzAuthor) : wzAuthor

        result := ComCall(6, this, "uint", cchAuthor, "ptr", wzAuthor, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidVendor 
     * @returns {HRESULT} 
     */
    GetVendorGUID(pguidVendor) {
        result := ComCall(7, this, "ptr", pguidVendor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Integer} cchVersion 
     * @param {PWSTR} wzVersion 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(cchVersion, wzVersion, pcchActual) {
        wzVersion := wzVersion is String ? StrPtr(wzVersion) : wzVersion

        result := ComCall(8, this, "uint", cchVersion, "ptr", wzVersion, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchSpecVersion 
     * @param {PWSTR} wzSpecVersion 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetSpecVersion(cchSpecVersion, wzSpecVersion, pcchActual) {
        wzSpecVersion := wzSpecVersion is String ? StrPtr(wzSpecVersion) : wzSpecVersion

        result := ComCall(9, this, "uint", cchSpecVersion, "ptr", wzSpecVersion, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchFriendlyName 
     * @param {PWSTR} wzFriendlyName 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetFriendlyName(cchFriendlyName, wzFriendlyName, pcchActual) {
        wzFriendlyName := wzFriendlyName is String ? StrPtr(wzFriendlyName) : wzFriendlyName

        result := ComCall(10, this, "uint", cchFriendlyName, "ptr", wzFriendlyName, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
