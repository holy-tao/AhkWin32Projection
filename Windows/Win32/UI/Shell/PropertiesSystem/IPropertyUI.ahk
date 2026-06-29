#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PROPERTYUI_NAME_FLAGS.ahk" { PROPERTYUI_NAME_FLAGS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROPERTYUI_FORMAT_FLAGS.ahk" { PROPERTYUI_FORMAT_FLAGS }
#Import ".\PROPERTYUI_FLAGS.ahk" { PROPERTYUI_FLAGS }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Developers should use IPropertyDescription instead. (IPropertyUI)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipropertyui
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyUI extends IUnknown {
    /**
     * The interface identifier for IPropertyUI
     * @type {Guid}
     */
    static IID := Guid("{757a7d9f-919a-4118-99d7-dbb208c8cc66}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyUI interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ParsePropertyName      : IntPtr
        GetCannonicalName      : IntPtr
        GetDisplayName         : IntPtr
        GetPropertyDescription : IntPtr
        GetDefaultWidth        : IntPtr
        GetFlags               : IntPtr
        FormatForDisplay       : IntPtr
        GetHelpInfo            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyUI.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Developers should use IPropertyDescription instead. Reads the characters of the specified property name and identifies the FMTID and PROPID of the property.
     * @param {PWSTR} pszName Type: <b>LPWSTR</b>
     * 
     * A string specifying the property name to parse.
     * @param {Pointer<Guid>} pfmtid Type: <b>FMTID*</b>
     * 
     * The FMTID of the parsed property.
     * @param {Pointer<Integer>} ppid Type: <b>PROPID*</b>
     * 
     * The PROPID of the parsed property name.
     * @param {Pointer<Integer>} pchEaten Type: <b>ULONG*</b>
     * 
     * The number of characters that were consumed in parsing <i>pszName</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-parsepropertyname
     */
    ParsePropertyName(pszName, pfmtid, ppid, pchEaten) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        ppidMarshal := ppid is VarRef ? "uint*" : "ptr"
        pchEatenMarshal := pchEaten is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszName, Guid.Ptr, pfmtid, ppidMarshal, ppid, pchEatenMarshal, pchEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} fmtid 
     * @param {Integer} pid 
     * @param {PWSTR} pwszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     */
    GetCannonicalName(fmtid, pid, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(4, this, Guid.Ptr, fmtid, "uint", pid, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Developers should use IPropertyDescription instead. Gets a string specifying the name of the property suitable for display to users.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @param {PROPERTYUI_NAME_FLAGS} flags Type: <b>PROPERTYUI_NAME_FLAGS</b>
     * 
     * One of the following PROPERTYUI_NAME_FLAGS values:
     * @param {PWSTR} pwszText Type: <b>LPWSTR</b>
     * 
     * A string specifying the property.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * 
     * The length of the property display name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-getdisplayname
     */
    GetDisplayName(fmtid, pid, flags, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(5, this, Guid.Ptr, fmtid, "uint", pid, PROPERTYUI_NAME_FLAGS, flags, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Developers should use IPropertyDescription instead. Gets the property description of a specified property.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @param {PWSTR} pwszText Type: <b>LPWSTR</b>
     * 
     * The description of the property.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * 
     * The length of the property description.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-getpropertydescription
     */
    GetPropertyDescription(fmtid, pid, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(6, this, Guid.Ptr, fmtid, "uint", pid, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Developers should use IPropertyDescription instead. Gets the width of the property description.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * The width of the property description.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-getdefaultwidth
     */
    GetDefaultWidth(fmtid, pid) {
        result := ComCall(7, this, Guid.Ptr, fmtid, "uint", pid, "uint*", &pcxChars := 0, "HRESULT")
        return pcxChars
    }

    /**
     * Developers should use IPropertyDescription instead. Gets property feature flags for a specified property.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @returns {PROPERTYUI_FLAGS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_propertyui_flags">PROPERTYUI_FLAGS</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_propertyui_flags">PROPERTYUI_FLAGS</a> for the property.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-getflags
     */
    GetFlags(fmtid, pid) {
        result := ComCall(8, this, Guid.Ptr, fmtid, "uint", pid, "int*", &pflags := 0, "HRESULT")
        return pflags
    }

    /**
     * Developers should use IPropertyDescription instead. Gets a formatted, Unicode string representation of a property value.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * @param {Integer} pid Type: <b>PROPID</b>
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {PROPERTYUI_FORMAT_FLAGS} puiff Type: <b>PROPERTYUI_FORMAT_FLAGS</b>
     * 
     * The format for the returned property value.
     * @param {PWSTR} pwszText Type: <b>LPWSTR</b>
     * 
     * The property value, formatted for display.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-formatfordisplay
     */
    FormatForDisplay(fmtid, pid, ppropvar, puiff, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(9, this, Guid.Ptr, fmtid, "uint", pid, PROPVARIANT.Ptr, ppropvar, PROPERTYUI_FORMAT_FLAGS, puiff, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Developers should use IPropertyDescription instead. (IPropertyUI.GetHelpInfo)
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @param {PWSTR} pwszHelpFile Type: <b>LPWSTR</b>
     * 
     * The fully qualified path of the Help file.
     * @param {Integer} cch Type: <b>DWORD</b>
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The Help context ID for the property.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-gethelpinfo
     */
    GetHelpInfo(fmtid, pid, pwszHelpFile, cch) {
        pwszHelpFile := pwszHelpFile is String ? StrPtr(pwszHelpFile) : pwszHelpFile

        result := ComCall(10, this, Guid.Ptr, fmtid, "uint", pid, "ptr", pwszHelpFile, "uint", cch, "uint*", &puHelpID := 0, "HRESULT")
        return puHelpID
    }

    Query(iid) {
        if (IPropertyUI.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ParsePropertyName := CallbackCreate(GetMethod(implObj, "ParsePropertyName"), flags, 5)
        this.vtbl.GetCannonicalName := CallbackCreate(GetMethod(implObj, "GetCannonicalName"), flags, 5)
        this.vtbl.GetDisplayName := CallbackCreate(GetMethod(implObj, "GetDisplayName"), flags, 6)
        this.vtbl.GetPropertyDescription := CallbackCreate(GetMethod(implObj, "GetPropertyDescription"), flags, 5)
        this.vtbl.GetDefaultWidth := CallbackCreate(GetMethod(implObj, "GetDefaultWidth"), flags, 4)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 4)
        this.vtbl.FormatForDisplay := CallbackCreate(GetMethod(implObj, "FormatForDisplay"), flags, 7)
        this.vtbl.GetHelpInfo := CallbackCreate(GetMethod(implObj, "GetHelpInfo"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ParsePropertyName)
        CallbackFree(this.vtbl.GetCannonicalName)
        CallbackFree(this.vtbl.GetDisplayName)
        CallbackFree(this.vtbl.GetPropertyDescription)
        CallbackFree(this.vtbl.GetDefaultWidth)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.FormatForDisplay)
        CallbackFree(this.vtbl.GetHelpInfo)
    }
}
