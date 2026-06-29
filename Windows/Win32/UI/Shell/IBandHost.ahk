#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that create and destroy bands and specify their availability.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ibandhost
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IBandHost extends IUnknown {
    /**
     * The interface identifier for IBandHost
     * @type {Guid}
     */
    static IID := Guid("{b9075c7c-d48e-403f-ab99-d6c77a1084ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBandHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateBand          : IntPtr
        SetBandAvailability : IntPtr
        DestroyBand         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBandHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a specified band.
     * @param {Pointer<Guid>} rclsidBand Type: <b>REFCLSID</b>
     * 
     * A reference to a CLSID. Used to ensure a duplicate band is not created.
     * @param {BOOL} fAvailable Type: <b>BOOL</b>
     * 
     * Specifies band availability.
     * @param {BOOL} fVisible Type: <b>BOOL</b>
     * 
     * Specifies band visibility.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to a desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Contains the address of a pointer to a band specified by <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ibandhost-createband
     */
    CreateBand(rclsidBand, fAvailable, fVisible, riid) {
        result := ComCall(3, this, Guid.Ptr, rclsidBand, BOOL, fAvailable, BOOL, fVisible, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Sets the availability of a specified band.
     * @param {Pointer<Guid>} rclsidBand Type: <b>REFCLSID</b>
     * 
     * A reference to a CLSID.
     * @param {BOOL} fAvailable Type: <b>BOOL</b>
     * 
     * Specifies band availability.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ibandhost-setbandavailability
     */
    SetBandAvailability(rclsidBand, fAvailable) {
        result := ComCall(4, this, Guid.Ptr, rclsidBand, BOOL, fAvailable, "HRESULT")
        return result
    }

    /**
     * Destroys a specified band.
     * @param {Pointer<Guid>} rclsidBand Type: <b>REFCLSID</b>
     * 
     * A reference to the CLSID of a band.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ibandhost-destroyband
     */
    DestroyBand(rclsidBand) {
        result := ComCall(5, this, Guid.Ptr, rclsidBand, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBandHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateBand := CallbackCreate(GetMethod(implObj, "CreateBand"), flags, 6)
        this.vtbl.SetBandAvailability := CallbackCreate(GetMethod(implObj, "SetBandAvailability"), flags, 3)
        this.vtbl.DestroyBand := CallbackCreate(GetMethod(implObj, "DestroyBand"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateBand)
        CallbackFree(this.vtbl.SetBandAvailability)
        CallbackFree(this.vtbl.DestroyBand)
    }
}
