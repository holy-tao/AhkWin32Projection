#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FOLDERVIEWOPTIONS.ahk" { FOLDERVIEWOPTIONS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow control of folder view options specific to the Windows 7 and later views.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided with Windows as part of CLSID_ExplorerBrowser and CLSID_ShellBrowser. Third parties do not implement this interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * By default, the Windows 7 item view does not support custom positioning, custom ordering, or hyperlinks, which were supported in the Windows Vista list view. Use this interface when you require those features of the older view. If, at some later time, the item view adds support for those features, these options will automatically use the newer view rather than continuing to revert to the older view as they currently do.
 * 
 * 
 * 
 * Use this interface to turn off animation and scroll tip view options new to Windows 7.
 * 
 * Use this interface to retrieve the current view settings for all of those options.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifolderviewoptions
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFolderViewOptions extends IUnknown {
    /**
     * The interface identifier for IFolderViewOptions
     * @type {Guid}
     */
    static IID := Guid("{3cc974d2-b302-4d36-ad3e-06d93f695d3f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderViewOptions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFolderViewOptions : IntPtr
        GetFolderViewOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderViewOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets specified options for the view.
     * @param {FOLDERVIEWOPTIONS} fvoMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a></b>
     * 
     * A bitmask made up of one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a> flags to indicate which options' are being changed. Values in <i>fvoFlags</i> not included in this mask are ignored.
     * @param {FOLDERVIEWOPTIONS} fvoFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a></b>
     * 
     * A bitmask that contains the new values for the options specified in <i>fvoMask</i>. To enable an option, the bitmask should include the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a> flag for that option. To disable an option, the bit used for that <b>FOLDERVIEWOPTIONS</b> flag should be 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderviewoptions-setfolderviewoptions
     */
    SetFolderViewOptions(fvoMask, fvoFlags) {
        result := ComCall(3, this, FOLDERVIEWOPTIONS, fvoMask, FOLDERVIEWOPTIONS, fvoFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the current set of options for the view.
     * @returns {FOLDERVIEWOPTIONS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a>*</b>
     * 
     * A bitmask that, when this method returns successfully, receives the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a> values that are currently set.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderviewoptions-getfolderviewoptions
     */
    GetFolderViewOptions() {
        result := ComCall(4, this, "int*", &pfvoFlags := 0, "HRESULT")
        return pfvoFlags
    }

    Query(iid) {
        if (IFolderViewOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFolderViewOptions := CallbackCreate(GetMethod(implObj, "SetFolderViewOptions"), flags, 3)
        this.vtbl.GetFolderViewOptions := CallbackCreate(GetMethod(implObj, "GetFolderViewOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFolderViewOptions)
        CallbackFree(this.vtbl.GetFolderViewOptions)
    }
}
