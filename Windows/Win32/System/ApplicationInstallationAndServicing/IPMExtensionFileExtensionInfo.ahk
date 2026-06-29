#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PM_LOGO_SIZE.ahk" { PM_LOGO_SIZE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMExtensionFileExtensionInfo extends IUnknown {
    /**
     * The interface identifier for IPMExtensionFileExtensionInfo
     * @type {Guid}
     */
    static IID := Guid("{6b87cb6c-0b88-4989-a4ec-033714f710d4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMExtensionFileExtensionInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Name           : IntPtr
        get_DisplayName    : IntPtr
        get_Logo           : IntPtr
        get_ContentType    : IntPtr
        get_FileType       : IntPtr
        get_InvocationInfo : IntPtr
        get_AllFileTypes   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMExtensionFileExtensionInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    Name {
        get => this.get_Name()
    }

    /**
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_Name(pName) {
        result := ComCall(3, this, BSTR.Ptr, pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(pDisplayName) {
        result := ComCall(4, this, BSTR.Ptr, pDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PM_LOGO_SIZE} LogoSize 
     * @param {Pointer<BSTR>} pLogo 
     * @returns {HRESULT} 
     */
    get_Logo(LogoSize, pLogo) {
        result := ComCall(5, this, PM_LOGO_SIZE, LogoSize, BSTR.Ptr, pLogo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} FileType 
     * @param {Pointer<BSTR>} pContentType 
     * @returns {HRESULT} 
     */
    get_ContentType(FileType, pContentType) {
        FileType := FileType is String ? BSTR.Alloc(FileType).Value : FileType

        result := ComCall(6, this, BSTR, FileType, BSTR.Ptr, pContentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ContentType 
     * @param {Pointer<BSTR>} pFileType 
     * @returns {HRESULT} 
     */
    get_FileType(ContentType, pFileType) {
        ContentType := ContentType is String ? BSTR.Alloc(ContentType).Value : ContentType

        result := ComCall(7, this, BSTR, ContentType, BSTR.Ptr, pFileType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(8, this, BSTR.Ptr, pImageUrn, BSTR.Ptr, pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbTypes 
     * @param {Pointer<Pointer<BSTR>>} ppTypes 
     * @returns {HRESULT} 
     */
    get_AllFileTypes(pcbTypes, ppTypes) {
        pcbTypesMarshal := pcbTypes is VarRef ? "uint*" : "ptr"
        ppTypesMarshal := ppTypes is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pcbTypesMarshal, pcbTypes, ppTypesMarshal, ppTypes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMExtensionFileExtensionInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.get_Logo := CallbackCreate(GetMethod(implObj, "get_Logo"), flags, 3)
        this.vtbl.get_ContentType := CallbackCreate(GetMethod(implObj, "get_ContentType"), flags, 3)
        this.vtbl.get_FileType := CallbackCreate(GetMethod(implObj, "get_FileType"), flags, 3)
        this.vtbl.get_InvocationInfo := CallbackCreate(GetMethod(implObj, "get_InvocationInfo"), flags, 3)
        this.vtbl.get_AllFileTypes := CallbackCreate(GetMethod(implObj, "get_AllFileTypes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.get_Logo)
        CallbackFree(this.vtbl.get_ContentType)
        CallbackFree(this.vtbl.get_FileType)
        CallbackFree(this.vtbl.get_InvocationInfo)
        CallbackFree(this.vtbl.get_AllFileTypes)
    }
}
