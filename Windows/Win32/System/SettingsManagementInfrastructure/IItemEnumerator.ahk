#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Enumerates the items of a collection of settings and attributes.
 * @remarks
 * SMI and SMI collections are not thread-safe. Modifying a collection will not invalidate an enumerator. Further operations on the enumerator do not result in exceptions, and could encounter an enumerator in an inconsistent state.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nn-wcmconfig-iitemenumerator
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct IItemEnumerator extends IUnknown {
    /**
     * The interface identifier for IItemEnumerator
     * @type {Guid}
     */
    static IID := Guid("{9f7d7bb7-20b3-11da-81a5-0030f1642e3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IItemEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Current  : IntPtr
        MoveNext : IntPtr
        Reset    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IItemEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an item from the current position of the enumerator.
     * @remarks
     * <div class="alert"><b>Note</b>  When the item is no longer required, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> to free the resources associated with the item.</div>
     * <div> </div>
     * @returns {VARIANT} A variant that contains the key value for the collection. For most collections, the key is the name of the item.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-iitemenumerator-current
     */
    Current() {
        Item := VARIANT()
        result := ComCall(3, this, VARIANT.Ptr, Item, "HRESULT")
        return Item
    }

    /**
     * Moves the current position to the next item in the enumerator if available.
     * @remarks
     * <div class="alert"><b>Note</b>  This method always returns <b>S_OK</b> on success, regardless of the state of the enumeration. If there are no more items, <i>ItemValid</i> is set to <b>False</b>, and this is how to determine if the end of the enumeration has been reached.</div>
     * <div> </div>
     * @returns {BOOL} Returns <b>True</b> if a valid item is found in the position after the move.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-iitemenumerator-movenext
     */
    MoveNext() {
        result := ComCall(4, this, BOOL.Ptr, &ItemValid := 0, "HRESULT")
        return ItemValid
    }

    /**
     * Resets the state of the enumerator to its initialized state. You must immediately follow IItemEnumerator::Reset with a call to IItemEnumerator::MoveNext on the enumerator in order to set the current pointer at the first position in the enumeration.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-iitemenumerator-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IItemEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Current := CallbackCreate(GetMethod(implObj, "Current"), flags, 2)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Current)
        CallbackFree(this.vtbl.MoveNext)
        CallbackFree(this.vtbl.Reset)
    }
}
