#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that extract information from a collection of property descriptions presented as a list.
 * @remarks
 * Ordered lists of properties are used to select which properties are shown in various UI locations such as the details pane or an infotip.  The IPropertyDescriptionList interface provides access to the individual properties in such a list.  
 * 
 * 
 * 
 * To get an instance of the subsystem object that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>, obtain an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem2">IShellItem2</a> interface and call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertydescriptionlist">IShellItem2::GetPropertyDescriptionList</a>, or obtain the list in string form and call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a>. 
 * 
 * To obtain a property description list in string form, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getstring">IShellItem2::GetString</a> with one of the PKEY_PropList keys.  For example, <c>PKEY_PropList_InfoTip</c> (<a href="https://docs.microsoft.com/windows/desktop/properties/props-system-proplist-infotip">System.PropList.InfoTip</a>) will return the string form of a list of properties suitable for showing in an infotip.  If you are reading multiple values from an item, it is more efficient to call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getvalue">IPropertyStore::GetValue</a> with a PKEY_PropList key so that the item is not reopened multiple times.  See Property Lists for details on how to register a property list string for a file type.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertydescriptionlist
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyDescriptionList extends IUnknown {
    /**
     * The interface identifier for IPropertyDescriptionList
     * @type {Guid}
     */
    static IID := Guid("{1f9fc1d0-c39b-4b26-817f-011967d3440e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyDescriptionList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetAt    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyDescriptionList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of properties included in the property list.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the count of properties.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionlist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcElem := 0, "HRESULT")
        return pcElem
    }

    /**
     * Gets the property description at the specified index in a property description list.
     * @remarks
     * It is recommended that you use the IID_PPV_ARGS macro, defined in objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, eliminating the possibility of a coding error.
     * @param {Integer} iElem Type: <b>UINT</b>
     * 
     * The number of the property in the list string.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the requested property description interface, typically IID_IPropertyDescription.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. Typically, this is <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionlist-getat
     */
    GetAt(iElem, riid) {
        result := ComCall(4, this, "uint", iElem, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IPropertyDescriptionList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
    }
}
