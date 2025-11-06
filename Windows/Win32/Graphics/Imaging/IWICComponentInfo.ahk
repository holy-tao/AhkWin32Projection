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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getcomponenttype
     */
    GetComponentType() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getclsid
     */
    GetCLSID() {
        pclsid := Guid()
        result := ComCall(4, this, "ptr", pclsid, "HRESULT")
        return pclsid
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getsigningstatus
     */
    GetSigningStatus() {
        result := ComCall(5, this, "uint*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @param {Integer} cchAuthor 
     * @param {PWSTR} wzAuthor 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getauthor
     */
    GetAuthor(cchAuthor, wzAuthor) {
        wzAuthor := wzAuthor is String ? StrPtr(wzAuthor) : wzAuthor

        result := ComCall(6, this, "uint", cchAuthor, "ptr", wzAuthor, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getvendorguid
     */
    GetVendorGUID() {
        pguidVendor := Guid()
        result := ComCall(7, this, "ptr", pguidVendor, "HRESULT")
        return pguidVendor
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Integer} cchVersion 
     * @param {PWSTR} wzVersion 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(cchVersion, wzVersion) {
        wzVersion := wzVersion is String ? StrPtr(wzVersion) : wzVersion

        result := ComCall(8, this, "uint", cchVersion, "ptr", wzVersion, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchSpecVersion 
     * @param {PWSTR} wzSpecVersion 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getspecversion
     */
    GetSpecVersion(cchSpecVersion, wzSpecVersion) {
        wzSpecVersion := wzSpecVersion is String ? StrPtr(wzSpecVersion) : wzSpecVersion

        result := ComCall(9, this, "uint", cchSpecVersion, "ptr", wzSpecVersion, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchFriendlyName 
     * @param {PWSTR} wzFriendlyName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getfriendlyname
     */
    GetFriendlyName(cchFriendlyName, wzFriendlyName) {
        wzFriendlyName := wzFriendlyName is String ? StrPtr(wzFriendlyName) : wzFriendlyName

        result := ComCall(10, this, "uint", cchFriendlyName, "ptr", wzFriendlyName, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }
}
