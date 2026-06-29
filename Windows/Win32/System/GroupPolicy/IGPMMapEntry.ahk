#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\GPMDestinationOption.ahk" { GPMDestinationOption }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GPMEntryType.ahk" { GPMEntryType }

/**
 * The IGPMMapEntry interface provides access to a map entry.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmmapentry
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMMapEntry extends IDispatch {
    /**
     * The interface identifier for IGPMMapEntry
     * @type {Guid}
     */
    static IID := Guid("{8e79ad06-2381-4444-be4c-ff693e6e6f2b}")

    /**
     * The class identifier for GPMMapEntry
     * @type {Guid}
     */
    static CLSID := Guid("{8c975253-5431-4471-b35d-0626c928258a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMMapEntry interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Source            : IntPtr
        get_Destination       : IntPtr
        get_DestinationOption : IntPtr
        get_EntryType         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMMapEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {BSTR} 
     */
    Destination {
        get => this.get_Destination()
    }

    /**
     * @type {GPMDestinationOption} 
     */
    DestinationOption {
        get => this.get_DestinationOption()
    }

    /**
     * @type {GPMEntryType} 
     */
    EntryType {
        get => this.get_EntryType()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Source() {
        pbstrSource := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrSource, "HRESULT")
        return pbstrSource
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Destination() {
        pbstrDestination := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrDestination, "HRESULT")
        return pbstrDestination
    }

    /**
     * 
     * @returns {GPMDestinationOption} 
     */
    get_DestinationOption() {
        result := ComCall(9, this, "int*", &pgpmDestOption := 0, "HRESULT")
        return pgpmDestOption
    }

    /**
     * 
     * @returns {GPMEntryType} 
     */
    get_EntryType() {
        result := ComCall(10, this, "int*", &pgpmEntryType := 0, "HRESULT")
        return pgpmEntryType
    }

    Query(iid) {
        if (IGPMMapEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Source := CallbackCreate(GetMethod(implObj, "get_Source"), flags, 2)
        this.vtbl.get_Destination := CallbackCreate(GetMethod(implObj, "get_Destination"), flags, 2)
        this.vtbl.get_DestinationOption := CallbackCreate(GetMethod(implObj, "get_DestinationOption"), flags, 2)
        this.vtbl.get_EntryType := CallbackCreate(GetMethod(implObj, "get_EntryType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Source)
        CallbackFree(this.vtbl.get_Destination)
        CallbackFree(this.vtbl.get_DestinationOption)
        CallbackFree(this.vtbl.get_EntryType)
    }
}
