#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IFastRundown (objidlbase.h) interface marks an interface as eligible for fast rundown behavior.
 * @remarks
 * A Component Object Model (COM) object implements the <b>IFastRundown</b> marker interface to opt into the fast rundown behavior.
 * 
 * All Windows Store app processes, as well as the broker processes RuntimeBroker.exe and PickerHost.exe, apply fast rundown at the process level, which means that all objects in any of these processes are subjected to fast rundown automatically. Desktop processes don't get this behavior by default and must opt in at the process level. Specific objects opt in by implementing the <b>IFastRundown</b> marker interface.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-ifastrundown
 * @namespace Windows.Win32.System.Com
 */
export default struct IFastRundown extends IUnknown {
    /**
     * The interface identifier for IFastRundown
     * @type {Guid}
     */
    static IID := Guid("{00000040-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFastRundown interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFastRundown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IFastRundown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
