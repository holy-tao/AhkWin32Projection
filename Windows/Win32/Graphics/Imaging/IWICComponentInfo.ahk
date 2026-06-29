#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WICComponentType.ahk" { WICComponentType }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide component information.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwiccomponentinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICComponentInfo extends IUnknown {
    /**
     * The interface identifier for IWICComponentInfo
     * @type {Guid}
     */
    static IID := Guid("{23bc3f0a-698b-4357-886b-f24d50671334}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICComponentInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetComponentType : IntPtr
        GetCLSID         : IntPtr
        GetSigningStatus : IntPtr
        GetAuthor        : IntPtr
        GetVendorGUID    : IntPtr
        GetVersion       : IntPtr
        GetSpecVersion   : IntPtr
        GetFriendlyName  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICComponentInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the component's WICComponentType.
     * @returns {WICComponentType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponenttype">WICComponentType</a>*</b>
     * 
     * A pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponenttype">WICComponentType</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getcomponenttype
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getclsid
     */
    GetCLSID() {
        pclsid := Guid()
        result := ComCall(4, this, Guid.Ptr, pclsid, "HRESULT")
        return pclsid
    }

    /**
     * Retrieves the signing status of the component.
     * @remarks
     * Signing is unused by WIC. Therefore, all components WICComponentSigned.
     * 
     * This function can be used to determine whether a component has no binary component or has been added to the disabled components list in the registry.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponentsigning">WICComponentSigning</a> status of the component.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getsigningstatus
     */
    GetSigningStatus() {
        result := ComCall(5, this, "uint*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Retrieves the name of component's author.
     * @remarks
     * If <i>cchAuthor</i> is 0 and <i>wzAuthor</i> is <b>NULL</b>, the required buffer size is returned in <i>pccchActual</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getauthor
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getvendorguid
     */
    GetVendorGUID() {
        pguidVendor := Guid()
        result := ComCall(7, this, Guid.Ptr, pguidVendor, "HRESULT")
        return pguidVendor
    }

    /**
     * Retrieves the component's version.
     * @remarks
     * All built-in components return "1.0.0.0", except for pixel formats, which do not have a version.
     * 
     * If <i>cchAuthor</i> is 0 and <i>wzAuthor</i> is <b>NULL</b>, the required buffer size is returned in <i>pccchActual</i>.
     * @param {Integer} cchVersion Type: <b>UINT</b>
     * 
     * The size of the <i>wzVersion</i> buffer.
     * @param {PWSTR} wzVersion Type: <b>WCHAR*</b>
     * 
     * A pointer that receives a culture invariant string of the component's version.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the actual length of the component's version. The version is optional; if a value is not specified by the component, the length returned is 0.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getversion
     */
    GetVersion(cchVersion, wzVersion) {
        wzVersion := wzVersion is String ? StrPtr(wzVersion) : wzVersion

        result := ComCall(8, this, "uint", cchVersion, "ptr", wzVersion, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the component's specification version.
     * @remarks
     * All built-in components return "1.0.0.0", except for pixel formats, which do not have a spec version.
     * 
     * If <i>cchAuthor</i> is 0 and <i>wzAuthor</i> is <b>NULL</b>, the required buffer size is returned in <i>pccchActual</i>.
     * @param {Integer} cchSpecVersion Type: <b>UINT</b>
     * 
     * The size of the <i>wzSpecVersion</i> buffer.
     * @param {PWSTR} wzSpecVersion Type: <b>WCHAR*</b>
     * 
     * When this method returns, contain a culture invariant string of the component's specification version. The version form is NN.NN.NN.NN.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the actual length of the component's specification version. The specification version is optional; if a value is not specified by the component, the length returned is 0.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getspecversion
     */
    GetSpecVersion(cchSpecVersion, wzSpecVersion) {
        wzSpecVersion := wzSpecVersion is String ? StrPtr(wzSpecVersion) : wzSpecVersion

        result := ComCall(9, this, "uint", cchSpecVersion, "ptr", wzSpecVersion, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the component's friendly name, which is a human-readable display name for the component.
     * @remarks
     * If <i>cchFriendlyName</i> is 0 and <i>wzFriendlyName</i> is <b>NULL</b>, the required buffer size is returned in <i>pccchActual</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccomponentinfo-getfriendlyname
     */
    GetFriendlyName(cchFriendlyName, wzFriendlyName) {
        wzFriendlyName := wzFriendlyName is String ? StrPtr(wzFriendlyName) : wzFriendlyName

        result := ComCall(10, this, "uint", cchFriendlyName, "ptr", wzFriendlyName, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    Query(iid) {
        if (IWICComponentInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetComponentType := CallbackCreate(GetMethod(implObj, "GetComponentType"), flags, 2)
        this.vtbl.GetCLSID := CallbackCreate(GetMethod(implObj, "GetCLSID"), flags, 2)
        this.vtbl.GetSigningStatus := CallbackCreate(GetMethod(implObj, "GetSigningStatus"), flags, 2)
        this.vtbl.GetAuthor := CallbackCreate(GetMethod(implObj, "GetAuthor"), flags, 4)
        this.vtbl.GetVendorGUID := CallbackCreate(GetMethod(implObj, "GetVendorGUID"), flags, 2)
        this.vtbl.GetVersion := CallbackCreate(GetMethod(implObj, "GetVersion"), flags, 4)
        this.vtbl.GetSpecVersion := CallbackCreate(GetMethod(implObj, "GetSpecVersion"), flags, 4)
        this.vtbl.GetFriendlyName := CallbackCreate(GetMethod(implObj, "GetFriendlyName"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetComponentType)
        CallbackFree(this.vtbl.GetCLSID)
        CallbackFree(this.vtbl.GetSigningStatus)
        CallbackFree(this.vtbl.GetAuthor)
        CallbackFree(this.vtbl.GetVendorGUID)
        CallbackFree(this.vtbl.GetVersion)
        CallbackFree(this.vtbl.GetSpecVersion)
        CallbackFree(this.vtbl.GetFriendlyName)
    }
}
