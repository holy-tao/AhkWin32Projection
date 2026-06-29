#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\REGPINMEDIUM.ahk" { REGPINMEDIUM }
#Import "..\..\System\Com\IEnumMoniker.ahk" { IEnumMoniker }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\REGFILTER2.ahk" { REGFILTER2 }

/**
 * Registers and unregisters filters, and locates filters in the registry.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ifiltermapper2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFilterMapper2 extends IUnknown {
    /**
     * The interface identifier for IFilterMapper2
     * @type {Guid}
     */
    static IID := Guid("{b79bb0b0-33c1-11d1-abe1-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterMapper2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateCategory      : IntPtr
        UnregisterFilter    : IntPtr
        RegisterFilter      : IntPtr
        EnumMatchingFilters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterMapper2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreateCategory method adds a new filter category to the registry.
     * @remarks
     * The filter graph manager initially skips all categories with a merit value less than or equal to MERIT_DO_NOT_USE, to speed up the graph-building process. Filter categories that should not be considered for playback should have a merit of MERIT_DO_NOT_USE or less.
     * 
     * A filter can appear in one or more categories (for example, Video Compressors) to restrict the search space.
     * @param {Pointer<Guid>} clsidCategory Class identifier (CLSID) of the new filter category.
     * @param {Integer} dwCategoryMerit <a href="https://docs.microsoft.com/windows/desktop/DirectShow/merit">Merit</a> of the category. Categories with higher merit are enumerated first.
     * @param {PWSTR} Description Descriptive name for the category.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper2-createcategory
     */
    CreateCategory(clsidCategory, dwCategoryMerit, Description) {
        Description := Description is String ? StrPtr(Description) : Description

        result := ComCall(3, this, Guid.Ptr, clsidCategory, "uint", dwCategoryMerit, "ptr", Description, "HRESULT")
        return result
    }

    /**
     * The UnregisterFilter method removes filter information from the registry.
     * @remarks
     * If the filter was not registered, the method might return an error.
     * @param {Pointer<Guid>} pclsidCategory Address of a GUID that specifies the filter category from which to remove the filter. For a list of categories, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-categories">Filter Categories</a>.
     * @param {PWSTR} szInstance Instance data used to construct the device moniker's display name. Use the value that was originally passed to the <b>RegisterFilter</b> method.
     * @param {Pointer<Guid>} Filter Class identifier (CLSID) of the filter.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper2-unregisterfilter
     */
    UnregisterFilter(pclsidCategory, szInstance, Filter) {
        szInstance := szInstance is String ? StrPtr(szInstance) : szInstance

        result := ComCall(4, this, Guid.Ptr, pclsidCategory, "ptr", szInstance, Guid.Ptr, Filter, "HRESULT")
        return result
    }

    /**
     * The RegisterFilter method adds filter information to the registry.
     * @remarks
     * This method adds information about the filter to the registry, under the registry entry for the specified filter category. It does not register the in-process server that creates the filter (usually a DLL). To register the server, you can call the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/amoviedllregisterserver2">AMovieDllRegisterServer2</a> function.
     * 
     * For the <i>ppMoniker</i> parameter, use one of the following:
     * 
     * <ul>
     * <li>The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface pointer for an existing device moniker</li>
     * <li>The address of a <b>NULL</b><b>IMoniker</b> interface pointer</li>
     * <li><b>NULL</b></li>
     * </ul>
     * If you are registering a filter for a Windows Driver Model (WDM) or Plug and Play device, pass the address of the existing device moniker. The filter will be registered using this moniker. When the method returns, <i>*ppMoniker</i> is set to <b>NULL</b>.
     * 
     * Otherwise, the method creates a new moniker. If <i>ppMoniker</i> is non-<b>NULL</b>, the method sets <i>*ppMoniker</i> to point to the new moniker. The application can use this moniker to write additional private values in the property bag. Be sure to release the interface.
     * 
     * Set <i>ppMoniker</i> to <b>NULL</b> if you don't want to provide or receive the moniker.
     * @param {Pointer<Guid>} clsidFilter Class identifier (CLSID) of the filter.
     * @param {PWSTR} Name Descriptive name for the filter.
     * @param {Pointer<IMoniker>} ppMoniker Address of a pointer to a device moniker that determines where this filter's data will be written. Can be <b>NULL</b>.
     * @param {Pointer<Guid>} pclsidCategory Pointer to the filter category of the filter. If <b>NULL</b>, the default category is CLSID_ActiveMovieFilters. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-categories">Filter Categories</a>.)
     * @param {PWSTR} szInstance Instance data for constructing the device moniker's display name. Can be the friendly name, or the string representation of the filter CLSID. If <b>NULL</b>, defaults to the filter CLSID.
     * @param {Pointer<REGFILTER2>} prf2 Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilter2">REGFILTER2</a> structure containing filter information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_BAD_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not get registry key.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper2-registerfilter
     */
    RegisterFilter(clsidFilter, Name, ppMoniker, pclsidCategory, szInstance, prf2) {
        Name := Name is String ? StrPtr(Name) : Name
        szInstance := szInstance is String ? StrPtr(szInstance) : szInstance

        result := ComCall(5, this, Guid.Ptr, clsidFilter, "ptr", Name, IMoniker.Ptr, ppMoniker, Guid.Ptr, pclsidCategory, "ptr", szInstance, REGFILTER2.Ptr, prf2, "HRESULT")
        return result
    }

    /**
     * The EnumMatchingFilters method enumerates registered filters that meet specified requirements.
     * @remarks
     * To find filters whose input pins match a given set of media types, declare an array with major-type GUIDs and subtype GUIDs ordered in pairs. Pass the array address in the <i>pInputTypes</i> parameter, and set the <i>cInputTypes</i> parameter equal to the number of pairs (that is, half the array size):
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * GUID arrayInTypes[2];
     * arrayInTypes[0] = MEDIATYPE_Video;
     * arrayInTypes[1] = GUID_NULL;
     * 
     * DWORD cInTypes = 1;
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * For output pins, pass a similar array in the <i>pOutputTypes</i> parameter, and specify the number of GUID pairs in the <i>cOutputTypes</i> parameter.
     * 
     * If the value of the <i>bExactMatch</i> parameter is <b>TRUE</b>, this method looks for filters that exactly match the values you specify for media type, pin category, and pin medium. If the value is <b>FALSE</b>, filters that register a value of <b>NULL</b> for any of these items are considered a match. (In effect, a <b>NULL</b> value in the registry acts as a wildcard.)
     * 
     * If you specify <b>NULL</b> for media type, pin category, or pin medium, any filter is considered a match for that parameter.
     * 
     * If a pin did not register any media types, this method will not consider it a match for the media type.
     * @param {Integer} dwFlags Reserved, must be zero.
     * @param {BOOL} bExactMatch Boolean value indicating whether an exact match is required. See Remarks for more information.
     * @param {Integer} dwMerit Minimum merit value. The enumeration excludes filters with a lesser merit value. For a list of merit values, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/merit">Merit</a>. If <i>dwMerit</i> is higher than MERIT_DO_NOT_USE, the enumeration also excludes filters whose category has a merit less than or equal to MERIT_DO_NOT_USE. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-categories">Filter Categories</a>.)
     * @param {BOOL} bInputNeeded Boolean value indicating whether the filter must have an input pin. If the value is <b>TRUE</b>, the filter must have at least one input pin.
     * @param {Integer} cInputTypes Number of input media types specified in <i>pInputTypes</i>.
     * @param {Pointer<Guid>} pInputTypes Pointer to an array of GUID pairs that specify major types and subtypes, for the input pins to match. The size of the array is 2 * <i>cInputTypes</i>. The array can be <b>NULL</b>. Individual array members can be GUID_NULL, which matches any type. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/media-types">Media Types</a>.)
     * @param {Pointer<REGPINMEDIUM>} pMedIn Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regpinmedium">REGPINMEDIUM</a> structure specifying the medium for the input pins. Set to <b>NULL</b> if not needed.
     * @param {Pointer<Guid>} pPinCategoryIn Pointer to a GUID that specifies the input pin category. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>.) Set to <b>NULL</b> if not needed.
     * @param {BOOL} bRender Boolean value that specifies whether the filter must render its input. If <b>TRUE</b>, the specified filter must render its input. (This value corresponds to the <b>bRendered</b> field in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilterpins">REGFILTERPINS</a> structure, which is used to register information about the filter's pins.)
     * @param {BOOL} bOutputNeeded Boolean value specifying whether the filter must have an output pin. If <b>TRUE</b>, the filter must have at least one output pin.
     * @param {Integer} cOutputTypes Number of input media types specified in <i>pOutputTypes</i>.
     * @param {Pointer<Guid>} pOutputTypes Pointer to an array of GUID pairs that specify major types and subtypes, for the output pins to match. The size of the array is 2 * <i>cOutputTypes</i>. The array can be <b>NULL</b>. Individual array members can be GUID_NULL, which matches any type.
     * @param {Pointer<REGPINMEDIUM>} pMedOut Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regpinmedium">REGPINMEDIUM</a> structure specifying the medium for the output pins. Set to <b>NULL</b> if not needed.
     * @param {Pointer<Guid>} pPinCategoryOut Pointer to a GUID that specifies the output pin category. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>.) Set to <b>NULL</b> if not needed.
     * @returns {IEnumMoniker} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienummoniker">IEnumMoniker</a> interface. Use this interface pointer to retrieve filter monikers from the enumeration. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper2-enummatchingfilters
     */
    EnumMatchingFilters(dwFlags, bExactMatch, dwMerit, bInputNeeded, cInputTypes, pInputTypes, pMedIn, pPinCategoryIn, bRender, bOutputNeeded, cOutputTypes, pOutputTypes, pMedOut, pPinCategoryOut) {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "uint", dwFlags, BOOL, bExactMatch, "uint", dwMerit, BOOL, bInputNeeded, "uint", cInputTypes, Guid.Ptr, pInputTypes, REGPINMEDIUM.Ptr, pMedIn, Guid.Ptr, pPinCategoryIn, BOOL, bRender, BOOL, bOutputNeeded, "uint", cOutputTypes, Guid.Ptr, pOutputTypes, REGPINMEDIUM.Ptr, pMedOut, Guid.Ptr, pPinCategoryOut, "HRESULT")
        return IEnumMoniker(ppEnum)
    }

    Query(iid) {
        if (IFilterMapper2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateCategory := CallbackCreate(GetMethod(implObj, "CreateCategory"), flags, 4)
        this.vtbl.UnregisterFilter := CallbackCreate(GetMethod(implObj, "UnregisterFilter"), flags, 4)
        this.vtbl.RegisterFilter := CallbackCreate(GetMethod(implObj, "RegisterFilter"), flags, 7)
        this.vtbl.EnumMatchingFilters := CallbackCreate(GetMethod(implObj, "EnumMatchingFilters"), flags, 16)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateCategory)
        CallbackFree(this.vtbl.UnregisterFilter)
        CallbackFree(this.vtbl.RegisterFilter)
        CallbackFree(this.vtbl.EnumMatchingFilters)
    }
}
