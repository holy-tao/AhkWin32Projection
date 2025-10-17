#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GOPHER_ADMIN_ATTRIBUTE_TYPE.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\GOPHER_MOD_DATE_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_TTL_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_SCORE_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_SITE_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_ORGANIZATION_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_LOCATION_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_TIMEZONE_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_PROVIDER_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_VERSION_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_ABSTRACT_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_VIEW_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_VERONICA_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_ASK_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_UNKNOWN_ATTRIBUTE_TYPE.ahk

/**
 * Contains the relevant information of a single Gopher attribute for an object.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-gopher_attribute_type
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class GOPHER_ATTRIBUTE_TYPE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Name of the Gopher category for the attribute. The possible values include: 
     * 
     * <a id="GOPHER_CATEGORY_ID_ABSTRACT"></a>
     * <a id="gopher_category_id_abstract"></a>
     * @type {Integer}
     */
    CategoryId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Attribute type. The possible values include: 
     * 
     * <a id="GOPHER_ATTRIBUTE_ID_ABSTRACT"></a>
     * <a id="gopher_attribute_id_abstract"></a>
     * @type {Integer}
     */
    AttributeId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {GOPHER_ADMIN_ATTRIBUTE_TYPE}
     */
    Admin{
        get {
            if(!this.HasProp("__Admin"))
                this.__Admin := GOPHER_ADMIN_ATTRIBUTE_TYPE(8, this)
            return this.__Admin
        }
    }

    /**
     * @type {GOPHER_MOD_DATE_ATTRIBUTE_TYPE}
     */
    ModDate{
        get {
            if(!this.HasProp("__ModDate"))
                this.__ModDate := GOPHER_MOD_DATE_ATTRIBUTE_TYPE(8, this)
            return this.__ModDate
        }
    }

    /**
     * @type {GOPHER_TTL_ATTRIBUTE_TYPE}
     */
    Ttl{
        get {
            if(!this.HasProp("__Ttl"))
                this.__Ttl := GOPHER_TTL_ATTRIBUTE_TYPE(8, this)
            return this.__Ttl
        }
    }

    /**
     * @type {GOPHER_SCORE_ATTRIBUTE_TYPE}
     */
    Score{
        get {
            if(!this.HasProp("__Score"))
                this.__Score := GOPHER_SCORE_ATTRIBUTE_TYPE(8, this)
            return this.__Score
        }
    }

    /**
     * @type {GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE}
     */
    ScoreRange{
        get {
            if(!this.HasProp("__ScoreRange"))
                this.__ScoreRange := GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE(8, this)
            return this.__ScoreRange
        }
    }

    /**
     * @type {GOPHER_SITE_ATTRIBUTE_TYPE}
     */
    Site{
        get {
            if(!this.HasProp("__Site"))
                this.__Site := GOPHER_SITE_ATTRIBUTE_TYPE(8, this)
            return this.__Site
        }
    }

    /**
     * @type {GOPHER_ORGANIZATION_ATTRIBUTE_TYPE}
     */
    Organization{
        get {
            if(!this.HasProp("__Organization"))
                this.__Organization := GOPHER_ORGANIZATION_ATTRIBUTE_TYPE(8, this)
            return this.__Organization
        }
    }

    /**
     * @type {GOPHER_LOCATION_ATTRIBUTE_TYPE}
     */
    Location{
        get {
            if(!this.HasProp("__Location"))
                this.__Location := GOPHER_LOCATION_ATTRIBUTE_TYPE(8, this)
            return this.__Location
        }
    }

    /**
     * @type {GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE}
     */
    GeographicalLocation{
        get {
            if(!this.HasProp("__GeographicalLocation"))
                this.__GeographicalLocation := GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE(8, this)
            return this.__GeographicalLocation
        }
    }

    /**
     * @type {GOPHER_TIMEZONE_ATTRIBUTE_TYPE}
     */
    TimeZone{
        get {
            if(!this.HasProp("__TimeZone"))
                this.__TimeZone := GOPHER_TIMEZONE_ATTRIBUTE_TYPE(8, this)
            return this.__TimeZone
        }
    }

    /**
     * @type {GOPHER_PROVIDER_ATTRIBUTE_TYPE}
     */
    Provider{
        get {
            if(!this.HasProp("__Provider"))
                this.__Provider := GOPHER_PROVIDER_ATTRIBUTE_TYPE(8, this)
            return this.__Provider
        }
    }

    /**
     * @type {GOPHER_VERSION_ATTRIBUTE_TYPE}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := GOPHER_VERSION_ATTRIBUTE_TYPE(8, this)
            return this.__Version
        }
    }

    /**
     * @type {GOPHER_ABSTRACT_ATTRIBUTE_TYPE}
     */
    Abstract{
        get {
            if(!this.HasProp("__Abstract"))
                this.__Abstract := GOPHER_ABSTRACT_ATTRIBUTE_TYPE(8, this)
            return this.__Abstract
        }
    }

    /**
     * @type {GOPHER_VIEW_ATTRIBUTE_TYPE}
     */
    View{
        get {
            if(!this.HasProp("__View"))
                this.__View := GOPHER_VIEW_ATTRIBUTE_TYPE(8, this)
            return this.__View
        }
    }

    /**
     * @type {GOPHER_VERONICA_ATTRIBUTE_TYPE}
     */
    Veronica{
        get {
            if(!this.HasProp("__Veronica"))
                this.__Veronica := GOPHER_VERONICA_ATTRIBUTE_TYPE(8, this)
            return this.__Veronica
        }
    }

    /**
     * @type {GOPHER_ASK_ATTRIBUTE_TYPE}
     */
    Ask{
        get {
            if(!this.HasProp("__Ask"))
                this.__Ask := GOPHER_ASK_ATTRIBUTE_TYPE(8, this)
            return this.__Ask
        }
    }

    /**
     * @type {GOPHER_UNKNOWN_ATTRIBUTE_TYPE}
     */
    Unknown{
        get {
            if(!this.HasProp("__Unknown"))
                this.__Unknown := GOPHER_UNKNOWN_ATTRIBUTE_TYPE(8, this)
            return this.__Unknown
        }
    }
}
