#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains options for text recognition. The values stored in this structure affect the behavior and results of MappingRecognizeText.
 * @remarks
 * The application does not have to fill in all members of this structure, as services treat <b>NULL</b> members as default values. All unused members must be set to 0.
 * 
 * <div class="alert"><b>Warning</b>  The data passed in this structure to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>, as well as data referred to by the <i>pszText</i> argument in that call, 
 * 
 * must remain valid until the property bag structure passed by <i>pBag</i> is freed via 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingfreepropertybag">MappingFreePropertyBag</a>. This is because both synchronous and asynchronous calls to 
 * 
 * <b>MappingRecognizeText</b> and <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingdoaction">MappingDoAction</a> will attempt to use the data passed to the initial 
 * 
 * call to <b>MappingRecognizeText</b>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_options
 * @namespace Windows.Win32.Globalization
 */
export default struct MAPPING_OPTIONS {
    #StructPack 8

    /**
     * Size of the structure, used to validate the structure version. This value is required.
     */
    Size : IntPtr

    /**
     * Optional. Pointer to an input language string, following the IETF naming convention, that identifies the input language that the service should be able to accept. The application can set this member to <b>NULL</b> to indicate that the service is free to interpret the input as any input language it supports.
     */
    pszInputLanguage : PWSTR

    /**
     * Optional. Pointer to an output language string, following the IETF naming convention, that identifies the output language that the service should be able to use to produce results. The application can set this member to <b>NULL</b> if the service should decide the output language.
     */
    pszOutputLanguage : PWSTR

    /**
     * Optional. Pointer to a standard Unicode script name that should be accepted by the service. The application can set this member to <b>NULL</b> to let the service decide how handle the input.
     */
    pszInputScript : PWSTR

    /**
     * Optional. Pointer to a standard Unicode script name that the service should use to retrieve results. The application can set this member to <b>NULL</b> to let the service decide the output script.
     */
    pszOutputScript : PWSTR

    /**
     * Optional. Pointer to a string, following the format of the MIME content types, that identifies the format that the service should be able to interpret when the application passes data. Examples of content types are "text/plain", "text/html", and "text/css". The application can set this member to <b>NULL</b> to indicate the "text/plain" content type. 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services support only the content type "text/plain". A content type specification can be found at <a href="https://www.iana.org/assignments/media-types/text">Text Media Types</a>.</div>
     * <div> </div>
     */
    pszInputContentType : PWSTR

    /**
     * Optional. Pointer to a string, following the format of the MIME content types, that identifies the format in which the service should retrieve data. The application can set this member to <b>NULL</b> to let the service decide the output content type.
     */
    pszOutputContentType : PWSTR

    /**
     * Reserved.
     */
    pszUILanguage : PWSTR

    /**
     * Optional. Pointer to an application callback function to receive callbacks with the results from the <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a> function. If a callback function is specified, text recognition is executed in asynchronous mode and the application obtains results through the callback function. The application must set this member to <b>NULL</b> if text recognition is to be synchronous.
     */
    pfnRecognizeCallback : IntPtr

    /**
     * Optional. Pointer to private application data passed to the callback function by a service after text recognition is complete. The application must set this member to <b>NULL</b> to indicate no private application data.
     */
    pRecognizeCallerData : IntPtr

    /**
     * Optional. Size, in bytes, of any private application data indicated by the <b>pRecognizeCallerData</b> member.
     */
    dwRecognizeCallerDataSize : UInt32

    /**
     * Reserved.
     */
    pfnActionCallback : IntPtr

    /**
     * Reserved.
     */
    pActionCallerData : IntPtr

    /**
     * Reserved.
     */
    dwActionCallerDataSize : UInt32

    /**
     * Optional. Private flag that a service provider defines to affect service behavior. Services can interpret this flag as they require.
     * 
     * <div class="alert"><b>Note</b>  For Windows 7, none of the available ELS services support flags.</div>
     * <div> </div>
     */
    dwServiceFlag : UInt32

    /**
     * This bitfield backs the following members:
     * - GetActionDisplayName
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    GetActionDisplayName {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
