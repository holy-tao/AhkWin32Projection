#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuningSpace.ahk" { ITuningSpace }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumTuningSpaces.ahk" { IEnumTuningSpaces }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITuningSpaces interface represents a collection of tuning spaces.
 * @remarks
 * This interface is used to enumerate subsets of tuning spaces within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/systemtuningspaces-object">SystemTuningSpaces</a> object. To enumerate all of the tuning spaces available on the system, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspacecontainer">ITuningSpaceContainer</a> interface on the SystemTuningSpaces object.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuningSpaces)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ituningspaces
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ITuningSpaces extends IDispatch {
    /**
     * The interface identifier for ITuningSpaces
     * @type {Guid}
     */
    static IID := Guid("{901284e4-33fe-4b69-8d63-634a596f3756}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITuningSpaces interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count            : IntPtr
        get__NewEnum         : IntPtr
        get_Item             : IntPtr
        get_EnumTuningSpaces : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITuningSpaces.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {IEnumTuningSpaces} 
     */
    EnumTuningSpaces {
        get => this.get_EnumTuningSpaces()
    }

    /**
     * The get_Count method returns the number of tuning spaces in the collection.
     * @returns {Integer} Pointer to a variable that receives the number of items in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspaces-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * The get__NewEnum method returns an enumerator for the collection.
     * @remarks
     * The returned <b>IEnumVARIANT</b> interface is not thread safe, because it is intended primarily for use by Automation clients. Clients should not call methods on the interface from more than one thread.
     * @returns {IEnumVARIANT} Pointer to a variable that receives an <b>IEnumVARIANT</b> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspaces-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumVARIANT(NewEnum)
    }

    /**
     * The get_Item method returns the specified item in the collection.
     * @param {VARIANT} varIndex <b>VARIANT</b> type that specifies the ID of the tuning space. The ID uniquely identifies the tuning space within the <b>SystemTuningSpaces</b> object.
     * @returns {ITuningSpace} Address of a variable that receives a pointer to the tuning space's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspaces-get_item
     */
    get_Item(varIndex) {
        result := ComCall(9, this, VARIANT, varIndex, "ptr*", &_TuningSpace := 0, "HRESULT")
        return ITuningSpace(_TuningSpace)
    }

    /**
     * The get_EnumTuningSpaces method returns an enumerator for the collection.
     * @returns {IEnumTuningSpaces} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumtuningspaces">IEnumTuningSpaces</a> interface pointer. Use this interface to iterate through the collection. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspaces-get_enumtuningspaces
     */
    get_EnumTuningSpaces() {
        result := ComCall(10, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumTuningSpaces(NewEnum)
    }

    Query(iid) {
        if (ITuningSpaces.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_EnumTuningSpaces := CallbackCreate(GetMethod(implObj, "get_EnumTuningSpaces"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_EnumTuningSpaces)
    }
}
