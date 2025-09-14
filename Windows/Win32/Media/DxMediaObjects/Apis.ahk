#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class DxMediaObjects {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static DMO_E_INVALIDSTREAMINDEX => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static DMO_E_INVALIDTYPE => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static DMO_E_TYPE_NOT_SET => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static DMO_E_NOTACCEPTING => -2147220988

    /**
     * @type {Integer (Int32)}
     */
    static DMO_E_TYPE_NOT_ACCEPTED => -2147220987

    /**
     * @type {Integer (Int32)}
     */
    static DMO_E_NO_MORE_ITEMS => -2147220986

    /**
     * @type {String}
     */
    static DMOCATEGORY_AUDIO_DECODER => "{57f2db8b-e6bb-4513-9d43-dcd2a6593125}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_AUDIO_ENCODER => "{33d9a761-90c8-11d0-bd43-00a0c911ce86}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_VIDEO_DECODER => "{4a69b442-28be-4991-969c-b500adf5d8a8}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_VIDEO_ENCODER => "{33d9a760-90c8-11d0-bd43-00a0c911ce86}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_AUDIO_EFFECT => "{f3602b3f-0592-48df-a4cd-674721e7ebeb}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_VIDEO_EFFECT => "{d990ee14-776c-4723-be46-3da2f56f10b9}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_AUDIO_CAPTURE_EFFECT => "{f665aaba-3e09-4920-aa5f-219811148f09}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_ACOUSTIC_ECHO_CANCEL => "{bf963d80-c559-11d0-8a2b-00a0c9255ac1}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_AUDIO_NOISE_SUPPRESS => "{e07f903f-62fd-4e60-8cdd-dea7236665b5}"

    /**
     * @type {String}
     */
    static DMOCATEGORY_AGC => "{e88c9ba0-c557-11d0-8a2b-00a0c9255ac1}"
;@endregion Constants

