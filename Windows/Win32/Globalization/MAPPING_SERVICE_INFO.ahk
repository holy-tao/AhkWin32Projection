#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about an ELS service.
 * @remarks
 * Structures of this type are created in an application call to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappinggetservices">MappingGetServices</a>.
 * @see https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_service_info
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MAPPING_SERVICE_INFO extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * Size of the structure, used to validate the structure version. This value is required.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to copyright information about the service.
     * @type {Pointer<PWSTR>}
     */
    pszCopyright {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Major version number that is used to track changes to the service.
     * @type {Integer}
     */
    wMajorVersion {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Minor version number that is used to track changes to the service.
     * @type {Integer}
     */
    wMinorVersion {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Build version that is used to track changes to the service.
     * @type {Integer}
     */
    wBuildVersion {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * Step version that is used to track changes to the service.
     * @type {Integer}
     */
    wStepVersion {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * Number of content types that the service can receive.
     * @type {Integer}
     */
    dwInputContentTypesCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Optional. Pointer to an array of input content types, following the format of the MIME content types, that identify the format that the service interprets when the application passes data. Examples of content types are "text/plain", "text/html" and "text/css". 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services support only the content type "text/plain". A content types specification can be found at <a href="https://www.iana.org/assignments/media-types/text">Text Media Types</a>.</div>
     * <div> </div>
     * @type {Pointer<PWSTR>}
     */
    prgInputContentTypes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Number of content types in which the service can format results.
     * @type {Integer}
     */
    dwOutputContentTypesCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Optional. Pointer to an array of output content types, following the format of the MIME content types, that identify the format in which the service retrieves data.
     * @type {Pointer<PWSTR>}
     */
    prgOutputContentTypes {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Number of input languages supported by the service. This member is set to 0 if the service can accept data in any language.
     * @type {Integer}
     */
    dwInputLanguagesCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Pointer to an array of the input languages, following the IETF naming convention, that the service accepts. This member is set to <b>NULL</b> if the service can work with any input language.
     * @type {Pointer<PWSTR>}
     */
    prgInputLanguages {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Number of output languages supported by the service. This member is set to 0 if the service can retrieve data in any language, or if the service ignores the output language.
     * @type {Integer}
     */
    dwOutputLanguagesCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Pointer to an array of output languages, following the IETF naming convention, in which the service can retrieve results. This member is set to <b>NULL</b> if the service can retrieve results in any language, or if the service ignores the output language.
     * @type {Pointer<PWSTR>}
     */
    prgOutputLanguages {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Number of input scripts supported by the service. This member is set to 0 if the service can accept data in any script.
     * @type {Integer}
     */
    dwInputScriptsCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Pointer to an array of input scripts, with Unicode standard script names, that are supported by the service. This member is set to <b>NULL</b> if the service can work with any scripts, or if the service ignores the input scripts.
     * @type {Pointer<PWSTR>}
     */
    prgInputScripts {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Number of output scripts supported by the service. This member is set to 0 if the service can retrieve data in any script, or if the service ignores the output scripts.
     * @type {Integer}
     */
    dwOutputScriptsCount {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Pointer to an array of output scripts supported by the service. This member is set to <b>NULL</b> if the service can work with any scripts, or the service ignores the output scripts.
     * @type {Pointer<PWSTR>}
     */
    prgOutputScripts {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Globally unique identifier (GUID) for the service.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Pointer to the service category for the service, for example, "Language Detection".
     * @type {Pointer<PWSTR>}
     */
    pszCategory {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Pointer to the service description. This text can be localized.
     * @type {Pointer<PWSTR>}
     */
    pszDescription {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Size, in bytes, of the private data for the service. This member is set to 0 if there is no private data.
     * @type {Integer}
     */
    dwPrivateDataSize {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Pointer to private data that the service can expose. This information is static and updated during installation of the service.
     * @type {Pointer<Void>}
     */
    pPrivateData {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Reserved for internal use.
     * @type {Pointer<Void>}
     */
    pContext {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }
}
