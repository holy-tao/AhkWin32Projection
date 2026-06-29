#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintCoreHelper.ahk" { IPrintCoreHelper }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintCoreHelperUni extends IPrintCoreHelper {
    /**
     * The interface identifier for IPrintCoreHelperUni
     * @type {Guid}
     */
    static IID := Guid("{7e8e51d6-e5ee-4426-817b-958b9444eb79}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintCoreHelperUni interfaces
    */
    struct Vtbl extends IPrintCoreHelper.Vtbl {
        CreateGDLSnapshot        : IntPtr
        CreateDefaultGDLSnapshot : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintCoreHelperUni.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Integer} cbSize 
     * @param {Integer} dwFlags 
     * @returns {IStream} 
     */
    CreateGDLSnapshot(pDevmode, cbSize, dwFlags) {
        result := ComCall(12, this, DEVMODEA.Ptr, pDevmode, "uint", cbSize, "uint", dwFlags, "ptr*", &ppSnapshotStream := 0, "HRESULT")
        return IStream(ppSnapshotStream)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {IStream} 
     */
    CreateDefaultGDLSnapshot(dwFlags) {
        result := ComCall(13, this, "uint", dwFlags, "ptr*", &ppSnapshotStream := 0, "HRESULT")
        return IStream(ppSnapshotStream)
    }

    Query(iid) {
        if (IPrintCoreHelperUni.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateGDLSnapshot := CallbackCreate(GetMethod(implObj, "CreateGDLSnapshot"), flags, 5)
        this.vtbl.CreateDefaultGDLSnapshot := CallbackCreate(GetMethod(implObj, "CreateDefaultGDLSnapshot"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateGDLSnapshot)
        CallbackFree(this.vtbl.CreateDefaultGDLSnapshot)
    }
}