;@region Methods
    /**
     * The DMORegister function registers a DMO.
     * @remarks
     * This function adds information about a DMO to the registry. Applications or software components can use this information to locate the DMOs they need to use, by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dmoreg/nf-dmoreg-dmoenum">DMOEnum</a> function. For example, to encode a video stream, you would search in the DMOCATEGORY_VIDEO_ENCODER category for a DMO whose media types matched your requirements.
     *         
     * 
     * The media types registered by this function are only for the purpose of finding the DMO. They do not necessarily match the types returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-getinputtype">IMediaObject::GetInputType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-getoutputtype">IMediaObject::GetOutputType</a> methods. For example, a decoder might register just its main input types. After the DMO is created and its input type has been set, its <b>GetOutputType</b> method will return all of the decompressed types it can generate.
     * @param {Pointer<PWSTR>} szName NULL-terminated string that contains a descriptive name for the DMO. Names longer than 79 characters might be truncated.
     * @param {Pointer<Guid>} clsidDMO Class identifier (CLSID) of the DMO.
     * @param {Pointer<Guid>} guidCategory GUID that specifies the category of the DMO. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dmo-guids">DMO GUIDs</a> for a list of category GUIDs.
     * @param {Integer} dwFlags Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dmoreg/ne-dmoreg-dmo_register_flags">DMO_REGISTER_FLAGS</a> enumeration.
     * @param {Integer} cInTypes Number of input media types to register. Can be zero.
     * @param {Pointer<DMO_PARTIAL_MEDIATYPE>} pInTypes Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dmoreg/ns-dmoreg-dmo_partial_mediatype">DMO_PARTIAL_MEDIATYPE</a> structures that specify the input media types. The size of the array is specified in the cInTypes parameter
     * @param {Integer} cOutTypes Number of output media types to register.
     * @param {Pointer<DMO_PARTIAL_MEDIATYPE>} pOutTypes Pointer to an array of DMO_PARTIAL_MEDIATYPE structures that specify the output media types. The size of the array is specified in the cOutTypes parameter. Can be zero.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmoreg/nf-dmoreg-dmoregister
     */
    static DMORegister(szName, clsidDMO, guidCategory, dwFlags, cInTypes, pInTypes, cOutTypes, pOutTypes) {
        result := DllCall("msdmo.dll\DMORegister", "ptr", szName, "ptr", clsidDMO, "ptr", guidCategory, "uint", dwFlags, "uint", cInTypes, "ptr", pInTypes, "uint", cOutTypes, "ptr", pOutTypes, "int")
        return result
    }

    /**
     * The DMOUnregister function unregisters a DMO.
     * @param {Pointer<Guid>} clsidDMO Class identifier (CLSID) of the DMO.
     * @param {Pointer<Guid>} guidCategory GUID that specifies the category from which to remove the DMO. Use GUID_NULL to unregister the DMO from every category. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dmo-guids">DMO GUIDs</a> for a list of category GUIDs.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Result Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>Invalid argument</td>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>This CLSID was not registered in the specified category.</td>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>Success</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmoreg/nf-dmoreg-dmounregister
     */
    static DMOUnregister(clsidDMO, guidCategory) {
        result := DllCall("msdmo.dll\DMOUnregister", "ptr", clsidDMO, "ptr", guidCategory, "int")
        return result
    }

    /**
     * The DMOEnum function enumerates DMOs listed in the registry. The caller can search by category, media type, or both.
     * @remarks
     * This method returns a pointer to an enumerator object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nn-mediaobj-ienumdmo">IEnumDMO</a> interface. The application uses the <b>IEnumDMO</b> interface to enumerate over the set of DMOs that match the search criteria.
     * @param {Pointer<Guid>} guidCategory GUID that specifies which category of DMO to search. Use GUID_NULL to search every category. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dmo-guids">DMO GUIDs</a> for a list of category GUIDs.
     * @param {Integer} dwFlags Bitwise combination of zero or more flags from the DMO_ENUM_FLAGS enumeration.
     * @param {Integer} cInTypes Number of input media types to use in the search criteria. Use zero to match any input type.
     * @param {Pointer<DMO_PARTIAL_MEDIATYPE>} pInTypes Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dmoreg/ns-dmoreg-dmo_partial_mediatype">DMO_PARTIAL_MEDIATYPE</a> structures that contain the input media types. Specify the size of the array in the cInTypes parameter.
     * @param {Integer} cOutTypes Number of output media types to use in the search criteria. Use zero to match any output type.
     * @param {Pointer<DMO_PARTIAL_MEDIATYPE>} pOutTypes Pointer to an array of DMO_PARTIAL_MEDIATYPE structures that contain the output media types. Specify the size of the array in the cOutTypes parameter.
     * @param {Pointer<IEnumDMO>} ppEnum Address of a variable to receive the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nn-mediaobj-ienumdmo">IEnumDMO</a> interface of the enumerator.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmoreg/nf-dmoreg-dmoenum
     */
    static DMOEnum(guidCategory, dwFlags, cInTypes, pInTypes, cOutTypes, pOutTypes, ppEnum) {
        result := DllCall("msdmo.dll\DMOEnum", "ptr", guidCategory, "uint", dwFlags, "uint", cInTypes, "ptr", pInTypes, "uint", cOutTypes, "ptr", pOutTypes, "ptr", ppEnum, "int")
        return result
    }

    /**
     * The DMOGetTypes function retrieves the name of a DMO from the registry.
     * @remarks
     * If one of the arrays is too small to hold all of the registered types, the function fills the array but returns S_FALSE.
     * 
     * If the DMO did not register any media types, the function returns S_OK and sets <i>*pulInputTypesSupplied</i> and <i>*pulOutputTypesSupplied</i> to zero.
     * @param {Pointer<Guid>} clsidDMO Class identifier (CLSID) of the DMO.
     * @param {Integer} ulInputTypesRequested Size of the array passed in the <i>pInputTypes</i> parameter.
     * @param {Pointer<UInt32>} pulInputTypesSupplied Pointer to a variable that receives the number of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dmoreg/ns-dmoreg-dmo_partial_mediatype">DMO_PARTIAL_MEDIATYPE</a> structures in <i>pInputTypes</i> that the function fills in.
     * @param {Pointer<DMO_PARTIAL_MEDIATYPE>} pInputTypes Pointer to a caller-allocated array of DMO_PARTIAL_MEDIATYPE structures. The size of the array is given in the ulInputTypesRequested parameter. The function fills the array with the input types registered for the DMO.
     * @param {Integer} ulOutputTypesRequested Size of the array passed in the <i>pOutputTypes</i> parameter.
     * @param {Pointer<UInt32>} pulOutputTypesSupplied Pointer to a variable that receives the number of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dmoreg/ns-dmoreg-dmo_partial_mediatype">DMO_PARTIAL_MEDIATYPE</a> structures in <i>pOutputTypes</i> that the function fills in.
     * @param {Pointer<DMO_PARTIAL_MEDIATYPE>} pOutputTypes Pointer to a caller-allocated array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dmoreg/ns-dmoreg-dmo_partial_mediatype">DMO_PARTIAL_MEDIATYPE</a> structures. The size of the array is given in the <i>ulOutputTypesRequested</i> parameter. The function fills the array with the DMO output types registered for the DMO.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Array too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmoreg/nf-dmoreg-dmogettypes
     */
    static DMOGetTypes(clsidDMO, ulInputTypesRequested, pulInputTypesSupplied, pInputTypes, ulOutputTypesRequested, pulOutputTypesSupplied, pOutputTypes) {
        result := DllCall("msdmo.dll\DMOGetTypes", "ptr", clsidDMO, "uint", ulInputTypesRequested, "ptr", pulInputTypesSupplied, "ptr", pInputTypes, "uint", ulOutputTypesRequested, "ptr", pulOutputTypesSupplied, "ptr", pOutputTypes, "int")
        return result
    }

    /**
     * The DMOGetName function retrieves the name of a DMO from the registry.
     * @remarks
     * If the method returns S_FALSE, <i>szName</i> is set to '\0'.
     * @param {Pointer<Guid>} clsidDMO Class identifier (CLSID) of the DMO.
     * @param {Pointer<PWSTR>} szName Array of 80 Unicode characters that receives the name of the DMO. The caller must allocate the array. The name is a NULL-terminated string.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No name was registered for this DMO, or the name has zero length.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmoreg/nf-dmoreg-dmogetname
     */
    static DMOGetName(clsidDMO, szName) {
        result := DllCall("msdmo.dll\DMOGetName", "ptr", clsidDMO, "ptr", szName, "int")
        return result
    }

    /**
     * The MoInitMediaType function initializes a media type structure.
     * @remarks
     * This function allocates the format block for a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure. The format block is allocated on the heap. The allocated memory is not initialized. The caller must free the format block by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mofreemediatype">MoFreeMediaType</a> function. 
     * 
     * 
     * 
     * This function also sets the <b>cbFormat</b> and <b>pbFormat</b> members of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Pointer to an uninitialized <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller.
     * @param {Integer} cbFormat Number of bytes to allocate for the format block. Can be zero.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmort/nf-dmort-moinitmediatype
     */
    static MoInitMediaType(pmt, cbFormat) {
        result := DllCall("msdmo.dll\MoInitMediaType", "ptr", pmt, "uint", cbFormat, "int")
        return result
    }

    /**
     * The MoFreeMediaType function frees the allocated members of a media type structure.
     * @remarks
     * Call this function to free a format block that was allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-moinitmediatype">MoInitMediaType</a> function. This function frees the <b>pbFormat</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure and sets <b>pbFormat</b> to <b>NULL</b>. The function does not reset the <b>cbFormat</b> member to zero, however, so if you re-use the <b>DMO_MEDIA_TYPE</b> structure, you should set <b>cbFormat</b> to zero.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Pointer to an initialized <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmort/nf-dmort-mofreemediatype
     */
    static MoFreeMediaType(pmt) {
        result := DllCall("msdmo.dll\MoFreeMediaType", "ptr", pmt, "int")
        return result
    }

    /**
     * The MoCopyMediaType function copies the members of one media type structure into another media type structure.
     * @remarks
     * This function copies all the members of <i>pmtSrc</i> to <i>pmtDest</i> and copies the format block. The caller must free the target media type by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mofreemediatype">MoFreeMediaType</a> function.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmtDest Pointer to the target <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure. The caller must allocate, but not initialize, this structure.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmtSrc Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmort/nf-dmort-mocopymediatype
     */
    static MoCopyMediaType(pmtDest, pmtSrc) {
        result := DllCall("msdmo.dll\MoCopyMediaType", "ptr", pmtDest, "ptr", pmtSrc, "int")
        return result
    }

    /**
     * The MoCreateMediaType function allocates a new media type structure.
     * @remarks
     * This function allocates a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure on the heap. It also allocates memory for the format block. The caller must delete the structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-modeletemediatype">MoDeleteMediaType</a> function.
     * 
     * Internally, this function calls <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-moinitmediatype">MoInitMediaType</a> to allocate the format block.
     * @param {Pointer<DMO_MEDIA_TYPE>} ppmt Receives a pointer to an allocated <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure.
     * @param {Integer} cbFormat Number of bytes to allocate for the format block. Can be zero.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmort/nf-dmort-mocreatemediatype
     */
    static MoCreateMediaType(ppmt, cbFormat) {
        result := DllCall("msdmo.dll\MoCreateMediaType", "ptr", ppmt, "uint", cbFormat, "int")
        return result
    }

    /**
     * The MoDeleteMediaType function deletes a media type structure that was previously allocated.
     * @remarks
     * Call this function to free a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure that was allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mocreatemediatype">MoCreateMediaType</a> function.
     * 
     * Internally, this function calls <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mofreemediatype">MoFreeMediaType</a> to free the format block.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Pointer to an initialized <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmort/nf-dmort-modeletemediatype
     */
    static MoDeleteMediaType(pmt) {
        result := DllCall("msdmo.dll\MoDeleteMediaType", "ptr", pmt, "int")
        return result
    }

    /**
     * The MoDuplicateMediaType function duplicates a media type structure.
     * @remarks
     * This method is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mocreatemediatype">MoCreateMediaType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mocopymediatype">MoCopyMediaType</a>. The caller must delete the returned media type structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-modeletemediatype">MoDeleteMediaType</a> function.
     * @param {Pointer<DMO_MEDIA_TYPE>} ppmtDest Address of a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure that receives the duplicated structure.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmtSrc Pointer to the media type structure to duplicate.
     * @returns {Integer} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmort/nf-dmort-moduplicatemediatype
     */
    static MoDuplicateMediaType(ppmtDest, pmtSrc) {
        result := DllCall("msdmo.dll\MoDuplicateMediaType", "ptr", ppmtDest, "ptr", pmtSrc, "int")
        return result
    }

;@endregion Methods
}
