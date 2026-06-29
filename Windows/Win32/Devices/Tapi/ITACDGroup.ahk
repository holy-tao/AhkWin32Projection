#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumQueue.ahk" { IEnumQueue }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITACDGroup interface (tapi3cc.h) handles Automatic Call Distribution (ACD) mechanisms, which queue and distribute calls within a switching system.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itacdgroup
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITACDGroup extends IDispatch {
    /**
     * The interface identifier for ITACDGroup
     * @type {Guid}
     */
    static IID := Guid("{5afc3148-4bcc-11d1-bf80-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITACDGroup interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name        : IntPtr
        EnumerateQueues : IntPtr
        get_Queues      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITACDGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT} 
     */
    Queues {
        get => this.get_Queues()
    }

    /**
     * The ITACDGroup::get_Name method (tapi3cc.h) gets the ACD group name. This string can be a displayable name for the group.
     * @remarks
     * The application must free <i>ppName</i> through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when the variable is no longer needed.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of group name.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroup-get_name
     */
    get_Name() {
        ppName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, ppName, "HRESULT")
        return ppName
    }

    /**
     * The ITACDGroup::EnumerateQueues method (tapi3cc.h) enumerates queues currently on the ACD group.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumqueue">IEnumQueue</a> interface returned by <b>ITACDGroup::EnumerateQueues</b>. The application must call <b>Release</b> on the 
     * <b>IEnumQueue</b> interface to free resources associated with it.
     * @returns {IEnumQueue} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumqueue">IEnumQueue</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroup-enumeratequeues
     */
    EnumerateQueues() {
        result := ComCall(8, this, "ptr*", &ppEnumQueue := 0, "HRESULT")
        return IEnumQueue(ppEnumQueue)
    }

    /**
     * The ITACDGroup::get_Queues method (tapi3cc.h) creates a collection of queues associated with the current ACD group.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface returned by <b>ITACDGroup::get_Queues</b>. The application must call <b>Release</b> on the 
     * <b>ITQueue</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface pointers (queue objects).
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroup-get_queues
     */
    get_Queues() {
        pVariant := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    Query(iid) {
        if (ITACDGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.EnumerateQueues := CallbackCreate(GetMethod(implObj, "EnumerateQueues"), flags, 2)
        this.vtbl.get_Queues := CallbackCreate(GetMethod(implObj, "get_Queues"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.EnumerateQueues)
        CallbackFree(this.vtbl.get_Queues)
    }
}
