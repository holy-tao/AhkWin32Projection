#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPublishedApp.ahk" { IPublishedApp }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * Extends the IPublishedApp interface by providing an additional installation method.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ipublishedapp">IPublishedApp</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nn-shappmgr-ipublishedapp2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPublishedApp2 extends IPublishedApp {
    /**
     * The interface identifier for IPublishedApp2
     * @type {Guid}
     */
    static IID := Guid("{12b81347-1b3a-4a04-aa61-3f768b67fd7e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPublishedApp2 interfaces
    */
    struct Vtbl extends IPublishedApp.Vtbl {
        Install2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPublishedApp2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Installs an application published by an application publisher, while preventing multiple windows from being active on the same thread.
     * @param {Pointer<SYSTEMTIME>} pstInstall Type: <b>LPSYSTEMTIME</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * A handle to the parent window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ipublishedapp2-install2
     */
    Install2(pstInstall, hwndParent) {
        result := ComCall(11, this, SYSTEMTIME.Ptr, pstInstall, HWND, hwndParent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPublishedApp2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Install2 := CallbackCreate(GetMethod(implObj, "Install2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Install2)
    }
}
