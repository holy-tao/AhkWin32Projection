#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDeskBand.ahk" { IDeskBand }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Exposes methods to enable and query translucency effects in a deskband object.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ideskband">IDeskBand</a> interfaces, from which it inherits.
 * 
 * If implemented in all active deskbands, this interface allows the taskbar to be displayed using translucent effects. If an active deskband does not implement <b>IDeskBand2</b>, then translucency is disabled for the entire taskbar.
 * 
 * A deskband can implement <b>IDeskBand2</b> as a communication conduit between itself and the taskbar as follows:
 * 
 *                 
 * 
 * <ul>
 * <li>Taskbar calls <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ideskband2-canrendercomposited">IDeskBand2::CanRenderComposited</a> to learn if a deskband supports translucency. If one or more do not, the entire taskbar is rendered opaque.</li>
 * <li>Taskbar calls <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ideskband2-setcompositionstate">IDeskBand2::SetCompositionState</a> as appropriate in response to a user turning translucent effects on or off. The taskbar should attempt to render itself translucent or opaque in response to this call.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ideskband2-getcompositionstate">IDeskBand2::GetCompositionState</a> is the counterpart of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ideskband2-setcompositionstate">IDeskBand2::SetCompositionState</a>.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ideskband2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDeskBand2 extends IDeskBand {
    /**
     * The interface identifier for IDeskBand2
     * @type {Guid}
     */
    static IID := Guid("{79d16de4-abee-4021-8d9d-9169b261d657}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeskBand2 interfaces
    */
    struct Vtbl extends IDeskBand.Vtbl {
        CanRenderComposited : IntPtr
        SetCompositionState : IntPtr
        GetCompositionState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeskBand2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates the deskband's ability to be displayed as translucent.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, contains a <b>BOOL</b> indicating ability.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ideskband2-canrendercomposited
     */
    CanRenderComposited() {
        result := ComCall(9, this, BOOL.Ptr, &pfCanRenderComposited := 0, "HRESULT")
        return pfCanRenderComposited
    }

    /**
     * Sets the composition state.
     * @param {BOOL} fCompositionEnabled Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable the composition state; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ideskband2-setcompositionstate
     */
    SetCompositionState(fCompositionEnabled) {
        result := ComCall(10, this, BOOL, fCompositionEnabled, "HRESULT")
        return result
    }

    /**
     * Gets the composition state.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, contains a <b>BOOL</b> that indicates state.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ideskband2-getcompositionstate
     */
    GetCompositionState() {
        result := ComCall(11, this, BOOL.Ptr, &pfCompositionEnabled := 0, "HRESULT")
        return pfCompositionEnabled
    }

    Query(iid) {
        if (IDeskBand2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CanRenderComposited := CallbackCreate(GetMethod(implObj, "CanRenderComposited"), flags, 2)
        this.vtbl.SetCompositionState := CallbackCreate(GetMethod(implObj, "SetCompositionState"), flags, 2)
        this.vtbl.GetCompositionState := CallbackCreate(GetMethod(implObj, "GetCompositionState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CanRenderComposited)
        CallbackFree(this.vtbl.SetCompositionState)
        CallbackFree(this.vtbl.GetCompositionState)
    }
}
