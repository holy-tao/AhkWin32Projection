#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumRegFilters.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltermapper
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterMapper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterMapper
     * @type {Guid}
     */
    static IID => Guid("{56a868a3-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterFilter", "RegisterFilterInstance", "RegisterPin", "RegisterPinType", "UnregisterFilter", "UnregisterFilterInstance", "UnregisterPin", "EnumMatchingFilters"]

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Adds a filter to the registry; the filter can then be enumerated.
     * @param {Guid} clsid Globally unique identifier (<b>GUID</b>) of the filter.
     * @param {PWSTR} Name Descriptive name for the filter.
     * @param {Integer} dwMerit Position in the order of enumeration. Filters with higher merit are enumerated first.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper-registerfilter
     */
    RegisterFilter(clsid, Name, dwMerit) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", clsid, "ptr", Name, "uint", dwMerit, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Registers an identifiable instance of a filter.
     * @param {Guid} clsid GUID of the filter.
     * @param {PWSTR} Name Descriptive name of the instance.
     * @returns {Guid} Pointer to the returned media resource ID. This parameter is a locally unique identifier for this instance of this filter.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper-registerfilterinstance
     */
    RegisterFilterInstance(clsid, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        MRId := Guid()
        result := ComCall(4, this, "ptr", clsid, "ptr", Name, "ptr", MRId, "HRESULT")
        return MRId
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Records the details of the pin in the registry.
     * @param {Guid} Filter GUID of the filter.
     * @param {PWSTR} Name Name of the pin. This should be unique within the filter. It has no significance other than to indicate type information. You should not use pin names longer than 99 characters, because this causes filter enumeration problems.
     * @param {BOOL} bRendered Value specifying whether the filter renders this input. Set to <b>TRUE</b> if it does; otherwise, set to <b>FALSE</b>.
     * @param {BOOL} bOutput Value specifying whether this is an output pin. Set to <b>TRUE</b> if it is; otherwise, set to <b>FALSE</b>.
     * @param {BOOL} bZero Value specifying whether the filter can have zero instances of this pin. If it can, set to <b>TRUE</b>; otherwise, set to <b>FALSE</b>. For example, a decompression filter doesn't need to create a sound output pin for a movie without a sound track.
     * @param {BOOL} bMany Value specifying whether the filter can have many instances of this pin. If it can, set to <b>TRUE</b>; otherwise, set to <b>FALSE</b>. For example, a mixer might have multiple instances of its input pin.
     * @param {Guid} ConnectsToFilter Reserved. Must be <b>NULL</b>. (This is intended for filters such as system-wide mixers that have connections outside the filter graph. It is not yet implemented.)
     * @param {PWSTR} ConnectsToPin Reserved. Must be <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper-registerpin
     */
    RegisterPin(Filter, Name, bRendered, bOutput, bZero, bMany, ConnectsToFilter, ConnectsToPin) {
        Name := Name is String ? StrPtr(Name) : Name
        ConnectsToPin := ConnectsToPin is String ? StrPtr(ConnectsToPin) : ConnectsToPin

        result := ComCall(5, this, "ptr", Filter, "ptr", Name, "int", bRendered, "int", bOutput, "int", bZero, "int", bMany, "ptr", ConnectsToFilter, "ptr", ConnectsToPin, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Registers this pin type.
     * @param {Guid} clsFilter Class identifier (CLSID) of the filter to which the pin belongs.
     * @param {PWSTR} strName Name by which it is known.
     * @param {Guid} clsMajorType Major type of the media sample supported by this pin class.
     * @param {Guid} clsSubType Subtype of the media sample supported by this pin class.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper-registerpintype
     */
    RegisterPinType(clsFilter, strName, clsMajorType, clsSubType) {
        strName := strName is String ? StrPtr(strName) : strName

        result := ComCall(6, this, "ptr", clsFilter, "ptr", strName, "ptr", clsMajorType, "ptr", clsSubType, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Removes the registration of this filter from the registry.
     * @param {Guid} Filter GUID of the filter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper-unregisterfilter
     */
    UnregisterFilter(Filter) {
        result := ComCall(7, this, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Removes the registration of this filter instance from the registry.
     * @param {Guid} MRId Media resource identifier of this instance.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper-unregisterfilterinstance
     */
    UnregisterFilterInstance(MRId) {
        result := ComCall(8, this, "ptr", MRId, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Removes the registration of this pin from the registry.
     * @param {Guid} Filter GUID of the filter that this pin is part of.
     * @param {PWSTR} Name Name of the pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper-unregisterpin
     */
    UnregisterPin(Filter, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(9, this, "ptr", Filter, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Provides an enumerator that enumerates registered filters that meet specified requirements.
     * @param {Integer} dwMerit Minimum merit value of filters to enumerate.
     * @param {BOOL} bInputNeeded Value indicating whether there must be at least one input pin; <b>TRUE</b> indicates at least one input pin is required.
     * @param {Guid} clsInMaj Input major type required. Set to GUID_NULL if you do not care.
     * @param {Guid} clsInSub Input subtype required. Set to GUID_NULL if you do not care.
     * @param {BOOL} bRender Flag that specifies whether the filter must render the input; <b>TRUE</b> means that it must.
     * @param {BOOL} bOututNeeded Value indicating whether there must be at least one output pin; <b>TRUE</b> indicates at least one output pin is required.
     * @param {Guid} clsOutMaj Output major type required. Set to GUID_NULL if you do not care.
     * @param {Guid} clsOutSub Output subtype required. Set to GUID_NULL if you do not care.
     * @returns {IEnumRegFilters} Address of a pointer to the enumerator returned.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper-enummatchingfilters
     */
    EnumMatchingFilters(dwMerit, bInputNeeded, clsInMaj, clsInSub, bRender, bOututNeeded, clsOutMaj, clsOutSub) {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "uint", dwMerit, "int", bInputNeeded, "ptr", clsInMaj, "ptr", clsInSub, "int", bRender, "int", bOututNeeded, "ptr", clsOutMaj, "ptr", clsOutSub, "HRESULT")
        return IEnumRegFilters(ppEnum)
    }
}
