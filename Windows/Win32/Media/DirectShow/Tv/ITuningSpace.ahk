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
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_UniqueName(Name) {
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     */
    put_UniqueName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_FriendlyName(Name) {
        result := ComCall(9, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     */
    put_FriendlyName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} SpaceCLSID 
     * @returns {HRESULT} 
     */
    get_CLSID(SpaceCLSID) {
        result := ComCall(11, this, "ptr", SpaceCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} NetworkTypeGuid 
     * @returns {HRESULT} 
     */
    get_NetworkType(NetworkTypeGuid) {
        result := ComCall(12, this, "ptr", NetworkTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} NetworkTypeGuid 
     * @returns {HRESULT} 
     */
    put_NetworkType(NetworkTypeGuid) {
        NetworkTypeGuid := NetworkTypeGuid is String ? BSTR.Alloc(NetworkTypeGuid).Value : NetworkTypeGuid

        result := ComCall(13, this, "ptr", NetworkTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} NetworkTypeGuid 
     * @returns {HRESULT} 
     */
    get__NetworkType(NetworkTypeGuid) {
        result := ComCall(14, this, "ptr", NetworkTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} NetworkTypeGuid 
     * @returns {HRESULT} 
     */
    put__NetworkType(NetworkTypeGuid) {
        result := ComCall(15, this, "ptr", NetworkTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuneRequest>} TuneRequest 
     * @returns {HRESULT} 
     */
    CreateTuneRequest(TuneRequest) {
        result := ComCall(16, this, "ptr", TuneRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumGUID>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumCategoryGUIDs(ppEnum) {
        result := ComCall(17, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMoniker>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumDeviceMonikers(ppEnum) {
        result := ComCall(18, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponentTypes>} ComponentTypes 
     * @returns {HRESULT} 
     */
    get_DefaultPreferredComponentTypes(ComponentTypes) {
        result := ComCall(19, this, "ptr", ComponentTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponentTypes>} NewComponentTypes 
     * @returns {HRESULT} 
     */
    put_DefaultPreferredComponentTypes(NewComponentTypes) {
        result := ComCall(20, this, "ptr", NewComponentTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pMapping 
     * @returns {HRESULT} 
     */
    get_FrequencyMapping(pMapping) {
        result := ComCall(21, this, "ptr", pMapping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Mapping 
     * @returns {HRESULT} 
     */
    put_FrequencyMapping(Mapping) {
        Mapping := Mapping is String ? BSTR.Alloc(Mapping).Value : Mapping

        result := ComCall(22, this, "ptr", Mapping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ILocator>} LocatorVal 
     * @returns {HRESULT} 
     */
    get_DefaultLocator(LocatorVal) {
        result := ComCall(23, this, "ptr", LocatorVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ILocator>} LocatorVal 
     * @returns {HRESULT} 
     */
    put_DefaultLocator(LocatorVal) {
        result := ComCall(24, this, "ptr", LocatorVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuningSpace>} NewTS 
     * @returns {HRESULT} 
     */
    Clone(NewTS) {
        result := ComCall(25, this, "ptr", NewTS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
