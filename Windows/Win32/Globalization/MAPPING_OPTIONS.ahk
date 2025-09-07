#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\PWSTR.ahk

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
 * @version v4.0.30319
 */
class MAPPING_OPTIONS extends Win32Struct
{
    static sizeof => 120

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
     * Optional. Pointer to an input language string, following the IETF naming convention, that identifies the input language that the service should be able to accept. The application can set this member to <b>NULL</b> to indicate that the service is free to interpret the input as any input language it supports.
     * @type {PWSTR}
     */
    pszInputLanguage{
        get {
            if(!this.HasProp("__pszInputLanguage"))
                this.__pszInputLanguage := PWSTR(this.ptr + 8)
            return this.__pszInputLanguage
        }
    }

    /**
     * Optional. Pointer to an output language string, following the IETF naming convention, that identifies the output language that the service should be able to use to produce results. The application can set this member to <b>NULL</b> if the service should decide the output language.
     * @type {PWSTR}
     */
    pszOutputLanguage{
        get {
            if(!this.HasProp("__pszOutputLanguage"))
                this.__pszOutputLanguage := PWSTR(this.ptr + 16)
            return this.__pszOutputLanguage
        }
    }

    /**
     * Optional. Pointer to a standard Unicode script name that should be accepted by the service. The application can set this member to <b>NULL</b> to let the service decide how handle the input.
     * @type {PWSTR}
     */
    pszInputScript{
        get {
            if(!this.HasProp("__pszInputScript"))
                this.__pszInputScript := PWSTR(this.ptr + 24)
            return this.__pszInputScript
        }
    }

    /**
     * Optional. Pointer to a standard Unicode script name that the service should use to retrieve results. The application can set this member to <b>NULL</b> to let the service decide the output script.
     * @type {PWSTR}
     */
    pszOutputScript{
        get {
            if(!this.HasProp("__pszOutputScript"))
                this.__pszOutputScript := PWSTR(this.ptr + 32)
            return this.__pszOutputScript
        }
    }

    /**
     * Optional. Pointer to a string, following the format of the MIME content types, that identifies the format that the service should be able to interpret when the application passes data. Examples of content types are "text/plain", "text/html", and "text/css". The application can set this member to <b>NULL</b> to indicate the "text/plain" content type. 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services support only the content type "text/plain". A content type specification can be found at <a href="https://www.iana.org/assignments/media-types/text">Text Media Types</a>.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    pszInputContentType{
        get {
            if(!this.HasProp("__pszInputContentType"))
                this.__pszInputContentType := PWSTR(this.ptr + 40)
            return this.__pszInputContentType
        }
    }

    /**
     * Optional. Pointer to a string, following the format of the MIME content types, that identifies the format in which the service should retrieve data. The application can set this member to <b>NULL</b> to let the service decide the output content type.
     * @type {PWSTR}
     */
    pszOutputContentType{
        get {
            if(!this.HasProp("__pszOutputContentType"))
                this.__pszOutputContentType := PWSTR(this.ptr + 48)
            return this.__pszOutputContentType
        }
    }

    /**
     * Reserved.
     * @type {PWSTR}
     */
    pszUILanguage{
        get {
            if(!this.HasProp("__pszUILanguage"))
                this.__pszUILanguage := PWSTR(this.ptr + 56)
            return this.__pszUILanguage
        }
    }

    /**
     * Optional. Pointer to an application callback function to receive callbacks with the results from the <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a> function. If a callback function is specified, text recognition is executed in asynchronous mode and the application obtains results through the callback function. The application must set this member to <b>NULL</b> if text recognition is to be synchronous.
     * @type {Pointer<Ptr>}
     */
    pfnRecognizeCallback {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Optional. Pointer to private application data passed to the callback function by a service after text recognition is complete. The application must set this member to <b>NULL</b> to indicate no private application data.
     * @type {Pointer<Void>}
     */
    pRecognizeCallerData {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Optional. Size, in bytes, of any private application data indicated by the <b>pRecognizeCallerData</b> member.
     * @type {Integer}
     */
    dwRecognizeCallerDataSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Reserved.
     * @type {Pointer<Ptr>}
     */
    pfnActionCallback {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Reserved.
     * @type {Pointer<Void>}
     */
    pActionCallerData {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwActionCallerDataSize {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Optional. Private flag that a service provider defines to affect service behavior. Services can interpret this flag as they require.
     * 
     * <div class="alert"><b>Note</b>  For Windows 7, none of the available ELS services support flags.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwServiceFlag {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }
}
