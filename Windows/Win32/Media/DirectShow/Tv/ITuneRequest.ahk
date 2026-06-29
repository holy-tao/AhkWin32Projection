#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ILocator.ahk" { ILocator }
#Import ".\ITuningSpace.ahk" { ITuningSpace }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IComponents.ahk" { IComponents }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITuneRequest interface is the base interface for all tune requests.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuneRequest)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-itunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ITuneRequest extends IDispatch {
    /**
     * The interface identifier for ITuneRequest
     * @type {Guid}
     */
    static IID := Guid("{07ddc146-fc3d-11d2-9d8c-00c04f72d980}")

    /**
     * The class identifier for TuneRequest
     * @type {Guid}
     */
    static CLSID := Guid("{b46e0d38-ab35-4a06-a137-70576b01b39f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITuneRequest interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_TuningSpace : IntPtr
        get_Components  : IntPtr
        Clone           : IntPtr
        get_Locator     : IntPtr
        put_Locator     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITuneRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITuningSpace} 
     */
    TuningSpace {
        get => this.get_TuningSpace()
    }

    /**
     * @type {IComponents} 
     */
    Components {
        get => this.get_Components()
    }

    /**
     * @type {ILocator} 
     */
    Locator {
        get => this.get_Locator()
        set => this.put_Locator(value)
    }

    /**
     * The get_TuningSpace method retrieves the tuning space that was used to create this tune request.
     * @remarks
     * You must first access the tuning space in order to obtain the default locator and the default preferred component types.
     * @returns {ITuningSpace} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunerequest-get_tuningspace
     */
    get_TuningSpace() {
        result := ComCall(7, this, "ptr*", &_TuningSpace := 0, "HRESULT")
        return ITuningSpace(_TuningSpace)
    }

    /**
     * The get_Components method retrieves the components contained in this tune request.
     * @remarks
     * A tune request always contains a collection of components, but the collection can be empty. If the component information is present in the transport stream tables, a Guide Store loader can obtain the information from the TIF and include it in the tune request at the time it creates it.
     * 
     * If the method succeeds, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponents">IComponents</a> interface has an outstanding reference count. The caller must release the interface.
     * 
     * After a tune request is submitted to the Network Provider filter, the Network Provider updates the component lists in the tune request. You can get the updated component list by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ituner-get_tunerequest">ITuner::get_TuneRequest</a> on the Network Provider, and then calling <b>get_Components</b> on the returned tune request. (The original tune request that was submitted to the Network Provider does not get updated, because the Network Provider creates an internal copy of the tune request. Therefore, you have to call <b>get_TuneRequest</b> to get the updated component list.)
     * @returns {IComponents} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponents">IComponents</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunerequest-get_components
     */
    get_Components() {
        result := ComCall(8, this, "ptr*", &_Components := 0, "HRESULT")
        return IComponents(_Components)
    }

    /**
     * The Clone method returns a new copy of this tune request.
     * @remarks
     * This method performs a "deep copy" of the object; in other words it copies all sub-objects as well, including <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/components-object">Components</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/languagecomponenttype-object">LanguageComponentType</a> objects, and so on.
     * @returns {ITuneRequest} Address of an <b>ITuneRequest</b> interface pointer that will be set to the new object.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunerequest-clone
     */
    Clone() {
        result := ComCall(9, this, "ptr*", &NewTuneRequest := 0, "HRESULT")
        return ITuneRequest(NewTuneRequest)
    }

    /**
     * The get_Locator method is called from the Network Provider to get the ILocator object associated with the requested broadcast.
     * @returns {ILocator} Address of an <b>ILocator</b> interface pointer that will be set to the new object.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunerequest-get_locator
     */
    get_Locator() {
        result := ComCall(10, this, "ptr*", &_Locator := 0, "HRESULT")
        return ILocator(_Locator)
    }

    /**
     * The put_Locator method is called from the Network Provider to set the ILocator object associated with the requested broadcast.
     * @param {ILocator} _Locator Pointer to an <b>ILocator</b> interface that specifies the new locator.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunerequest-put_locator
     */
    put_Locator(_Locator) {
        result := ComCall(11, this, "ptr", _Locator, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITuneRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TuningSpace := CallbackCreate(GetMethod(implObj, "get_TuningSpace"), flags, 2)
        this.vtbl.get_Components := CallbackCreate(GetMethod(implObj, "get_Components"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.get_Locator := CallbackCreate(GetMethod(implObj, "get_Locator"), flags, 2)
        this.vtbl.put_Locator := CallbackCreate(GetMethod(implObj, "put_Locator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TuningSpace)
        CallbackFree(this.vtbl.get_Components)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.get_Locator)
        CallbackFree(this.vtbl.put_Locator)
    }
}
