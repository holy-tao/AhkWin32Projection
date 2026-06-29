#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that the Shell uses to retrieve flags and info tip information for an item that resides in an IShellFolder implementation. Info tips are usually displayed inside a tooltip control.
 * @remarks
 * This interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> and passing IID_IQueryInfo for the interface identifier. The item for which info tip information is being requested is contained in the <i>apidl</i> argument of the <b>IShellFolder::GetUIObjectOf</b> call. If <b>IQueryInfo</b> is not supplied by the folder, the Shell will use the standard display text in the info tip.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IQueryInfo</b> to provide flags and text information that differs from the normal text that is displayed for an item in a folder. For example, if your folder contained file objects, you could use the info tip to provide the entire path and file name for the item rather than just the file name.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * In most cases, you do not use this interface directly. The Shell will use this interface when it requires additional information to display inside of an info tip. However, you can use <b>IQueryInfo</b> directly if you want to obtain info tip information from another object.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iqueryinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IQueryInfo extends IUnknown {
    /**
     * The interface identifier for IQueryInfo
     * @type {Guid}
     */
    static IID := Guid("{00021500-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInfoTip   : IntPtr
        GetInfoFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the info tip text for an item.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that direct the handling of the item from which you're retrieving the info tip text. This value is commonly zero (<b>QITIPF_DEFAULT</b>). The following values are recognized.
     * @returns {PWSTR} Type: <b>PWSTR*</b>
     * 
     * The address of a Unicode string pointer that, when this method returns successfully, receives the tip string pointer. Applications that implement this method must allocate memory for <i>ppwszTip</i> by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Calling applications must call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the memory when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iqueryinfo-getinfotip
     */
    GetInfoTip(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, PWSTR.Ptr, &ppwszTip := 0, "HRESULT")
        return ppwszTip
    }

    /**
     * Gets the information flags for an item. This method is not currently used.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a value that receives the flags for the item. If no flags are to be returned, this value should be set to zero.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iqueryinfo-getinfoflags
     */
    GetInfoFlags() {
        result := ComCall(4, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    Query(iid) {
        if (IQueryInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInfoTip := CallbackCreate(GetMethod(implObj, "GetInfoTip"), flags, 3)
        this.vtbl.GetInfoFlags := CallbackCreate(GetMethod(implObj, "GetInfoFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInfoTip)
        CallbackFree(this.vtbl.GetInfoFlags)
    }
}
