#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The **IDXCoreAdapter** interface implements methods for retrieving details about an adapter item.
 * @remarks
 * An adapter's properties are established at the time the adapter starts, and they're immutable for the lifetime of the adapter. This is in contrast to an adapter's state, which can be queried or set, and the values of which can change over time.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class IDXCoreAdapter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXCoreAdapter
     * @type {Guid}
     */
    static IID => Guid("{f0db4c7f-fe5a-42a2-bd62-f2a6cf6fc83e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValid", "IsAttributeSupported", "IsPropertySupported", "GetProperty", "GetPropertySize", "IsQueryStateSupported", "QueryState", "IsSetStateSupported", "SetState", "GetFactory"]

    /**
     * Determines whether this DXCore adapter object is still valid.
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if this DXCore adapter object is still valid. Otherwise, returns `false`.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-isvalid
     */
    IsValid() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * Determines whether this DXCore adapter object supports the specified adapter attribute.
     * @param {Pointer<Guid>} attributeGUID 
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if this DXCore adapter object supports the specified adapter attribute. Otherwise, returns `false`.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-isattributesupported
     */
    IsAttributeSupported(attributeGUID) {
        result := ComCall(4, this, "ptr", attributeGUID, "int")
        return result
    }

    /**
     * Determines whether this DXCore adapter object and the current operating system (OS) support the specified adapter property.
     * @param {Integer} _property 
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if this DXCore adapter object and the current operating system (OS) support the specified adapter property. Otherwise, returns `false`.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-ispropertysupported
     */
    IsPropertySupported(_property) {
        result := ComCall(5, this, "uint", _property, "int")
        return result
    }

    /**
     * Retrieves the value of the specified adapter property.
     * @remarks
     * You can call **GetProperty** on an adapter that's no longer valid&mdash;the function won't fail as a result of that. This function zeros out the *propertyData* buffer prior to filling it in.
     * @param {Integer} _property 
     * @param {Pointer} bufferSize Type: **size_t**
     * 
     * The size, in bytes, of the output buffer that you allocate and provide in *propertyData*.
     * @param {Pointer} propertyData Type: **void\***
     * 
     * A pointer to an output buffer that you allocate in your application, and that the function fills in. Call [GetPropertySize](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getpropertysize) to determine the size that the *propertyData* buffer should be for a given adapter property.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |DXGI_ERROR_INVALID_CALL|The property type specified in *property* is not recognized by this operating system (OS). Call [IsPropertySupported](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-ispropertysupported) to confirm that the property type is available for this adapter and operating system (OS).|
     * |DXGI_ERROR_UNSUPPORTED|The property type specified in *property* is not supported by the adapter. Call [IsPropertySupported](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-ispropertysupported) to confirm that the property type is available for this adapter and operating system (OS).|
     * |E_INVALIDARG|An insufficient buffer size is provided in *propertyData*. Call [GetPropertySize](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getpropertysize) to determine the size that the *propertyData* buffer should be for a given adapter property.|
     * |E_POINTER|`nullptr` was provided for *propertyData*.|
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getproperty
     */
    GetProperty(_property, bufferSize, propertyData) {
        result := ComCall(6, this, "uint", _property, "ptr", bufferSize, "ptr", propertyData, "HRESULT")
        return result
    }

    /**
     * For a specified adapter property, retrieves the size of buffer, in bytes, that is required for a call to [GetProperty](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getproperty).
     * @remarks
     * You can call **GetPropertySize** on an adapter that's no longer valid&mdash;the function won't fail.
     * @param {Integer} _property 
     * @returns {Pointer} Type: **size_t\***
     * 
     * A pointer to a **size_t** value. The function dereferences the pointer and sets the value to the size, in bytes, of the output buffer that you should allocate and pass as the *propertyData* argument in your call to [GetProperty](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getproperty).
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getpropertysize
     */
    GetPropertySize(_property) {
        result := ComCall(7, this, "uint", _property, "ptr*", &bufferSize := 0, "HRESULT")
        return bufferSize
    }

    /**
     * Determines whether this DXCore adapter object and the current operating system (OS) support querying the value of the specified adapter state.
     * @param {Integer} _property 
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if this DXCore adapter object and the current operating system (OS) support querying the specified adapter state. Otherwise, returns `false`.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-isquerystatesupported
     */
    IsQueryStateSupported(_property) {
        result := ComCall(8, this, "uint", _property, "int")
        return result
    }

    /**
     * Retrieves the current state of the specified item on the adapter.
     * @remarks
     * See [DXCoreAdapterState](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate) for more info about each adapter state kind, and what inputs and outputs are used. This function zeros out the *outputBuffer* buffer prior to filling it in.
     * @param {Integer} state 
     * @param {Pointer} inputStateDetailsSize Type: **size_t**
     * 
     * The size, in bytes, of the input state details buffer that you (optionally) allocate and provide in *inputStateDetails*.
     * @param {Pointer} inputStateDetails Type: **void const\***
     * 
     * An optional pointer to a constant input state details buffer that you allocate in your application, containing any information about your request that's required for the state kind you specify in *state*. See the table in [DXCoreAdapterState](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate) for more info about any input buffer requirement for a given state kind.
     * @param {Pointer} outputBufferSize Type: **size_t**
     * 
     * The size, in bytes, of the output buffer that you allocate and provide in *outputBuffer*.
     * @param {Pointer} outputBuffer Type: **void\***
     * 
     * A pointer to an output buffer that you allocate in your application, and that the function fills in. See the table in [DXCoreAdapterState](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate) for more info about the output buffer requirement for a given state kind.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |DXGI_ERROR_DEVICE_REMOVED|The adapter is no longer in a valid state.|
     * |DXGI_ERROR_INVALID_CALL|The state kind specified in *state* is not recognized by this operating system (OS). Call [IsQueryStateSupported](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-isquerystatesupported) to confirm that querying the state kind is available for this adapter and operating system (OS).|
     * |DXGI_ERROR_UNSUPPORTED|The state kind specified in *state* is not supported by the adapter. Call [IsQueryStateSupported](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-isquerystatesupported) to confirm that querying the state kind is available for this adapter and operating system (OS).|
     * |E_INVALIDARG|An insufficient buffer size is provided for *outputBuffer* (or for *inputStateDetails* where an input state details buffer is necessary).|
     * |E_POINTER|`nullptr` was provided for *outputBuffer* (or for *inputStateDetails* where an input state details buffer is necessary).|
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-querystate
     */
    QueryState(state, inputStateDetailsSize, inputStateDetails, outputBufferSize, outputBuffer) {
        result := ComCall(9, this, "uint", state, "ptr", inputStateDetailsSize, "ptr", inputStateDetails, "ptr", outputBufferSize, "ptr", outputBuffer, "HRESULT")
        return result
    }

    /**
     * Determines whether this DXCore adapter object and the current operating system (OS) support setting the value of the specified adapter state.
     * @param {Integer} _property 
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if this DXCore adapter object and the current operating system (OS) support setting the specified adapter state. Otherwise, returns `false`.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-issetstatesupported
     */
    IsSetStateSupported(_property) {
        result := ComCall(10, this, "uint", _property, "int")
        return result
    }

    /**
     * Sets the state of the specified item on the adapter.
     * @param {Integer} state 
     * @param {Pointer} inputStateDetailsSize Type: **size_t**
     * 
     * The size, in bytes, of the input state details buffer that you (optionally) allocate and provide in *inputStateDetails*.
     * @param {Pointer} inputStateDetails Type: **void const\***
     * 
     * An optional pointer to a constant input state details buffer that you allocate in your application, containing any information about your request that's required for the state kind you specify in *state*. See the table in [DXCoreAdapterState](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate) for more info about any input buffer requirement for a given state kind.
     * @param {Pointer} inputDataSize Type: **size_t**
     * 
     * The size, in bytes, of the input buffer that you allocate and provide in *inputData*.
     * @param {Pointer} inputData Type: **void\***
     * 
     * A pointer to an input buffer that you allocate in your application, containing the state information to set for the state item whose kind you specify in *state*. See the table in [DXCoreAdapterState](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate) for more info about the input buffer requirement for a given state kind.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |DXGI_ERROR_DEVICE_REMOVED|The adapter is no longer in a valid state.|
     * |DXGI_ERROR_INVALID_CALL|The state kind specified in *state* is not recognized by this operating system (OS). Call [IsSetStateSupported](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-issetstatesupported) to confirm that setting the state kind is available for this adapter and operating system (OS).|
     * |DXGI_ERROR_UNSUPPORTED|The state kind specified in *state* is not supported by the adapter. Call [IsSetStateSupported](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-issetstatesupported) to confirm that setting the state kind is available for this adapter and operating system (OS).|
     * |E_INVALIDARG|An insufficient buffer size is provided for *inputData* (or for *inputStateDetails* where an input state details buffer is necessary).|
     * |E_POINTER|`nullptr` was provided for *inputData* (or for *inputStateDetails* where an input state details buffer is necessary).|
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-setstate
     */
    SetState(state, inputStateDetailsSize, inputStateDetails, inputDataSize, inputData) {
        result := ComCall(11, this, "uint", state, "ptr", inputStateDetailsSize, "ptr", inputStateDetails, "ptr", inputDataSize, "ptr", inputData, "HRESULT")
        return result
    }

    /**
     * Retrieves an [IDXCoreAdapterFactory](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory) interface pointer to the DXCore adapter factory object.
     * @remarks
     * For the duration of time that a reference exists on an [IDXCoreAdapterFactory](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory) interface, an [IDXCoreAdapterList](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist) interface, or an [IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter) interface, additional calls to [DXCoreCreateAdapterFactory](/windows/win32/api/dxcore/nf-dxcore-dxcorecreateadapterfactory), [IDXCoreAdapterList::GetFactory](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getfactory), or [IDXCoreAdapter::GetFactory](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getfactory) will return pointers to the same object, increasing the reference count of the **IDXCoreAdapterFactory** interface.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in *ppvFactory*. This is expected to be the interface identifier (IID) of [IDXCoreAdapterFactory](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory).
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Upon successful return, *\*ppvFactory* (the dereferenced address) contains a pointer to the existing DXCore adapter factory object. Before returning, the function increments the reference count on the factory object's [IDXCoreAdapterFactory](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory) interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getfactory
     */
    GetFactory(riid) {
        result := ComCall(12, this, "ptr", riid, "ptr*", &ppvFactory := 0, "HRESULT")
        return ppvFactory
    }
}
