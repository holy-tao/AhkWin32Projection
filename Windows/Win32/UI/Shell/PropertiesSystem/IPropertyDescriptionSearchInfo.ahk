#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PROPDESC_SEARCHINFO_FLAGS.ahk" { PROPDESC_SEARCHINFO_FLAGS }
#Import ".\IPropertyDescription.ahk" { IPropertyDescription }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROPDESC_COLUMNINDEX_TYPE.ahk" { PROPDESC_COLUMNINDEX_TYPE }

/**
 * Exposes search-related information for a property.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertydescriptionsearchinfo
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyDescriptionSearchInfo extends IPropertyDescription {
    /**
     * The interface identifier for IPropertyDescriptionSearchInfo
     * @type {Guid}
     */
    static IID := Guid("{078f91bd-29a2-440f-924e-46a291524520}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyDescriptionSearchInfo interfaces
    */
    struct Vtbl extends IPropertyDescription.Vtbl {
        GetSearchInfoFlags  : IntPtr
        GetColumnIndexType  : IntPtr
        GetProjectionString : IntPtr
        GetMaxSize          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyDescriptionSearchInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the PROPDESC_SEARCHINFO_FLAGS associated with the property.
     * @returns {PROPDESC_SEARCHINFO_FLAGS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_searchinfo_flags">PROPDESC_SEARCHINFO_FLAGS</a>*</b>
     * 
     * When this method returns successfully, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_searchinfo_flags">PROPDESC_SEARCHINFO_FLAGS</a> associated with the property.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionsearchinfo-getsearchinfoflags
     */
    GetSearchInfoFlags() {
        result := ComCall(24, this, "int*", &ppdsiFlags := 0, "HRESULT")
        return ppdsiFlags
    }

    /**
     * Determines the how the current property is indexed.
     * @returns {PROPDESC_COLUMNINDEX_TYPE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_columnindex_type">PROPDESC_COLUMNINDEX_TYPE</a>*</b>
     * 
     * When this method returns successfully, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_columnindex_type">PROPDESC_COLUMNINDEX_TYPE</a> constant. This constant describes whether the property is indexed and if so, if it is indexed in memory or on disk.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionsearchinfo-getcolumnindextype
     */
    GetColumnIndexType() {
        result := ComCall(25, this, "int*", &ppdciType := 0, "HRESULT")
        return ppdciType
    }

    /**
     * Returns a pointer to a string containing the canonical name of the item.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns successfully, contains a pointer to a string containing the canonical name of the item.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionsearchinfo-getprojectionstring
     */
    GetProjectionString() {
        result := ComCall(26, this, PWSTR.Ptr, &ppszProjection := 0, "HRESULT")
        return ppszProjection
    }

    /**
     * Gets the maximum size value from the property schema's searchInfo element.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the value of the maxSize attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-searchinfo">searchInfo</a> element. The default is:
     * 
     *                     
     * 
     * <ul>
     * <li><b>Windows Vista</b>: 128 bytes</li>
     * <li><b>Windows 7 and later</b>: 512 bytes</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionsearchinfo-getmaxsize
     */
    GetMaxSize() {
        result := ComCall(27, this, "uint*", &pcbMaxSize := 0, "HRESULT")
        return pcbMaxSize
    }

    Query(iid) {
        if (IPropertyDescriptionSearchInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSearchInfoFlags := CallbackCreate(GetMethod(implObj, "GetSearchInfoFlags"), flags, 2)
        this.vtbl.GetColumnIndexType := CallbackCreate(GetMethod(implObj, "GetColumnIndexType"), flags, 2)
        this.vtbl.GetProjectionString := CallbackCreate(GetMethod(implObj, "GetProjectionString"), flags, 2)
        this.vtbl.GetMaxSize := CallbackCreate(GetMethod(implObj, "GetMaxSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSearchInfoFlags)
        CallbackFree(this.vtbl.GetColumnIndexType)
        CallbackFree(this.vtbl.GetProjectionString)
        CallbackFree(this.vtbl.GetMaxSize)
    }
}
