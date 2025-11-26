#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumMoniker.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers and unregisters filters, and locates filters in the registry.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltermapper2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterMapper2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterMapper2
     * @type {Guid}
     */
    static IID => Guid("{b79bb0b0-33c1-11d1-abe1-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCategory", "UnregisterFilter", "RegisterFilter", "EnumMatchingFilters"]

    /**
     * The CreateCategory method adds a new filter category to the registry.
     * @param {Pointer<Guid>} clsidCategory Class identifier (CLSID) of the new filter category.
     * @param {Integer} dwCategoryMerit <a href="https://docs.microsoft.com/windows/desktop/DirectShow/merit">Merit</a> of the category. Categories with higher merit are enumerated first.
     * @param {PWSTR} Description Descriptive name for the category.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper2-createcategory
     */
    CreateCategory(clsidCategory, dwCategoryMerit, Description) {
        Description := Description is String ? StrPtr(Description) : Description

        result := ComCall(3, this, "ptr", clsidCategory, "uint", dwCategoryMerit, "ptr", Description, "HRESULT")
        return result
    }

    /**
     * The UnregisterFilter method removes filter information from the registry.
     * @param {Pointer<Guid>} pclsidCategory Address of a GUID that specifies the filter category from which to remove the filter. For a list of categories, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-categories">Filter Categories</a>.
     * @param {PWSTR} szInstance Instance data used to construct the device moniker's display name. Use the value that was originally passed to the <b>RegisterFilter</b> method.
     * @param {Pointer<Guid>} Filter Class identifier (CLSID) of the filter.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper2-unregisterfilter
     */
    UnregisterFilter(pclsidCategory, szInstance, Filter) {
        szInstance := szInstance is String ? StrPtr(szInstance) : szInstance

        result := ComCall(4, this, "ptr", pclsidCategory, "ptr", szInstance, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * The RegisterFilter method adds filter information to the registry.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper2-registerfilter
     */
    RegisterFilter(clsidFilter, Name, ppMoniker, pclsidCategory, szInstance, prf2) {
        Name := Name is String ? StrPtr(Name) : Name
        szInstance := szInstance is String ? StrPtr(szInstance) : szInstance

        result := ComCall(5, this, "ptr", clsidFilter, "ptr", Name, "ptr*", ppMoniker, "ptr", pclsidCategory, "ptr", szInstance, "ptr", prf2, "HRESULT")
        return result
    }

    /**
     * The EnumMatchingFilters method enumerates registered filters that meet specified requirements.
     * @param {Integer} dwFlags Reserved, must be zero.
     * @param {BOOL} bExactMatch Boolean value indicating whether an exact match is required. See Remarks for more information.
     * @param {Integer} dwMerit Minimum merit value. The enumeration exludes filters with a lesser merit value. For a list of merit values, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/merit">Merit</a>. If <i>dwMerit</i> is higher than MERIT_DO_NOT_USE, the enumeration also excludes filters whose category has a merit less than or equal to MERIT_DO_NOT_USE. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-categories">Filter Categories</a>.)
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltermapper2-enummatchingfilters
     */
    EnumMatchingFilters(dwFlags, bExactMatch, dwMerit, bInputNeeded, cInputTypes, pInputTypes, pMedIn, pPinCategoryIn, bRender, bOutputNeeded, cOutputTypes, pOutputTypes, pMedOut, pPinCategoryOut) {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "uint", dwFlags, "int", bExactMatch, "uint", dwMerit, "int", bInputNeeded, "uint", cInputTypes, "ptr", pInputTypes, "ptr", pMedIn, "ptr", pPinCategoryIn, "int", bRender, "int", bOutputNeeded, "uint", cOutputTypes, "ptr", pOutputTypes, "ptr", pMedOut, "ptr", pPinCategoryOut, "HRESULT")
        return IEnumMoniker(ppEnum)
    }
}
