#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDirect3DStateBlock9 (d3d9.h) interface is used by applications to encapsulate render states.
 * @remarks
 * This interface can be used to save and restore pipeline state. It can also be used to capture the current state.
 * 
 * The LPDIRECT3DSTATEBLOCK9 and PDIRECT3DSTATEBLOCK9 types are defined as pointers to the <b>IDirect3DStateBlock9</b> interface.
 *     
 *             
 * 
 * 
 * ```
 * typedef struct IDirect3DStateBlock9 *LPDIRECT3DSTATEBLOCK9, *PDIRECT3DSTATEBLOCK9;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dstateblock9
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct IDirect3DStateBlock9 extends IUnknown {
    /**
     * The interface identifier for IDirect3DStateBlock9
     * @type {Guid}
     */
    static IID := Guid("{b07c4fe5-310d-4ba8-a23c-4f0f206f218b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DStateBlock9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDevice : IntPtr
        Capture   : IntPtr
        Apply     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DStateBlock9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirect3DStateBlock9::GetDevice (d3d9.h) method gets the device.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Pointer to the IDirect3DDevice9 interface that is returned.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dstateblock9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * The IDirect3DStateBlock9::Capture (d3d9.h) method captures the current value of states that are included in a stateblock.
     * @remarks
     * The Capture method captures current values for states within an existing state block. It does not capture the entire state of the device. For example:
     * 
     * 
     * ```
     * 
     * IDirect3DStateBlock9* pStateBlock = NULL;
     * 
     * pd3dDevice->BeginStateBlock();
     * // Add the ZENABLE state to the stateblock 
     * pd3dDevice->SetRenderState ( D3DRS_ZENABLE, D3DZB_TRUE );
     * pd3dDevice->EndStateBlock ( &pStateBlock );
     *     
     * // Change the current value that is stored in the state block
     * pd3dDevice->SetRenderState ( D3DRS_ZENABLE, D3DZB_FALSE );
     * pStateBlock->Capture();			
     * 
     * pStateBlock->Release();
     * 
     * ```
     * 
     * 
     * Creating an empty stateblock and calling the Capture method does nothing if no states have been set.
     * 
     * The Capture method  will not capture information for lights that are explicitly or implicitly created after the stateblock is created.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails because capture cannot be done while in record mode, the return value is D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dstateblock9-capture
     */
    Capture() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The IDirect3DStateBlock9::Apply (d3d9.h) method applies the state block to the current device state.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails while in record mode, the return value is D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dstateblock9-apply
     */
    Apply() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirect3DStateBlock9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
        this.vtbl.Capture := CallbackCreate(GetMethod(implObj, "Capture"), flags, 1)
        this.vtbl.Apply := CallbackCreate(GetMethod(implObj, "Apply"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
        CallbackFree(this.vtbl.Capture)
        CallbackFree(this.vtbl.Apply)
    }
}
