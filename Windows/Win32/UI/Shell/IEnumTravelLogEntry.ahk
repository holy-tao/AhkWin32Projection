#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITravelLogEntry.ahk" { ITravelLogEntry }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumTravelLogEntry extends IUnknown {
    /**
     * The interface identifier for IEnumTravelLogEntry
     * @type {Guid}
     */
    static IID := Guid("{7ebfdd85-ad18-11d3-a4c5-00c04f72d6b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumTravelLogEntry interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumTravelLogEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cElt 
     * @param {Pointer<ITravelLogEntry>} rgElt 
     * @param {Pointer<Integer>} pcEltFetched 
     * @returns {HRESULT} 
     */
    Next(cElt, rgElt, pcEltFetched) {
        pcEltFetchedMarshal := pcEltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cElt, ITravelLogEntry.Ptr, rgElt, pcEltFetchedMarshal, pcEltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumTravelLogEntry} 
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTravelLogEntry(ppEnum)
    }

    Query(iid) {
        if (IEnumTravelLogEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
