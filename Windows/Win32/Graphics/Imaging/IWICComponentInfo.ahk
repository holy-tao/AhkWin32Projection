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
     * Retrieves the component's WICComponentType.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponenttype">WICComponentType</a>*</b>
     * 
     * A pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponenttype">WICComponentType</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccomponentinfo-getcomponenttype
     */
    GetComponentType() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves the component's class identifier (CLSID)
     * @returns {Guid} Type: <b>CLSID*</b>
     * 
     * A pointer that receives the component's CLSID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccomponentinfo-getclsid
     */
    GetCLSID() {
        pclsid := Guid()
        result := ComCall(4, this, "ptr", pclsid, "HRESULT")
        return pclsid
    }

    /**
     * Retrieves the signing status of the component.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponentsigning">WICComponentSigning</a> status of the component.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccomponentinfo-getsigningstatus
     */
    GetSigningStatus() {
        result := ComCall(5, this, "uint*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Retrieves the name of component's author.
     * @param {Integer} cchAuthor Type: <b>UINT</b>
     * 
     * The size of the <i>wzAuthor</i> buffer.
     * @param {PWSTR} wzAuthor Type: <b>WCHAR*</b>
     * 
     * A pointer that receives the name of the component's author.
     *                The locale of the string depends on the value that the codec wrote to the registry at install time. For built-in components, these strings are always in English.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the actual length of the component's authors name. The author name is optional; if an author name is not specified by the component, the length returned is 0.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccomponentinfo-getauthor
     */
    GetAuthor(cchAuthor, wzAuthor) {
        wzAuthor := wzAuthor is String ? StrPtr(wzAuthor) : wzAuthor

        result := ComCall(6, this, "uint", cchAuthor, "ptr", wzAuthor, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the vendor GUID.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer that receives the component's vendor GUID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccomponentinfo-getvendorguid
     */
    GetVendorGUID() {
        pguidVendor := Guid()
        result := ComCall(7, this, "ptr", pguidVendor, "HRESULT")
        return pguidVendor
    }

    /**
     * Retrieves the component's version.
     * @param {Integer} cchVersion Type: <b>UINT</b>
     * 
     * The size of the <i>wzVersion</i> buffer.
     * @param {PWSTR} wzVersion Type: <b>WCHAR*</b>
     * 
     * A pointer that receives a culture invariant string of the component's version.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the actual length of the component's version. The version is optional; if a value is not specified by the component, the length returned is 0.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccomponentinfo-getversion
     */
    GetVersion(cchVersion, wzVersion) {
        wzVersion := wzVersion is String ? StrPtr(wzVersion) : wzVersion

        result := ComCall(8, this, "uint", cchVersion, "ptr", wzVersion, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the component's specification version.
     * @param {Integer} cchSpecVersion Type: <b>UINT</b>
     * 
     * The size of the <i>wzSpecVersion</i> buffer.
     * @param {PWSTR} wzSpecVersion Type: <b>WCHAR*</b>
     * 
     * When this method returns, contain a culture invarient string of the component's specification version. The version form is NN.NN.NN.NN.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the actual length of the component's specification version. The specification version is optional; if a value is not specified by the component, the length returned is 0.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccomponentinfo-getspecversion
     */
    GetSpecVersion(cchSpecVersion, wzSpecVersion) {
        wzSpecVersion := wzSpecVersion is String ? StrPtr(wzSpecVersion) : wzSpecVersion

        result := ComCall(9, this, "uint", cchSpecVersion, "ptr", wzSpecVersion, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the component's friendly name, which is a human-readable display name for the component.
     * @param {Integer} cchFriendlyName Type: <b>UINT</b>
     * 
     * The size of the <i>wzFriendlyName</i> buffer.
     * @param {PWSTR} wzFriendlyName Type: <b>WCHAR*</b>
     * 
     * A pointer that receives the friendly name of the component.
     *                The locale of the string depends on the value that the codec wrote to the registry at install time. For built-in components, these strings are always in English.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the actual length of the component's friendly name.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccomponentinfo-getfriendlyname
     */
    GetFriendlyName(cchFriendlyName, wzFriendlyName) {
        wzFriendlyName := wzFriendlyName is String ? StrPtr(wzFriendlyName) : wzFriendlyName

        result := ComCall(10, this, "uint", cchFriendlyName, "ptr", wzFriendlyName, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }
}
