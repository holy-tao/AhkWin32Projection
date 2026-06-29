#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that notifies a Shell namespace extension when the ID of an item has changed.
 * @remarks
 * <b>IShellChangeNotify</b> is used to let a host of a component communicate the change notifications that it receives to the objects that it hosts. This is used in Windows Explorer to communicate change notifications to band objects.
 * 
 * This interface is implemented by all namespace extensions.
 * 
 * You do not call this interface directly. <b>IShellChangeNotify</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
 * 
 * <b>IShellChangeNotify</b> implements <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> as well as the listed method.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishellchangenotify
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellChangeNotify extends IUnknown {
    /**
     * The interface identifier for IShellChangeNotify
     * @type {Guid}
     */
    static IID := Guid("{d82be2b1-5764-11d0-a96e-00c04fd705a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellChangeNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellChangeNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Informs a namespace extension that an event has taken place that affects its items.
     * @remarks
     * This method is similar in function and usage to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shchangenotify">SHChangeNotify</a>.
     * @param {Integer} lEvent Type: <b>LONG</b>
     * 
     * A value that describes the event that has occurred. Typically, only one event is specified at a time. If more than one event is specified, the values contained in the <i>pidl1</i> and <i>pidl2</i> parameters must be the same, respectively, for all specified events.The <i>lEvent</i> parameter may contain one or more of the following flags.
     * @param {Pointer<ITEMIDLIST>} pidl1 Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The first event-dependent item identifier.
     * @param {Pointer<ITEMIDLIST>} pidl2 Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The second event-dependent item identifier.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellchangenotify-onchange
     */
    OnChange(lEvent, pidl1, pidl2) {
        result := ComCall(3, this, "int", lEvent, ITEMIDLIST.Ptr, pidl1, ITEMIDLIST.Ptr, pidl2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellChangeNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnChange := CallbackCreate(GetMethod(implObj, "OnChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnChange)
    }
}
