#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about an ELS service.
 * @remarks
 * Structures of this type are created in an application call to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappinggetservices">MappingGetServices</a>.
 * @see https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_service_info
 * @namespace Windows.Win32.Globalization
 */
export default struct MAPPING_SERVICE_INFO {
    #StructPack 8

    /**
     * Size of the structure, used to validate the structure version. This value is required.
     */
    Size : IntPtr

    /**
     * Pointer to copyright information about the service.
     */
    pszCopyright : PWSTR

    /**
     * Major version number that is used to track changes to the service.
     */
    wMajorVersion : UInt16

    /**
     * Minor version number that is used to track changes to the service.
     */
    wMinorVersion : UInt16

    /**
     * Build version that is used to track changes to the service.
     */
    wBuildVersion : UInt16

    /**
     * Step version that is used to track changes to the service.
     */
    wStepVersion : UInt16

    /**
     * Number of content types that the service can receive.
     */
    dwInputContentTypesCount : UInt32

    /**
     * Optional. Pointer to an array of input content types, following the format of the MIME content types, that identify the format that the service interprets when the application passes data. Examples of content types are "text/plain", "text/html" and "text/css". 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services support only the content type "text/plain". A content types specification can be found at <a href="https://www.iana.org/assignments/media-types/text">Text Media Types</a>.</div>
     * <div> </div>
     */
    prgInputContentTypes : PWSTR.Ptr

    /**
     * Number of content types in which the service can format results.
     */
    dwOutputContentTypesCount : UInt32

    /**
     * Optional. Pointer to an array of output content types, following the format of the MIME content types, that identify the format in which the service retrieves data.
     */
    prgOutputContentTypes : PWSTR.Ptr

    /**
     * Number of input languages supported by the service. This member is set to 0 if the service can accept data in any language.
     */
    dwInputLanguagesCount : UInt32

    /**
     * Pointer to an array of the input languages, following the IETF naming convention, that the service accepts. This member is set to <b>NULL</b> if the service can work with any input language.
     */
    prgInputLanguages : PWSTR.Ptr

    /**
     * Number of output languages supported by the service. This member is set to 0 if the service can retrieve data in any language, or if the service ignores the output language.
     */
    dwOutputLanguagesCount : UInt32

    /**
     * Pointer to an array of output languages, following the IETF naming convention, in which the service can retrieve results. This member is set to <b>NULL</b> if the service can retrieve results in any language, or if the service ignores the output language.
     */
    prgOutputLanguages : PWSTR.Ptr

    /**
     * Number of input scripts supported by the service. This member is set to 0 if the service can accept data in any script.
     */
    dwInputScriptsCount : UInt32

    /**
     * Pointer to an array of input scripts, with Unicode standard script names, that are supported by the service. This member is set to <b>NULL</b> if the service can work with any scripts, or if the service ignores the input scripts.
     */
    prgInputScripts : PWSTR.Ptr

    /**
     * Number of output scripts supported by the service. This member is set to 0 if the service can retrieve data in any script, or if the service ignores the output scripts.
     */
    dwOutputScriptsCount : UInt32

    /**
     * Pointer to an array of output scripts supported by the service. This member is set to <b>NULL</b> if the service can work with any scripts, or the service ignores the output scripts.
     */
    prgOutputScripts : PWSTR.Ptr

    /**
     * Globally unique identifier (GUID) for the service.
     */
    guid : Guid

    /**
     * Pointer to the service category for the service, for example, "Language Detection".
     */
    pszCategory : PWSTR

    /**
     * Pointer to the service description. This text can be localized.
     */
    pszDescription : PWSTR

    /**
     * Size, in bytes, of the private data for the service. This member is set to 0 if there is no private data.
     */
    dwPrivateDataSize : UInt32

    /**
     * Pointer to private data that the service can expose. This information is static and updated during installation of the service.
     */
    pPrivateData : IntPtr

    /**
     * Reserved for internal use.
     */
    pContext : IntPtr

    /**
     * This bitfield backs the following members:
     * - IsOneToOneLanguageMapping
     * - HasSubservices
     * - OnlineOnly
     * - ServiceType
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IsOneToOneLanguageMapping {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    HasSubservices {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    OnlineOnly {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ServiceType {
        get => (this._bitfield >> 3) & 0x3
        set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
    }
}
