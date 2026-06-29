#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * Receives IShellWindows window registration events.
 * @remarks
 * The **DShellWindowsEvents** object has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * Use **DShellWindowsEvents** to monitor when a Shell window is registered or revoked. For more information, see [**IShellWindows**](/windows/desktop/api/Exdisp/nn-exdisp-ishellwindows).
 * @see https://learn.microsoft.com/windows/win32/shell/dshellwindowsevents
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DShellWindowsEvents extends IDispatch {
    /**
     * The interface identifier for DShellWindowsEvents
     * @type {Guid}
     */
    static IID := Guid("{fe4106e0-399a-11d0-a48c-00a0c90a8f39}")

    /**
     * The class identifier for DShellWindowsEvents
     * @type {Guid}
     */
    static CLSID := Guid("{fe4106e0-399a-11d0-a48c-00a0c90a8f39}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DShellWindowsEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DShellWindowsEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (DShellWindowsEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
