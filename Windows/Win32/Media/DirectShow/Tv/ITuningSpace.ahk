#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITuneRequest.ahk
#Include ..\..\..\System\Com\IEnumGUID.ahk
#Include ..\..\..\System\Com\IEnumMoniker.ahk
#Include .\IComponentTypes.ahk
#Include .\ILocator.ahk
#Include .\ITuningSpace.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITuningSpace interface provides the common functionality for all network-specific tuning spaces.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuningSpace)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ituningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITuningSpace extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITuningSpace
     * @type {Guid}
     */
    static IID => Guid("{061c6e30-e622-11d2-9493-00c04f72d980}")

    /**
     * The class identifier for TuningSpace
     * @type {Guid}
     */
    static CLSID => Guid("{5ffdc5e6-b83a-4b55-b6e8-c69e765fe9db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UniqueName", "put_UniqueName", "get_FriendlyName", "put_FriendlyName", "get_CLSID", "get_NetworkType", "put_NetworkType", "get__NetworkType", "put__NetworkType", "CreateTuneRequest", "EnumCategoryGUIDs", "EnumDeviceMonikers", "get_DefaultPreferredComponentTypes", "put_DefaultPreferredComponentTypes", "get_FrequencyMapping", "put_FrequencyMapping", "get_DefaultLocator", "put_DefaultLocator", "Clone"]

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
     * @returns {BSTR} Pointer to a variable that receives the unique name.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-get_uniquename
     */
    get_UniqueName() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * The put_UniqueName method sets a unique name for the tuning space.
     * @param {BSTR} Name Variable of type <b>BSTR</b> that specifies the unique name.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-put_uniquename
     */
    put_UniqueName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * The get_FriendlyName method retrieves the localized, user-friendly name of the tuning space.
     * @returns {BSTR} Pointer to a variable receives the user-friendly name.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-get_friendlyname
     */
    get_FriendlyName() {
        Name := BSTR()
        result := ComCall(9, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * The put_FriendlyName method sets the localized, user-friendly name of the tuning space.
     * @param {BSTR} Name Specifies the user-friendly name.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-put_friendlyname
     */
    put_FriendlyName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * The get_CLSID method gets the CLSID of the tuning space as a BSTR.
     * @returns {BSTR} Pointer to a variable that receives a string representation of the tuning space CLSID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-get_clsid
     */
    get_CLSID() {
        SpaceCLSID := BSTR()
        result := ComCall(11, this, "ptr", SpaceCLSID, "HRESULT")
        return SpaceCLSID
    }

    /**
     * The get_NetworkType method retrieves the network type of the tuning space as a BSTR.
     * @returns {BSTR} Pointer to a variable that receives a string containing the network type GUID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-get_networktype
     */
    get_NetworkType() {
        NetworkTypeGuid := BSTR()
        result := ComCall(12, this, "ptr", NetworkTypeGuid, "HRESULT")
        return NetworkTypeGuid
    }

    /**
     * The put_NetworkType method specifies the network type of the tuning space as a BSTR.
     * @param {BSTR} NetworkTypeGuid Contains the string representation of the network type GUID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-put_networktype
     */
    put_NetworkType(NetworkTypeGuid) {
        NetworkTypeGuid := NetworkTypeGuid is String ? BSTR.Alloc(NetworkTypeGuid).Value : NetworkTypeGuid

        result := ComCall(13, this, "ptr", NetworkTypeGuid, "HRESULT")
        return result
    }

    /**
     * The get_NetworkType method retrieves the network type for this tuning space.
     * @returns {Guid} Pointer to a variable that receives the network type GUID. This GUID corresponds to the CLSID of the Network Provider for the tuning space. For some tuning spaces, the network type is GUID_NULL, which means the tuning space does not use a Network Provider filter.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-get__networktype
     */
    get__NetworkType() {
        NetworkTypeGuid := Guid()
        result := ComCall(14, this, "ptr", NetworkTypeGuid, "HRESULT")
        return NetworkTypeGuid
    }

    /**
     * The put_NetworkType method specifies the network type of the tuning space.
     * @param {Pointer<Guid>} NetworkTypeGuid Specifies the network type GUID. This GUID corresponds to the CLSID of the Network Provider for the tuning space. The value GUID_NULL means the tuning space does not use a Network Provider filter.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-put__networktype
     */
    put__NetworkType(NetworkTypeGuid) {
        result := ComCall(15, this, "ptr", NetworkTypeGuid, "HRESULT")
        return result
    }

    /**
     * The CreateTuneRequest method creates an empty (uninitialized) tune request.
     * @returns {ITuneRequest} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface of the new tune request object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-createtunerequest
     */
    CreateTuneRequest() {
        result := ComCall(16, this, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * Currently not implemented.
     * @returns {IEnumGUID} Address of an <b>IEnumGUID</b> interface pointer that receives the returned enumeration object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-enumcategoryguids
     */
    EnumCategoryGUIDs() {
        result := ComCall(17, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }

    /**
     * The EnumDeviceMonikers method creates an enumerator of device monikers representing the tuner filters that support this tuning space.
     * @returns {IEnumMoniker} Address of an <b>IEnumMoniker</b> interface pointer that receives the returned enumeration object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-enumdevicemonikers
     */
    EnumDeviceMonikers() {
        result := ComCall(18, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumMoniker(ppEnum)
    }

    /**
     * The get_DefaultPreferredComponentTypes method returns an list of the default preferred component types for this tuning space.
     * @returns {IComponentTypes} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttypes">IComponentTypes</a> interface pointer. Use this interface to enumerate the component types. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-get_defaultpreferredcomponenttypes
     */
    get_DefaultPreferredComponentTypes() {
        result := ComCall(19, this, "ptr*", &ComponentTypes := 0, "HRESULT")
        return IComponentTypes(ComponentTypes)
    }

    /**
     * The put_DefaultPreferredComponentTypes method specifies the default preferred component types for this tuning space.
     * @param {IComponentTypes} NewComponentTypes Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttypes">IComponentTypes</a> interface of the component types collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-put_defaultpreferredcomponenttypes
     */
    put_DefaultPreferredComponentTypes(NewComponentTypes) {
        result := ComCall(20, this, "ptr", NewComponentTypes, "HRESULT")
        return result
    }

    /**
     * The get_FrequencyMapping method retrieves the frequency mapping previously created by the network provider by a call to put_FrequencyMapping.
     * @returns {BSTR} Pointer to a variable that receives the frequency mappings created by the Network Provider filter.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-get_frequencymapping
     */
    get_FrequencyMapping() {
        pMapping := BSTR()
        result := ComCall(21, this, "ptr", pMapping, "HRESULT")
        return pMapping
    }

    /**
     * The put_FrequencyMapping method creates a frequency/channel map, frequency/transponder map, or whatever other mapping from carrier frequencies to frequency identifiers is appropriate for the tuning space.
     * @param {BSTR} Mapping <b>BSTR</b> that contains the frequency mappings.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-put_frequencymapping
     */
    put_FrequencyMapping(Mapping) {
        Mapping := Mapping is String ? BSTR.Alloc(Mapping).Value : Mapping

        result := ComCall(22, this, "ptr", Mapping, "HRESULT")
        return result
    }

    /**
     * The get_DefaultLocator method retrieves the default locator for this tuning space.
     * @returns {ILocator} Address of a variable that receives a pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilocator">ILocator</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-get_defaultlocator
     */
    get_DefaultLocator() {
        result := ComCall(23, this, "ptr*", &LocatorVal := 0, "HRESULT")
        return ILocator(LocatorVal)
    }

    /**
     * The put_DefaultLocator method sets the default locator for this tuning space.
     * @param {ILocator} LocatorVal Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilocator">ILocator</a> interface of the locator object.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-put_defaultlocator
     */
    put_DefaultLocator(LocatorVal) {
        result := ComCall(24, this, "ptr", LocatorVal, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the tuning space.
     * @returns {ITuningSpace} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface of the new tuning space object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspace-clone
     */
    Clone() {
        result := ComCall(25, this, "ptr*", &NewTS := 0, "HRESULT")
        return ITuningSpace(NewTS)
    }
}
