#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * ID3D11SwitchToRef interface
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11switchtoref
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11SwitchToRef extends IUnknown {
    /**
     * The interface identifier for ID3D11SwitchToRef
     * @type {Guid}
     */
    static IID := Guid("{1ef337e3-58e7-4f83-a692-db221f5ed47e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11SwitchToRef interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetUseRef : IntPtr
        GetUseRef : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11SwitchToRef.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ID3D11SwitchToRef::SetUseRef method
     * @param {BOOL} UseRef Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Reserved.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11switchtoref-setuseref
     */
    SetUseRef(UseRef) {
        result := ComCall(3, this, BOOL, UseRef, BOOL)
        return result
    }

    /**
     * ID3D11SwitchToRef::GetUseRef method
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11switchtoref-getuseref
     */
    GetUseRef() {
        result := ComCall(4, this, BOOL)
        return result
    }

    Query(iid) {
        if (ID3D11SwitchToRef.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetUseRef := CallbackCreate(GetMethod(implObj, "SetUseRef"), flags, 2)
        this.vtbl.GetUseRef := CallbackCreate(GetMethod(implObj, "GetUseRef"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetUseRef)
        CallbackFree(this.vtbl.GetUseRef)
    }
}
