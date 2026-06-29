#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Storage\IndexServer\FILTERREGION.ahk" { FILTERREGION }
#Import "..\..\Storage\IndexServer\IFilter.ahk" { IFilter }
#Import "..\Com\IMoniker.ahk" { IMoniker }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchQueryHits extends IUnknown {
    /**
     * The interface identifier for ISearchQueryHits
     * @type {Guid}
     */
    static IID := Guid("{ed8ce7e0-106c-11ce-84e2-00aa004b9986}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchQueryHits interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init           : IntPtr
        NextHitMoniker : IntPtr
        NextHitOffset  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchQueryHits.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IFilter} pflt 
     * @param {Integer} ulFlags 
     * @returns {Integer} 
     */
    Init(pflt, ulFlags) {
        result := ComCall(3, this, "ptr", pflt, "uint", ulFlags, Int32)
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcMnk 
     * @param {Pointer<Pointer<IMoniker>>} papMnk 
     * @returns {Integer} 
     */
    NextHitMoniker(pcMnk, papMnk) {
        pcMnkMarshal := pcMnk is VarRef ? "uint*" : "ptr"
        papMnkMarshal := papMnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcMnkMarshal, pcMnk, papMnkMarshal, papMnk, Int32)
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcRegion 
     * @param {Pointer<Pointer<FILTERREGION>>} paRegion 
     * @returns {Integer} 
     */
    NextHitOffset(pcRegion, paRegion) {
        pcRegionMarshal := pcRegion is VarRef ? "uint*" : "ptr"
        paRegionMarshal := paRegion is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pcRegionMarshal, pcRegion, paRegionMarshal, paRegion, Int32)
        return result
    }

    Query(iid) {
        if (ISearchQueryHits.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 3)
        this.vtbl.NextHitMoniker := CallbackCreate(GetMethod(implObj, "NextHitMoniker"), flags, 3)
        this.vtbl.NextHitOffset := CallbackCreate(GetMethod(implObj, "NextHitOffset"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.NextHitMoniker)
        CallbackFree(this.vtbl.NextHitOffset)
    }
}
