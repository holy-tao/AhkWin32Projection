#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The **IDXCoreAdapterList** interface implements methods for retrieving adapter items from a generated list, as well as details about the list.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class IDXCoreAdapterList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXCoreAdapterList
     * @type {Guid}
     */
    static IID => Guid("{526c7776-40e9-459b-b711-f32ad76dfc28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdapter", "GetAdapterCount", "IsStale", "GetFactory", "Sort", "IsAdapterPreferenceSupported"]

    /**
     * Retrieves a specific adapter by index from a DXCore adapter list object.
     * @remarks
     * Multiple calls passing an index that represents the same adapter return identical interface pointers, even across different adapter lists. As a result, it's safe to compare interface pointers to determine whether multiple pointers refer to the same adapter object.
     * @param {Integer} index Type: **uint32_t**
     * 
     * A zero-based index, identifying an adapter instance within the DXCore adapter list.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in *ppvAdapter*. This is expected to be the interface identifier (IID) of [IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter).
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Upon successful return, *\*ppvAdapter* (the dereferenced address) contains a pointer to the the DXCore adapter created.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getadapter
     */
    GetAdapter(index, riid) {
        result := ComCall(3, this, "uint", index, "ptr", riid, "ptr*", &ppvAdapter := 0, "HRESULT")
        return ppvAdapter
    }

    /**
     * Retrieves the number of adapters in a DXCore adapter list object.
     * @returns {Integer} Type: **uint32_t**
     * 
     * Returns the number of adapter items in the list.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getadaptercount
     */
    GetAdapterCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Determines whether changes to this system have resulted in this DXCore adapter list object becoming out of date.
     * @remarks
     * You can poll **IsStale** to determine whether changing system conditions have led to this list becoming out of date. If **IsStale** returns `true` once, then it returns `true` for the remaining lifetime of the DXCore adapter list object. A stale list object is still considered stale even if system conditions return to a state that matches the list (the same conditions obtain now as did when the list was first generated).
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if, since generating the list, changes to system conditions have occurred that would cause this adapter list to become stale. Otherwise, returns `false`.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-isstale
     */
    IsStale() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * TBD
     * @remarks
     * For the duration of time that a reference exists on an [IDXCoreAdapterFactory](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory) interface, an [IDXCoreAdapterList](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist) interface, or an [IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter) interface, additional calls to [DXCoreCreateAdapterFactory](/windows/win32/api/dxcore/nf-dxcore-dxcorecreateadapterfactory), [IDXCoreAdapterList::GetFactory](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getfactory), or [IDXCoreAdapter::GetFactory](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getfactory) will return pointers to the same object, increasing the reference count of the **IDXCoreAdapterFactory** interface.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in *ppvFactory*. This is expected to be the interface identifier (IID) of [IDXCoreAdapterFactory](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory).
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Upon successful return, *\*ppvFactory* (the dereferenced address) contains a pointer to the existing DXCore adapter factory object. Before returning, the function increments the reference count on the factory object's [IDXCoreAdapterFactory](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory) interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getfactory
     */
    GetFactory(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppvFactory := 0, "HRESULT")
        return ppvFactory
    }

    /**
     * Sorts a DXCore adapter list object based on a provided input array of sort criteria.
     * @remarks
     * In cases where a provided [DXCoreAdapterPreference](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterpreference) value isn't recognized by the operating system (OS), it is ignored, and won't cause the API to fail. Known **DXCoreAdapterPreference** values will still be considered in this case. To determine whether a sort type is understood by the API, call [IDXCoreAdapterList::IsAdapterPreferenceSupported](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-isadapterpreferencesupported).
     * 
     * **DXCoreAdapterPreference** values that occur earlier in the provided *preferences* array are treated with higher priority. 
     * 
     * Refer to the **DXCoreAdapterPreference** enumeration documentation for details about what logic is applied for each type. The internal logic for a type may develop as the OS develops.
     * 
     * When **Sort** returns, items in the DXCore adapter list will have been sorted from most preferable to least preferable. So, calling [IDXCoreAdapterList::GetAdapter](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getadapter) with index 0 retrieves the adapter that best matches the requested sort preference types; index 1 is the next best match, and so on.
     * @param {Integer} numPreferences Type: **uint32_t**
     * 
     * The number of elements that are in the array pointed to by the *preferences* parameter.
     * @param {Pointer<Integer>} preferences Type: **const [DXCoreAdapterPreference](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterpreference)\***
     * 
     * A pointer to a constant array of [DXCoreAdapterPreference](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterpreference) values, representing sort criteria.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_INVALIDARG|The *numPreferences* argument is zero, or the *preferences* argument is `nullptr`.|
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-sort
     */
    Sort(numPreferences, preferences) {
        preferencesMarshal := preferences is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", numPreferences, preferencesMarshal, preferences, "HRESULT")
        return result
    }

    /**
     * Determines whether a specified [DXCoreAdapterPreference](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterpreference) value is understood by the OS.
     * @param {Integer} preference Type: **[DXCoreAdapterPreference](/windows/win32/dxcore/dxcore_interface/ne-dxcore_interface-dxcoreadapterpreference)**
     * 
     * A [DXCoreAdapterPreference](/windows/win32/dxcore/dxcore_interface/ne-dxcore_interface-dxcoreadapterpreference) value that will be checked to see whether it's supported by the OS.
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if the sort type is understood by the current OS. Otherwise, returns `false`.
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-isadapterpreferencesupported
     */
    IsAdapterPreferenceSupported(preference) {
        result := ComCall(8, this, "uint", preference, "int")
        return result
    }
}
