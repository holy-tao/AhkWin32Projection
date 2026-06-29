#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow manipulation of items in a Windows 7 menu.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inewmenuclient
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INewMenuClient extends IUnknown {
    /**
     * The interface identifier for INewMenuClient
     * @type {Guid}
     */
    static IID := Guid("{dcb07fdc-3bb5-451c-90be-966644fed7b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INewMenuClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IncludeItems      : IntPtr
        SelectAndEditItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INewMenuClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows the view to filter the items shown in the menu.
     * @returns {Integer} Type: <b>NMCII_FLAGS*</b>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inewmenuclient-includeitems
     */
    IncludeItems() {
        result := ComCall(3, this, "int*", &pflags := 0, "HRESULT")
        return pflags
    }

    /**
     * INewMenuClient::SelectAndEditItem method
     * @param {Pointer<ITEMIDLIST>} pidlItem Type: <b>PCIDLIST_ABSOLUTE</b>
     * @param {Integer} flags Type: <b>NMCSAEI_FLAGS</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inewmenuclient-selectandedititem
     */
    SelectAndEditItem(pidlItem, flags) {
        result := ComCall(4, this, ITEMIDLIST.Ptr, pidlItem, "int", flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (INewMenuClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IncludeItems := CallbackCreate(GetMethod(implObj, "IncludeItems"), flags, 2)
        this.vtbl.SelectAndEditItem := CallbackCreate(GetMethod(implObj, "SelectAndEditItem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IncludeItems)
        CallbackFree(this.vtbl.SelectAndEditItem)
    }
}
