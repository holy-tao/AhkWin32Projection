#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides threading protection for critical sections of a multi-threaded application.
 * @remarks
 * This interface is obtained by querying it from an immediate device context created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> (or later versions of this) interface 
 *           using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 * 
 * Unlike D3D10, there is no multithreaded layer in D3D11. By default, multithread protection is turned off. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-setmultithreadprotected">SetMultithreadProtected</a> to turn it on, then <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-enter">Enter</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-leave">Leave</a> to encapsulate graphics commands that  must be executed in a specific order.
 * 
 * By default in D3D11, applications can only use one thread with the immediate context at a time. But, applications can use this interface to change that restriction. The interface can turn on threading protection for the immediate context, which will increase the overhead of each immediate context call in order to share one context with multiple threads.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11multithread
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Multithread extends IUnknown {
    /**
     * The interface identifier for ID3D11Multithread
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
     * used for ID3D11Multithread interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Enter                   : IntPtr
        Leave                   : IntPtr
        SetMultithreadProtected : IntPtr
        GetMultithreadProtected : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Multithread.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enter a device's critical section. (ID3D11Multithread.Enter)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-setmultithreadprotected">SetMultithreadProtected</a> is set to true, then entering a device's critical section prevents other threads from simultaneously calling that device's methods, calling DXGI methods, and calling the methods of all resource, view, shader, state, and asynchronous interfaces.
     * 
     * This function should be used in multithreaded applications when there is a series of graphics commands that must happen in order. This function is typically called at the beginning of the series of graphics commands, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-leave">Leave</a> is typically called after those graphics commands.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11multithread-enter
     */
    Enter() {
        ComCall(3, this)
    }

    /**
     * Leave a device's critical section. (ID3D11Multithread.Leave)
     * @remarks
     * This function is typically used in multithreaded applications when there is a series of graphics commands 
     * 		  that must happen in order. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-enter">Enter</a> is typically called at the beginning of a series of graphics commands, and this function is typically 
     * 		  called after those graphics commands.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11multithread-leave
     */
    Leave() {
        ComCall(4, this)
    }

    /**
     * Turns multithread protection on or off.
     * @param {BOOL} bMTProtect Type: <b>BOOL</b>
     * 
     * Set to true to turn multithread protection on, false to turn it off.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * True if multithread protection was already turned on prior to calling this method, false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11multithread-setmultithreadprotected
     */
    SetMultithreadProtected(bMTProtect) {
        result := ComCall(5, this, BOOL, bMTProtect, BOOL)
        return result
    }

    /**
     * Find out if multithread protection is turned on or not.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns true if multithread protection is turned on, false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11multithread-getmultithreadprotected
     */
    GetMultithreadProtected() {
        result := ComCall(6, this, BOOL)
        return result
    }

    Query(iid) {
        if (ID3D11Multithread.IID.Equals(iid)) {
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
