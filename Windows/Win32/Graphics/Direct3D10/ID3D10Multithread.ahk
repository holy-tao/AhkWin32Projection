#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A multithread interface accesses multithread settings and can only be used if the thread-safe layer is turned on.
 * @remarks
 * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10multithread
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10Multithread extends IUnknown {
    /**
     * The interface identifier for ID3D10Multithread
     * @type {Guid}
     */
    static IID := Guid("{9b7e4e00-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10Multithread interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Enter                   : IntPtr
        Leave                   : IntPtr
        SetMultithreadProtected : IntPtr
        GetMultithreadProtected : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10Multithread.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enter a device's critical section. (ID3D10Multithread.Enter)
     * @remarks
     * Entering a device's critical section prevents other threads from simultaneously calling that device's methods (if <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10multithread-setmultithreadprotected">multithread protection</a> is set to true), calling DXGI methods, and calling the methods of all resource, view, shader, state, and asynchronous interfaces.
     * 
     * This function should be used in multithreaded applications when there is a series of graphics commands that must happen in order. This function is typically called at the beginning of the series of graphics commands, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10multithread-leave">ID3D10Multithread::Leave</a> is typically called after those graphics commands.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10multithread-enter
     */
    Enter() {
        ComCall(3, this)
    }

    /**
     * Leave a device's critical section. (ID3D10Multithread.Leave)
     * @remarks
     * This function is typically used in multithreaded applications when there is a series of graphics commands that must happen in order. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10multithread-enter">ID3D10Multithread::Enter</a> is typically called at the beginning of a series of graphics commands, and this function is typically called after those graphics commands.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10multithread-leave
     */
    Leave() {
        ComCall(4, this)
    }

    /**
     * Turn multithreading on or off.
     * @param {BOOL} bMTProtect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * True to turn multithreading on, false to turn it off.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * True if multithreading was turned on prior to calling this method, false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10multithread-setmultithreadprotected
     */
    SetMultithreadProtected(bMTProtect) {
        result := ComCall(5, this, BOOL, bMTProtect, BOOL)
        return result
    }

    /**
     * Find out if multithreading is turned on or not.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether or not multithreading is turned on. True means on, false means off.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10multithread-getmultithreadprotected
     */
    GetMultithreadProtected() {
        result := ComCall(6, this, BOOL)
        return result
    }

    Query(iid) {
        if (ID3D10Multithread.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Enter := CallbackCreate(GetMethod(implObj, "Enter"), flags, 1)
        this.vtbl.Leave := CallbackCreate(GetMethod(implObj, "Leave"), flags, 1)
        this.vtbl.SetMultithreadProtected := CallbackCreate(GetMethod(implObj, "SetMultithreadProtected"), flags, 2)
        this.vtbl.GetMultithreadProtected := CallbackCreate(GetMethod(implObj, "GetMultithreadProtected"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Enter)
        CallbackFree(this.vtbl.Leave)
        CallbackFree(this.vtbl.SetMultithreadProtected)
        CallbackFree(this.vtbl.GetMultithreadProtected)
    }
}
