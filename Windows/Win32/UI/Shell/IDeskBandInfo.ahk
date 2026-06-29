#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method for getting the default Desk Band bandwidth.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ideskbandinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDeskBandInfo extends IUnknown {
    /**
     * The interface identifier for IDeskBandInfo
     * @type {Guid}
     */
    static IID := Guid("{77e425fc-cbf9-4307-ba6a-bb5727745661}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeskBandInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDefaultBandWidth : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeskBandInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the band width that the bandsite initially uses to set the default width when the band is added.
     * @param {Integer} dwBandID Type: <b>DWORD</b>
     * 
     * The band ID.
     * @param {Integer} dwViewMode Type: <b>DWORD</b>
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the band width.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskbandinfo-getdefaultbandwidth
     */
    GetDefaultBandWidth(dwBandID, dwViewMode) {
        result := ComCall(3, this, "uint", dwBandID, "uint", dwViewMode, "int*", &pnWidth := 0, "HRESULT")
        return pnWidth
    }

    Query(iid) {
        if (IDeskBandInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDefaultBandWidth := CallbackCreate(GetMethod(implObj, "GetDefaultBandWidth"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDefaultBandWidth)
    }
}
