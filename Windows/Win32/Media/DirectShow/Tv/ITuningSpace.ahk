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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_uniquename
     */
    get_UniqueName() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_uniquename
     */
    put_UniqueName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_friendlyname
     */
    get_FriendlyName() {
        Name := BSTR()
        result := ComCall(9, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_friendlyname
     */
    put_FriendlyName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_clsid
     */
    get_CLSID() {
        SpaceCLSID := BSTR()
        result := ComCall(11, this, "ptr", SpaceCLSID, "HRESULT")
        return SpaceCLSID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_networktype
     */
    get_NetworkType() {
        NetworkTypeGuid := BSTR()
        result := ComCall(12, this, "ptr", NetworkTypeGuid, "HRESULT")
        return NetworkTypeGuid
    }

    /**
     * 
     * @param {BSTR} NetworkTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_networktype
     */
    put_NetworkType(NetworkTypeGuid) {
        NetworkTypeGuid := NetworkTypeGuid is String ? BSTR.Alloc(NetworkTypeGuid).Value : NetworkTypeGuid

        result := ComCall(13, this, "ptr", NetworkTypeGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get__networktype
     */
    get__NetworkType() {
        NetworkTypeGuid := Guid()
        result := ComCall(14, this, "ptr", NetworkTypeGuid, "HRESULT")
        return NetworkTypeGuid
    }

    /**
     * 
     * @param {Pointer<Guid>} NetworkTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put__networktype
     */
    put__NetworkType(NetworkTypeGuid) {
        result := ComCall(15, this, "ptr", NetworkTypeGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITuneRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-createtunerequest
     */
    CreateTuneRequest() {
        result := ComCall(16, this, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * 
     * @returns {IEnumGUID} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-enumcategoryguids
     */
    EnumCategoryGUIDs() {
        result := ComCall(17, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }

    /**
     * 
     * @returns {IEnumMoniker} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-enumdevicemonikers
     */
    EnumDeviceMonikers() {
        result := ComCall(18, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumMoniker(ppEnum)
    }

    /**
     * 
     * @returns {IComponentTypes} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_defaultpreferredcomponenttypes
     */
    get_DefaultPreferredComponentTypes() {
        result := ComCall(19, this, "ptr*", &ComponentTypes := 0, "HRESULT")
        return IComponentTypes(ComponentTypes)
    }

    /**
     * 
     * @param {IComponentTypes} NewComponentTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_defaultpreferredcomponenttypes
     */
    put_DefaultPreferredComponentTypes(NewComponentTypes) {
        result := ComCall(20, this, "ptr", NewComponentTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_frequencymapping
     */
    get_FrequencyMapping() {
        pMapping := BSTR()
        result := ComCall(21, this, "ptr", pMapping, "HRESULT")
        return pMapping
    }

    /**
     * 
     * @param {BSTR} Mapping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_frequencymapping
     */
    put_FrequencyMapping(Mapping) {
        Mapping := Mapping is String ? BSTR.Alloc(Mapping).Value : Mapping

        result := ComCall(22, this, "ptr", Mapping, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ILocator} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_defaultlocator
     */
    get_DefaultLocator() {
        result := ComCall(23, this, "ptr*", &LocatorVal := 0, "HRESULT")
        return ILocator(LocatorVal)
    }

    /**
     * 
     * @param {ILocator} LocatorVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-put_defaultlocator
     */
    put_DefaultLocator(LocatorVal) {
        result := ComCall(24, this, "ptr", LocatorVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITuningSpace} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-clone
     */
    Clone() {
        result := ComCall(25, this, "ptr*", &NewTS := 0, "HRESULT")
        return ITuningSpace(NewTS)
    }
}
