#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @version v4.0.30319
 */
class IKsPropertySet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsPropertySet
     * @type {Guid}
     */
    static IID => Guid("{31efac30-515c-11d0-a9aa-00aa0061be93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Set", "Get", "QuerySupported"]

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
     * @param {Pointer} pInstanceData Pointer to a buffer that contains instance data for the property.
     * @param {Integer} cbInstanceData Size of the *pInstanceData* buffer, in bytes.
     * @param {Pointer} pPropData Pointer to a buffer that contains the value of the property.
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
        result := ComCall(3, this, "ptr", guidPropSet, "uint", dwPropID, "ptr", pInstanceData, "uint", cbInstanceData, "ptr", pPropData, "uint", cbPropData, "HRESULT")
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
     * @param {Pointer} pInstanceData A pointer to an array of bytes that contains instance data for the property.
     * @param {Integer} cbInstanceData The size of the array given in *pInstanceData*, in bytes.
     * @param {Pointer} pPropData A pointer to an array of bytes that receives the property data.
     * @param {Integer} cbPropData The size of the array given in *pPropData*, in bytes.
     * @returns {Integer} Receives the number of bytes the method copies to the *pPropData* array.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset-get
     */
    Get(guidPropSet, dwPropID, pInstanceData, cbInstanceData, pPropData, cbPropData) {
        result := ComCall(4, this, "ptr", guidPropSet, "uint", dwPropID, "ptr", pInstanceData, "uint", cbInstanceData, "ptr", pPropData, "uint", cbPropData, "uint*", &pcbReturned := 0, "HRESULT")
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
        result := ComCall(5, this, "ptr", guidPropSet, "uint", dwPropID, "uint*", &pTypeSupport := 0, "HRESULT")
        return pTypeSupport
    }
}
