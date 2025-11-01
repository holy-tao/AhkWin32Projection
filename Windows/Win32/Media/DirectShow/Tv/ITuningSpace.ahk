#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_uniquename
     */
    get_UniqueName(Name) {
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_friendlyname
     */
    get_FriendlyName(Name) {
        result := ComCall(9, this, "ptr", Name, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} SpaceCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_clsid
     */
    get_CLSID(SpaceCLSID) {
        result := ComCall(11, this, "ptr", SpaceCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} NetworkTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_networktype
     */
    get_NetworkType(NetworkTypeGuid) {
        result := ComCall(12, this, "ptr", NetworkTypeGuid, "HRESULT")
        return result
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
     * @param {Pointer<Guid>} NetworkTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get__networktype
     */
    get__NetworkType(NetworkTypeGuid) {
        result := ComCall(14, this, "ptr", NetworkTypeGuid, "HRESULT")
        return result
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
     * @param {Pointer<ITuneRequest>} TuneRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-createtunerequest
     */
    CreateTuneRequest(TuneRequest) {
        result := ComCall(16, this, "ptr*", TuneRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumGUID>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-enumcategoryguids
     */
    EnumCategoryGUIDs(ppEnum) {
        result := ComCall(17, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMoniker>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-enumdevicemonikers
     */
    EnumDeviceMonikers(ppEnum) {
        result := ComCall(18, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IComponentTypes>} ComponentTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_defaultpreferredcomponenttypes
     */
    get_DefaultPreferredComponentTypes(ComponentTypes) {
        result := ComCall(19, this, "ptr*", ComponentTypes, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pMapping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_frequencymapping
     */
    get_FrequencyMapping(pMapping) {
        result := ComCall(21, this, "ptr", pMapping, "HRESULT")
        return result
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
     * @param {Pointer<ILocator>} LocatorVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-get_defaultlocator
     */
    get_DefaultLocator(LocatorVal) {
        result := ComCall(23, this, "ptr*", LocatorVal, "HRESULT")
        return result
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
     * @param {Pointer<ITuningSpace>} NewTS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspace-clone
     */
    Clone(NewTS) {
        result := ComCall(25, this, "ptr*", NewTS, "HRESULT")
        return result
    }
}
