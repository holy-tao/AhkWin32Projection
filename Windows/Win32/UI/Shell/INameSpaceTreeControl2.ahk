#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NSTCSTYLE2.ahk" { NSTCSTYLE2 }
#Import ".\INameSpaceTreeControl.ahk" { INameSpaceTreeControl }

/**
 * Extends the INameSpaceTreeControl interface by providing methods that get and set the display styles of treeview controls for use with Shell namespace items.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol">INameSpaceTreeControl</a> interface, from which it inherits.
 * 
 * Use class identifier (CLSID) CLSID_NameSpaceTreeControl to instantiate an instance of this interface.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided with Windows. Third parties should not implement their own versions.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreecontrol2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INameSpaceTreeControl2 extends INameSpaceTreeControl {
    /**
     * The interface identifier for INameSpaceTreeControl2
     * @type {Guid}
     */
    static IID := Guid("{7cc7aed8-290e-49bc-8945-c1401cc9306c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INameSpaceTreeControl2 interfaces
    */
    struct Vtbl extends INameSpaceTreeControl.Vtbl {
        SetControlStyle  : IntPtr
        GetControlStyle  : IntPtr
        SetControlStyle2 : IntPtr
        GetControlStyle2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INameSpaceTreeControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the display styles for the namespace object's treeview controls.
     * @param {Integer} nstcsMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a> constants that specify the styles for which the method should set new values.
     * @param {Integer} nstcsStyle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * 
     * A bitmap that contains the new values for the styles specified in <i>nstcsMask</i>. If the bit that represents the individual <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a> value is 0, that style is not used. If the value is 1, the style is applied to the treeview. Styles in positions not specified in <i>nstcsMask</i> are left at their current setting regardless of their bit's value in this bitmap.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrol2-setcontrolstyle
     */
    SetControlStyle(nstcsMask, nstcsStyle) {
        result := ComCall(22, this, "uint", nstcsMask, "uint", nstcsStyle, "HRESULT")
        return result
    }

    /**
     * Gets the display styles set for the namespace object's treeview controls.
     * @param {Integer} nstcsMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a> constants that specify the values for which the method should retrieve the current settings.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a>*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the values requested in <i>nstcsMask</i>. If the bit that represents the individual <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a> value is 0, that value is not set. If the value is 1, it is the current setting. Bit values in positions not specifically requested in <i>nstcsMask</i> do not necessarily reflect the current settings and should not be used.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrol2-getcontrolstyle
     */
    GetControlStyle(nstcsMask) {
        result := ComCall(23, this, "uint", nstcsMask, "uint*", &pnstcsStyle := 0, "HRESULT")
        return pnstcsStyle
    }

    /**
     * Sets the extended display styles for the namespace object's treeview controls.
     * @param {NSTCSTYLE2} nstcsMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a> constants that specify the styles for which the method should set new values.
     * @param {NSTCSTYLE2} nstcsStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a></b>
     * 
     * A bitmap that contains the new values for the styles specified in <i>nstcsMask</i>. If the bit that represents the individual <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a> value is 0, that style is not used. If the value is 1, the style is applied to the treeview. Styles in positions not specified in <i>nstcsMask</i> are left at their current setting regardless of their bit's value in this bitmap.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrol2-setcontrolstyle2
     */
    SetControlStyle2(nstcsMask, nstcsStyle) {
        result := ComCall(24, this, NSTCSTYLE2, nstcsMask, NSTCSTYLE2, nstcsStyle, "HRESULT")
        return result
    }

    /**
     * Gets the extended display styles set for the namespace object's treeview controls.
     * @param {NSTCSTYLE2} nstcsMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a> constants that specify the values for which the method should retrieve the current settings.
     * @returns {NSTCSTYLE2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a>*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the values requested in <i>nstcsMask</i>. If the bit that represents the individual <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a> value is 0, that value is not set. If the value is 1, it is the current setting. Bit values in positions not specifically requested in <i>nstcsMask</i> do not necessarily reflect the current settings and should not be used.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrol2-getcontrolstyle2
     */
    GetControlStyle2(nstcsMask) {
        result := ComCall(25, this, NSTCSTYLE2, nstcsMask, "int*", &pnstcsStyle := 0, "HRESULT")
        return pnstcsStyle
    }

    Query(iid) {
        if (INameSpaceTreeControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetControlStyle := CallbackCreate(GetMethod(implObj, "SetControlStyle"), flags, 3)
        this.vtbl.GetControlStyle := CallbackCreate(GetMethod(implObj, "GetControlStyle"), flags, 3)
        this.vtbl.SetControlStyle2 := CallbackCreate(GetMethod(implObj, "SetControlStyle2"), flags, 3)
        this.vtbl.GetControlStyle2 := CallbackCreate(GetMethod(implObj, "GetControlStyle2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetControlStyle)
        CallbackFree(this.vtbl.GetControlStyle)
        CallbackFree(this.vtbl.SetControlStyle2)
        CallbackFree(this.vtbl.GetControlStyle2)
    }
}
