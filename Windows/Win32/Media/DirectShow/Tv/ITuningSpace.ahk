#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ILocator.ahk" { ILocator }
#Import "..\..\..\System\Com\IEnumMoniker.ahk" { IEnumMoniker }
#Import "..\..\..\System\Com\IEnumGUID.ahk" { IEnumGUID }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IComponentTypes.ahk" { IComponentTypes }

/**
 * The ITuningSpace interface provides the common functionality for all network-specific tuning spaces.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuningSpace)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ituningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ITuningSpace extends IDispatch {
    /**
     * The interface identifier for ITuningSpace
     * @type {Guid}
     */
    static IID := Guid("{061c6e30-e622-11d2-9493-00c04f72d980}")

    /**
     * The class identifier for TuningSpace
     * @type {Guid}
     */
    static CLSID := Guid("{5ffdc5e6-b83a-4b55-b6e8-c69e765fe9db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITuningSpace interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_UniqueName                     : IntPtr
        put_UniqueName                     : IntPtr
        get_FriendlyName                   : IntPtr
        put_FriendlyName                   : IntPtr
        get_CLSID                          : IntPtr
        get_NetworkType                    : IntPtr
        put_NetworkType                    : IntPtr
        get__NetworkType                   : IntPtr
        put__NetworkType                   : IntPtr
        CreateTuneRequest                  : IntPtr
        EnumCategoryGUIDs                  : IntPtr
        EnumDeviceMonikers                 : IntPtr
        get_DefaultPreferredComponentTypes : IntPtr
        put_DefaultPreferredComponentTypes : IntPtr
        get_FrequencyMapping               : IntPtr
        put_FrequencyMapping               : IntPtr
        get_DefaultLocator                 : IntPtr
        put_DefaultLocator                 : IntPtr
        Clone                              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITuningSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    UniqueName {
        get => this.get_UniqueName()
        set => this.put_UniqueName(value)
    }

    /**
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * @type {BSTR} 
     */
    CLSID {
        get => this.get_CLSID()
    }

    /**
     * @type {BSTR} 
     */
    NetworkType {
        get => this.get_NetworkType()
        set => this.put_NetworkType(value)
    }

    /**
     * @type {Guid} 
     */
    _NetworkType {
        get => this.get__NetworkType()
        set => this.put__NetworkType(value)
    }

    /**
     * @type {IComponentTypes} 
     */
    DefaultPreferredComponentTypes {
        get => this.get_DefaultPreferredComponentTypes()
        set => this.put_DefaultPreferredComponentTypes(value)
    }

    /**
     * @type {BSTR} 
     */
    FrequencyMapping {
        get => this.get_FrequencyMapping()
        set => this.put_FrequencyMapping(value)
    }

    /**
     * @type {ILocator} 
     */
    DefaultLocator {
        get => this.get_DefaultLocator()
        set => this.put_DefaultLocator(value)
    }

    /**
     * The get_UniqueName method retrieves the unique name of the tuning space.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @returns {BSTR} Pointer to a variable that receives the unique name.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_uniquename
     */
    get_UniqueName() {
        Name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * The put_UniqueName method sets a unique name for the tuning space.
     * @remarks
     * If you attempt to add a new tuning space to the System Tuning Spaces collection, this property must be unique within the collection. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ituningspacecontainer-add">ITuningSpaceContainer::Add</a>.
     * @param {BSTR} Name Variable of type <b>BSTR</b> that specifies the unique name.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_uniquename
     */
    put_UniqueName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, BSTR, Name, "HRESULT")
        return result
    }

    /**
     * The get_FriendlyName method retrieves the localized, user-friendly name of the tuning space.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @returns {BSTR} Pointer to a variable receives the user-friendly name.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_friendlyname
     */
    get_FriendlyName() {
        Name := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * The put_FriendlyName method sets the localized, user-friendly name of the tuning space.
     * @param {BSTR} Name Specifies the user-friendly name.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_friendlyname
     */
    put_FriendlyName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, BSTR, Name, "HRESULT")
        return result
    }

    /**
     * The get_CLSID method gets the CLSID of the tuning space as a BSTR.
     * @remarks
     * This method provides script access to the <b>IPersist::GetClassID</b> method.
     * 
     * The returned CLSID represents the COM object that implements this tuning space. The CLSID is not guaranteed to be unique to this tuning space, however, because the same object may implement several tuning spaces.
     * @returns {BSTR} Pointer to a variable that receives a string representation of the tuning space CLSID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_clsid
     */
    get_CLSID() {
        SpaceCLSID := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, SpaceCLSID, "HRESULT")
        return SpaceCLSID
    }

    /**
     * The get_NetworkType method retrieves the network type of the tuning space as a BSTR.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @returns {BSTR} Pointer to a variable that receives a string containing the network type GUID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_networktype
     */
    get_NetworkType() {
        NetworkTypeGuid := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, NetworkTypeGuid, "HRESULT")
        return NetworkTypeGuid
    }

    /**
     * The put_NetworkType method specifies the network type of the tuning space as a BSTR.
     * @param {BSTR} NetworkTypeGuid Contains the string representation of the network type GUID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_networktype
     */
    put_NetworkType(NetworkTypeGuid) {
        NetworkTypeGuid := NetworkTypeGuid is String ? BSTR.Alloc(NetworkTypeGuid).Value : NetworkTypeGuid

        result := ComCall(13, this, BSTR, NetworkTypeGuid, "HRESULT")
        return result
    }

    /**
     * The get_NetworkType method retrieves the network type for this tuning space.
     * @returns {Guid} Pointer to a variable that receives the network type GUID. This GUID corresponds to the CLSID of the Network Provider for the tuning space. For some tuning spaces, the network type is GUID_NULL, which means the tuning space does not use a Network Provider filter.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get__networktype
     */
    get__NetworkType() {
        NetworkTypeGuid := Guid()
        result := ComCall(14, this, Guid.Ptr, NetworkTypeGuid, "HRESULT")
        return NetworkTypeGuid
    }

    /**
     * The put_NetworkType method specifies the network type of the tuning space.
     * @param {Pointer<Guid>} NetworkTypeGuid Specifies the network type GUID. This GUID corresponds to the CLSID of the Network Provider for the tuning space. The value GUID_NULL means the tuning space does not use a Network Provider filter.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put__networktype
     */
    put__NetworkType(NetworkTypeGuid) {
        result := ComCall(15, this, Guid.Ptr, NetworkTypeGuid, "HRESULT")
        return result
    }

    /**
     * The CreateTuneRequest method creates an empty (uninitialized) tune request.
     * @remarks
     * You can query the returned <b>ITuneRequest</b> pointer for derived interfaces. For more information, see the reference pages for the individual tuning space objects, which are listed in the topic <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/tuning-model-objects">Tuning Model Objects</a>.
     * @returns {ITuneRequest} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface of the new tune request object. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-createtunerequest
     */
    CreateTuneRequest() {
        result := ComCall(16, this, "ptr*", &_TuneRequest := 0, "HRESULT")
        return ITuneRequest(_TuneRequest)
    }

    /**
     * Currently not implemented.
     * @remarks
     * This method is hidden from automation languages.
     * @returns {IEnumGUID} Address of an <b>IEnumGUID</b> interface pointer that receives the returned enumeration object.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-enumcategoryguids
     */
    EnumCategoryGUIDs() {
        result := ComCall(17, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }

    /**
     * The EnumDeviceMonikers method creates an enumerator of device monikers representing the tuner filters that support this tuning space.
     * @remarks
     * This method is hidden from automation languages.
     * @returns {IEnumMoniker} Address of an <b>IEnumMoniker</b> interface pointer that receives the returned enumeration object.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-enumdevicemonikers
     */
    EnumDeviceMonikers() {
        result := ComCall(18, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumMoniker(ppEnum)
    }

    /**
     * The get_DefaultPreferredComponentTypes method returns a list of the default preferred component types for this tuning space.
     * @remarks
     * A component is a stream within the program. An example of a preferred component type would be an audio stream in English. When multiple components are available, the Tuner attempts to play the preferred ones first.
     * 
     * If the tuning space does not have any default preferred types, this method succeeds but returns the value <b>NULL</b> in the <i>ppComponentTypes</i> parameter. Check for a <b>NULL</b> value before attempting to dereference the pointer.
     * @returns {IComponentTypes} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttypes">IComponentTypes</a> interface pointer. Use this interface to enumerate the component types. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_defaultpreferredcomponenttypes
     */
    get_DefaultPreferredComponentTypes() {
        result := ComCall(19, this, "ptr*", &_ComponentTypes := 0, "HRESULT")
        return IComponentTypes(_ComponentTypes)
    }

    /**
     * The put_DefaultPreferredComponentTypes method specifies the default preferred component types for this tuning space.
     * @param {IComponentTypes} NewComponentTypes Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttypes">IComponentTypes</a> interface of the component types collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_defaultpreferredcomponenttypes
     */
    put_DefaultPreferredComponentTypes(NewComponentTypes) {
        result := ComCall(20, this, "ptr", NewComponentTypes, "HRESULT")
        return result
    }

    /**
     * The get_FrequencyMapping method retrieves the frequency mapping previously created by the network provider by a call to put_FrequencyMapping.
     * @remarks
     * The returned <b>BSTR</b> is treated as a binary blob. It is expected to contain embedded <b>NULL</b> values, and it may be formatted internally by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-network-provider-filter">BDA Network Provider</a>.
     * 
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @returns {BSTR} Pointer to a variable that receives the frequency mappings created by the Network Provider filter.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_frequencymapping
     */
    get_FrequencyMapping() {
        pMapping := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pMapping, "HRESULT")
        return pMapping
    }

    /**
     * The put_FrequencyMapping method creates a frequency/channel map, frequency/transponder map, or whatever other mapping from carrier frequencies to frequency identifiers is appropriate for the tuning space.
     * @remarks
     * This method is used by the network provider to store a string that contains the frequency mappings.
     * @param {BSTR} Mapping <b>BSTR</b> that contains the frequency mappings.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_frequencymapping
     */
    put_FrequencyMapping(Mapping) {
        Mapping := Mapping is String ? BSTR.Alloc(Mapping).Value : Mapping

        result := ComCall(22, this, BSTR, Mapping, "HRESULT")
        return result
    }

    /**
     * The get_DefaultLocator method retrieves the default locator for this tuning space.
     * @remarks
     * The tuning space might not have a default locator. It is the application's responsibility to provide a default locator for the tuning space if needed.
     * 
     * If the tuning space does not have a default locator, this method succeeds but returns the value <b>NULL</b> in the <i>ppLocatorVal</i> parameter. Check for a <b>NULL</b> value before attempting to dereference the pointer.
     * @returns {ILocator} Address of a variable that receives a pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilocator">ILocator</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_defaultlocator
     */
    get_DefaultLocator() {
        result := ComCall(23, this, "ptr*", &LocatorVal := 0, "HRESULT")
        return ILocator(LocatorVal)
    }

    /**
     * The put_DefaultLocator method sets the default locator for this tuning space.
     * @remarks
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ituningspace-get_defaultlocator">ITuningSpace::get_DefaultLocator</a> for more information about the default locator.
     * 
     * For DVB tuning spaces, the sytem type (cable, terrestrial, or satellite) of the tuning space must match the locator object. Otherwise, the method returns DISP_E_TYPEMISMATCH. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-idvbtuningspace-put_systemtype">IDVBTuningSpace::put_SystemType</a>.
     * @param {ILocator} LocatorVal Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilocator">ILocator</a> interface of the locator object.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_defaultlocator
     */
    put_DefaultLocator(LocatorVal) {
        result := ComCall(24, this, "ptr", LocatorVal, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the tuning space.
     * @returns {ITuningSpace} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface of the new tuning space object. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-clone
     */
    Clone() {
        result := ComCall(25, this, "ptr*", &NewTS := 0, "HRESULT")
        return ITuningSpace(NewTS)
    }

    Query(iid) {
        if (ITuningSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UniqueName := CallbackCreate(GetMethod(implObj, "get_UniqueName"), flags, 2)
        this.vtbl.put_UniqueName := CallbackCreate(GetMethod(implObj, "put_UniqueName"), flags, 2)
        this.vtbl.get_FriendlyName := CallbackCreate(GetMethod(implObj, "get_FriendlyName"), flags, 2)
        this.vtbl.put_FriendlyName := CallbackCreate(GetMethod(implObj, "put_FriendlyName"), flags, 2)
        this.vtbl.get_CLSID := CallbackCreate(GetMethod(implObj, "get_CLSID"), flags, 2)
        this.vtbl.get_NetworkType := CallbackCreate(GetMethod(implObj, "get_NetworkType"), flags, 2)
        this.vtbl.put_NetworkType := CallbackCreate(GetMethod(implObj, "put_NetworkType"), flags, 2)
        this.vtbl.get__NetworkType := CallbackCreate(GetMethod(implObj, "get__NetworkType"), flags, 2)
        this.vtbl.put__NetworkType := CallbackCreate(GetMethod(implObj, "put__NetworkType"), flags, 2)
        this.vtbl.CreateTuneRequest := CallbackCreate(GetMethod(implObj, "CreateTuneRequest"), flags, 2)
        this.vtbl.EnumCategoryGUIDs := CallbackCreate(GetMethod(implObj, "EnumCategoryGUIDs"), flags, 2)
        this.vtbl.EnumDeviceMonikers := CallbackCreate(GetMethod(implObj, "EnumDeviceMonikers"), flags, 2)
        this.vtbl.get_DefaultPreferredComponentTypes := CallbackCreate(GetMethod(implObj, "get_DefaultPreferredComponentTypes"), flags, 2)
        this.vtbl.put_DefaultPreferredComponentTypes := CallbackCreate(GetMethod(implObj, "put_DefaultPreferredComponentTypes"), flags, 2)
        this.vtbl.get_FrequencyMapping := CallbackCreate(GetMethod(implObj, "get_FrequencyMapping"), flags, 2)
        this.vtbl.put_FrequencyMapping := CallbackCreate(GetMethod(implObj, "put_FrequencyMapping"), flags, 2)
        this.vtbl.get_DefaultLocator := CallbackCreate(GetMethod(implObj, "get_DefaultLocator"), flags, 2)
        this.vtbl.put_DefaultLocator := CallbackCreate(GetMethod(implObj, "put_DefaultLocator"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UniqueName)
        CallbackFree(this.vtbl.put_UniqueName)
        CallbackFree(this.vtbl.get_FriendlyName)
        CallbackFree(this.vtbl.put_FriendlyName)
        CallbackFree(this.vtbl.get_CLSID)
        CallbackFree(this.vtbl.get_NetworkType)
        CallbackFree(this.vtbl.put_NetworkType)
        CallbackFree(this.vtbl.get__NetworkType)
        CallbackFree(this.vtbl.put__NetworkType)
        CallbackFree(this.vtbl.CreateTuneRequest)
        CallbackFree(this.vtbl.EnumCategoryGUIDs)
        CallbackFree(this.vtbl.EnumDeviceMonikers)
        CallbackFree(this.vtbl.get_DefaultPreferredComponentTypes)
        CallbackFree(this.vtbl.put_DefaultPreferredComponentTypes)
        CallbackFree(this.vtbl.get_FrequencyMapping)
        CallbackFree(this.vtbl.put_FrequencyMapping)
        CallbackFree(this.vtbl.get_DefaultLocator)
        CallbackFree(this.vtbl.put_DefaultLocator)
        CallbackFree(this.vtbl.Clone)
    }
}
