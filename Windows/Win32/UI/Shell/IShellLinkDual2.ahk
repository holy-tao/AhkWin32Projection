#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IShellLinkDual.ahk" { IShellLinkDual }
#Import ".\FolderItem.ahk" { FolderItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends the ShellLinkObject object and supports one additional property.
 * @see https://learn.microsoft.com/windows/win32/shell/ishelllinkdual2-object
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellLinkDual2 extends IShellLinkDual {
    /**
     * The interface identifier for IShellLinkDual2
     * @type {Guid}
     */
    static IID := Guid("{317ee249-f12e-11d2-b1e4-00c04f8eeb3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellLinkDual2 interfaces
    */
    struct Vtbl extends IShellLinkDual.Vtbl {
        get_Target : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellLinkDual2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FolderItem} 
     */
    Target {
        get => this.get_Target()
    }

    /**
     * 
     * @returns {FolderItem} 
     */
    get_Target() {
        result := ComCall(23, this, "ptr*", &ppfi := 0, "HRESULT")
        return FolderItem(ppfi)
    }

    Query(iid) {
        if (IShellLinkDual2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Target := CallbackCreate(GetMethod(implObj, "get_Target"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Target)
    }
}
