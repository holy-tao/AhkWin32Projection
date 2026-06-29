#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumPhone.ahk" { IEnumPhone }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCollection2.ahk" { ITCollection2 }
#Import ".\ITTAPI.ahk" { ITTAPI }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITTAPI2 interface derives from the ITTAPI interface. It adds additional methods on the TAPI object to support phone devices.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-ittapi2
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTAPI2 extends ITTAPI {
    /**
     * The interface identifier for ITTAPI2
     * @type {Guid}
     */
    static IID := Guid("{54fbdc8c-d90f-4dad-9695-b373097f094b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTAPI2 interfaces
    */
    struct Vtbl extends ITTAPI.Vtbl {
        get_Phones                  : IntPtr
        EnumeratePhones             : IntPtr
        CreateEmptyCollectionObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTAPI2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Phones {
        get => this.get_Phones()
    }

    /**
     * The get_Phones method enumerates the phone objects corresponding to the phone devices. If there are no phones available that can be used with the address, this method produces an empty collection and returns S_OK.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface returned by <b>ITTAPI2::get_Phones</b>. The application must call <b>Release</b> on the 
     * <b>ITPhone</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi2-get_phones
     */
    get_Phones() {
        pPhones := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, pPhones, "HRESULT")
        return pPhones
    }

    /**
     * The EnumeratePhones method enumerates the phone objects corresponding to the phone devices. If there are no phones available that can be used with the address, this method produces an empty enumeration and returns S_OK.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumphone">IEnumPhone</a> interface returned by <b>ITTAPI2::EnumeratePhones</b>. The application must call <b>Release</b> on the 
     * <b>IEnumPhone</b> interface to free resources associated with it.
     * @returns {IEnumPhone} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumphone">IEnumPhone</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi2-enumeratephones
     */
    EnumeratePhones() {
        result := ComCall(24, this, "ptr*", &ppEnumPhone := 0, "HRESULT")
        return IEnumPhone(ppEnumPhone)
    }

    /**
     * The CreateEmptyCollectionObject method creates an empty collection object. The collection can be filled with ITDetectTone or ITCustomTone objects for use with the DetectTonesByCollection method or the GenerateCustomTonesByCollection method, respectively.
     * @returns {ITCollection2} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection2">ITCollection2</a> interface on the new collection object.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi2-createemptycollectionobject
     */
    CreateEmptyCollectionObject() {
        result := ComCall(25, this, "ptr*", &ppCollection := 0, "HRESULT")
        return ITCollection2(ppCollection)
    }

    Query(iid) {
        if (ITTAPI2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Phones := CallbackCreate(GetMethod(implObj, "get_Phones"), flags, 2)
        this.vtbl.EnumeratePhones := CallbackCreate(GetMethod(implObj, "EnumeratePhones"), flags, 2)
        this.vtbl.CreateEmptyCollectionObject := CallbackCreate(GetMethod(implObj, "CreateEmptyCollectionObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Phones)
        CallbackFree(this.vtbl.EnumeratePhones)
        CallbackFree(this.vtbl.CreateEmptyCollectionObject)
    }
}
