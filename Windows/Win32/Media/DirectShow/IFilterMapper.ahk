#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumRegFilters.ahk" { IEnumRegFilters }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface has been deprecated. (IFilterMapper)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ifiltermapper
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFilterMapper extends IUnknown {
    /**
     * The interface identifier for IFilterMapper
     * @type {Guid}
     */
    static IID := Guid("{56a868a3-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterMapper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterFilter           : IntPtr
        RegisterFilterInstance   : IntPtr
        RegisterPin              : IntPtr
        RegisterPinType          : IntPtr
        UnregisterFilter         : IntPtr
        UnregisterFilterInstance : IntPtr
        UnregisterPin            : IntPtr
        EnumMatchingFilters      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterMapper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Adds a filter to the registry; the filter can then be enumerated.
     * @remarks
     * The merit (as defined by the <i>dwMerit</i> parameter) controls the order in which the filter graph manager tries filters when performing an operation as a result of a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-connect">IGraphBuilder::Connect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-render">IGraphBuilder::Render</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-renderfile">IGraphBuilder::RenderFile</a>. The filter graph manager finds all filters registered with the correct media type and then tries the one with the highest merit, using other criteria in the registration to choose between filters with equal merit.
     * @param {Guid} clsid Globally unique identifier (<b>GUID</b>) of the filter.
     * @param {PWSTR} Name Descriptive name for the filter.
     * @param {Integer} dwMerit Position in the order of enumeration. Filters with higher merit are enumerated first.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-registerfilter
     */
    RegisterFilter(clsid, Name, dwMerit) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, Guid, clsid, "ptr", Name, "uint", dwMerit, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Registers an identifiable instance of a filter.
     * @remarks
     * This method handles cases such as when two similar sound cards that are driven by the same driver are available, and it is necessary to choose which card will emit the sound. This is not needed if there is only one instance of the filter (such as when there is only one sound card in the computer), or if all instances of the filter are equivalent.
     * 
     * The filter itself must have already been registered.
     * @param {Guid} clsid GUID of the filter.
     * @param {PWSTR} Name Descriptive name of the instance.
     * @returns {Guid} Pointer to the returned media resource ID. This parameter is a locally unique identifier for this instance of this filter.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-registerfilterinstance
     */
    RegisterFilterInstance(clsid, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        MRId := Guid()
        result := ComCall(4, this, Guid, clsid, "ptr", Name, Guid.Ptr, MRId, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-registerpin
     */
    RegisterPin(Filter, Name, bRendered, bOutput, bZero, bMany, ConnectsToFilter, ConnectsToPin) {
        Name := Name is String ? StrPtr(Name) : Name
        ConnectsToPin := ConnectsToPin is String ? StrPtr(ConnectsToPin) : ConnectsToPin

        result := ComCall(5, this, Guid, Filter, "ptr", Name, BOOL, bRendered, BOOL, bOutput, BOOL, bZero, BOOL, bMany, Guid, ConnectsToFilter, "ptr", ConnectsToPin, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Registers this pin type.
     * @remarks
     * The <i>clsMajorType</i> and <i>clsSubType</i> parameters specify the media type of the pin and correspond to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure's <b>majortype</b> and <b>subtype</b> members, respectively.
     * @param {Guid} clsFilter Class identifier (CLSID) of the filter to which the pin belongs.
     * @param {PWSTR} strName Name by which it is known.
     * @param {Guid} clsMajorType Major type of the media sample supported by this pin class.
     * @param {Guid} clsSubType Subtype of the media sample supported by this pin class.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-registerpintype
     */
    RegisterPinType(clsFilter, strName, clsMajorType, clsSubType) {
        strName := strName is String ? StrPtr(strName) : strName

        result := ComCall(6, this, Guid, clsFilter, "ptr", strName, Guid, clsMajorType, Guid, clsSubType, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Removes the registration of this filter from the registry.
     * @param {Guid} Filter GUID of the filter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-unregisterfilter
     */
    UnregisterFilter(Filter) {
        result := ComCall(7, this, Guid, Filter, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Removes the registration of this filter instance from the registry.
     * @param {Guid} MRId Media resource identifier of this instance.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-unregisterfilterinstance
     */
    UnregisterFilterInstance(MRId) {
        result := ComCall(8, this, Guid, MRId, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Removes the registration of this pin from the registry.
     * @param {Guid} Filter GUID of the filter that this pin is part of.
     * @param {PWSTR} Name Name of the pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-unregisterpin
     */
    UnregisterPin(Filter, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(9, this, Guid, Filter, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * Note  The IFilterMapper interface is deprecated. Use IFilterMapper2 instead. Provides an enumerator that enumerates registered filters that meet specified requirements.
     * @remarks
     * Set the <i>ppEnum</i> parameter to be an enumerator for filters matching the requirements. For a description of merit values for the <i>dwMerit</i> parameter, see the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltermapper-registerfilter">IFilterMapper::RegisterFilter</a> method.
     * @param {Integer} dwMerit Minimum merit value of filters to enumerate.
     * @param {BOOL} bInputNeeded Value indicating whether there must be at least one input pin; <b>TRUE</b> indicates at least one input pin is required.
     * @param {Guid} clsInMaj Input major type required. Set to GUID_NULL if you do not care.
     * @param {Guid} clsInSub Input subtype required. Set to GUID_NULL if you do not care.
     * @param {BOOL} bRender Flag that specifies whether the filter must render the input; <b>TRUE</b> means that it must.
     * @param {BOOL} bOututNeeded Value indicating whether there must be at least one output pin; <b>TRUE</b> indicates at least one output pin is required.
     * @param {Guid} clsOutMaj Output major type required. Set to GUID_NULL if you do not care.
     * @param {Guid} clsOutSub Output subtype required. Set to GUID_NULL if you do not care.
     * @returns {IEnumRegFilters} Address of a pointer to the enumerator returned.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-enummatchingfilters
     */
    EnumMatchingFilters(dwMerit, bInputNeeded, clsInMaj, clsInSub, bRender, bOututNeeded, clsOutMaj, clsOutSub) {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "uint", dwMerit, BOOL, bInputNeeded, Guid, clsInMaj, Guid, clsInSub, BOOL, bRender, BOOL, bOututNeeded, Guid, clsOutMaj, Guid, clsOutSub, "HRESULT")
        return IEnumRegFilters(ppEnum)
    }

    Query(iid) {
        if (IFilterMapper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterFilter := CallbackCreate(GetMethod(implObj, "RegisterFilter"), flags, 4)
        this.vtbl.RegisterFilterInstance := CallbackCreate(GetMethod(implObj, "RegisterFilterInstance"), flags, 4)
        this.vtbl.RegisterPin := CallbackCreate(GetMethod(implObj, "RegisterPin"), flags, 9)
        this.vtbl.RegisterPinType := CallbackCreate(GetMethod(implObj, "RegisterPinType"), flags, 5)
        this.vtbl.UnregisterFilter := CallbackCreate(GetMethod(implObj, "UnregisterFilter"), flags, 2)
        this.vtbl.UnregisterFilterInstance := CallbackCreate(GetMethod(implObj, "UnregisterFilterInstance"), flags, 2)
        this.vtbl.UnregisterPin := CallbackCreate(GetMethod(implObj, "UnregisterPin"), flags, 3)
        this.vtbl.EnumMatchingFilters := CallbackCreate(GetMethod(implObj, "EnumMatchingFilters"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterFilter)
        CallbackFree(this.vtbl.RegisterFilterInstance)
        CallbackFree(this.vtbl.RegisterPin)
        CallbackFree(this.vtbl.RegisterPinType)
        CallbackFree(this.vtbl.UnregisterFilter)
        CallbackFree(this.vtbl.UnregisterFilterInstance)
        CallbackFree(this.vtbl.UnregisterPin)
        CallbackFree(this.vtbl.EnumMatchingFilters)
    }
}
