#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IKsPropertySet interface was originally designed as an efficient way to set and retrieve device properties on WDM drivers, using KSProxy to translate the user-mode COM method calls into the kernel-mode property sets used by WDM streaming class drivers. This interface is now also used to pass information strictly between software components.In some cases, software components must implement either this interface, or else the IKsControl interface (documented in the DirectShow DDK). For example, if you are writing a software MPEG-2 decoder for use with the DVD Navigator, you must implement one of these interfaces and also support the DVD-related property sets that the Navigator will send to the decoder. Pins may support one of these interfaces to allow other pins or filters to set or retrieve their properties.Note  Another interface by this name exists in the dsound.h header file. The two interfaces are not compatible. The IKsControl interface, documented in the DirectShow DDK, is now the recommended interface for passing property sets between WDM drivers and user mode components. .
 * @remarks
 * The **IKsPropertySet** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IKsPropertySet** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * You must include Ks.h before Ksproxy.h.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsPropertySet extends IUnknown {
    /**
     * The interface identifier for IKsPropertySet
     * @type {Guid}
     */
    static IID := Guid("{31efac30-515c-11d0-a9aa-00aa0061be93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsPropertySet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Set            : IntPtr
        Get            : IntPtr
        QuerySupported : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsPropertySet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Set method sets a property identified by a property set GUID and a property ID.
     * @remarks
     * > [!Note]  
     * > Another interface by this name exists in the dsound.h header file. The two interfaces are not compatible. The **IKsControl** interface, documented in the DirectShow DDK, is now the recommended interface for passing property sets between WDM drivers and user mode components.
     * 
     *  
     * 
     * You must include Ks.h before Ksproxy.h.
     * @param {Pointer<Guid>} guidPropSet Property set GUID.
     * @param {Integer} dwPropID Identifier of the property within the property set.
     * @param {Integer} pInstanceData Pointer to a buffer that contains instance data for the property.
     * @param {Integer} cbInstanceData Size of the *pInstanceData* buffer, in bytes.
     * @param {Integer} pPropData Pointer to a buffer that contains the value of the property.
     * @param {Integer} cbPropData Sise of the *pPropData* buffer, in bytes.
     * @returns {HRESULT} Returns an **HRESULT** value. Possible values include the following.
     * 
     * 
     * 
     * | Return code                                                                                              | Description                                                                 |
     * |----------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>                     | Success.<br/>                                                         |
     * | <dl> <dt>**E\_PROP\_SET\_UNSUPPORTED**</dt> </dl> | The property set is not supported.<br/>                               |
     * | <dl> <dt>**E\_PROP\_ID\_UNSUPPORTED**</dt> </dl>  | The property ID is not supported for the specified property set.<br/> |
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset-set
     */
    Set(guidPropSet, dwPropID, pInstanceData, cbInstanceData, pPropData, cbPropData) {
        result := ComCall(3, this, Guid.Ptr, guidPropSet, "uint", dwPropID, "ptr", pInstanceData, "uint", cbInstanceData, "ptr", pPropData, "uint", cbPropData, "HRESULT")
        return result
    }

    /**
     * The Get method retrieves a property identified by a property set GUID and a property ID.
     * @remarks
     * > [!Note]  
     * > Another interface by this name exists in the dsound.h header file. The two interfaces are not compatible. The [IKsControl](/windows-hardware/drivers/ddi/ksproxy/nn-ksproxy-ikscontrol) interface, documented in the DirectShow DDK, is now the recommended interface for passing property sets between WDM drivers and user mode components.
     * 
     *  
     * 
     * To retrieve a property, allocate a buffer which this method will then fill in. To determine the necessary buffer size, specify **NULL** for *pPropData* and zero (0) for *cbPropData*. This method returns the necessary buffer size in *pcbReturned*.
     * 
     * You must include Ks.h before Ksproxy.h.
     * @param {Pointer<Guid>} guidPropSet The GUID of the property set .
     * @param {Integer} dwPropID The identifier of the property within the property set.
     * @param {Integer} pInstanceData A pointer to an array of bytes that contains instance data for the property.
     * @param {Integer} cbInstanceData The size of the array given in *pInstanceData*, in bytes.
     * @param {Integer} pPropData A pointer to an array of bytes that receives the property data.
     * @param {Integer} cbPropData The size of the array given in *pPropData*, in bytes.
     * @returns {Integer} Receives the number of bytes the method copies to the *pPropData* array.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset-get
     */
    Get(guidPropSet, dwPropID, pInstanceData, cbInstanceData, pPropData, cbPropData) {
        result := ComCall(4, this, Guid.Ptr, guidPropSet, "uint", dwPropID, "ptr", pInstanceData, "uint", cbInstanceData, "ptr", pPropData, "uint", cbPropData, "uint*", &pcbReturned := 0, "HRESULT")
        return pcbReturned
    }

    /**
     * The QuerySupported method determines whether an object supports a specified property set.
     * @remarks
     * > [!Note]  
     * > Another interface by this name exists in the dsound.h header file. The two interfaces are not compatible. The **IKsControl** interface, documented in the DirectShow DDK, is now the recommended interface for passing property sets between WDM drivers and user mode components.
     * 
     *  
     * 
     * You must include Ks.h before Ksproxy.h.
     * @param {Pointer<Guid>} guidPropSet Property set GUID.
     * @param {Integer} dwPropID Identifier of the property within the property set.
     * @returns {Integer} Pointer to a value in which to store flags indicating the support provided by the driver. Supported flags include the following.
     * 
     * 
     * 
     * | Value                    | Description                                                                                            |
     * |--------------------------|--------------------------------------------------------------------------------------------------------|
     * | KSPROPERTY\_SUPPORT\_GET | You can retrieve the property by calling the [**IKsPropertySet::Get**](ikspropertyset-get.md) method. |
     * | KSPROPERTY\_SUPPORT\_SET | You can change the property by calling [**IKsPropertySet::Set**](ikspropertyset-set.md).              |
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset-querysupported
     */
    QuerySupported(guidPropSet, dwPropID) {
        result := ComCall(5, this, Guid.Ptr, guidPropSet, "uint", dwPropID, "uint*", &pTypeSupport := 0, "HRESULT")
        return pTypeSupport
    }

    Query(iid) {
        if (IKsPropertySet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Set := CallbackCreate(GetMethod(implObj, "Set"), flags, 7)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 8)
        this.vtbl.QuerySupported := CallbackCreate(GetMethod(implObj, "QuerySupported"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.QuerySupported)
    }
}
