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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetComponentType", "GetCLSID", "GetSigningStatus", "GetAuthor", "GetVendorGUID", "GetVersion", "GetSpecVersion", "GetFriendlyName"]

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getcomponenttype
     */
    GetComponentType(pType) {
        result := ComCall(3, this, "int*", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getclsid
     */
    GetCLSID(pclsid) {
        result := ComCall(4, this, "ptr", pclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getsigningstatus
     */
    GetSigningStatus(pStatus) {
        result := ComCall(5, this, "uint*", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchAuthor 
     * @param {PWSTR} wzAuthor 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getauthor
     */
    GetAuthor(cchAuthor, wzAuthor, pcchActual) {
        wzAuthor := wzAuthor is String ? StrPtr(wzAuthor) : wzAuthor

        result := ComCall(6, this, "uint", cchAuthor, "ptr", wzAuthor, "uint*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidVendor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getvendorguid
     */
    GetVendorGUID(pguidVendor) {
        result := ComCall(7, this, "ptr", pguidVendor, "HRESULT")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Integer} cchVersion 
     * @param {PWSTR} wzVersion 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(cchVersion, wzVersion, pcchActual) {
        wzVersion := wzVersion is String ? StrPtr(wzVersion) : wzVersion

        result := ComCall(8, this, "uint", cchVersion, "ptr", wzVersion, "uint*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchSpecVersion 
     * @param {PWSTR} wzSpecVersion 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getspecversion
     */
    GetSpecVersion(cchSpecVersion, wzSpecVersion, pcchActual) {
        wzSpecVersion := wzSpecVersion is String ? StrPtr(wzSpecVersion) : wzSpecVersion

        result := ComCall(9, this, "uint", cchSpecVersion, "ptr", wzSpecVersion, "uint*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchFriendlyName 
     * @param {PWSTR} wzFriendlyName 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getfriendlyname
     */
    GetFriendlyName(cchFriendlyName, wzFriendlyName, pcchActual) {
        wzFriendlyName := wzFriendlyName is String ? StrPtr(wzFriendlyName) : wzFriendlyName

        result := ComCall(10, this, "uint", cchFriendlyName, "ptr", wzFriendlyName, "uint*", pcchActual, "HRESULT")
        return result
    }
}
