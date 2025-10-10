#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GOPHER_ADMIN_ATTRIBUTE_TYPE.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\GOPHER_MOD_DATE_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_ABSTRACT_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_VIEW_ATTRIBUTE_TYPE.ahk
#Include .\GOPHER_ASK_ATTRIBUTE_TYPE.ahk

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
                this.__Admin := GOPHER_ADMIN_ATTRIBUTE_TYPE(this.ptr + 8)
            return this.__Admin
        }
    }

    /**
     * @type {GOPHER_MOD_DATE_ATTRIBUTE_TYPE}
     */
    ModDate{
        get {
            if(!this.HasProp("__ModDate"))
                this.__ModDate := GOPHER_MOD_DATE_ATTRIBUTE_TYPE(this.ptr + 8)
            return this.__ModDate
        }
    }

    /**
     * @type {Integer}
     */
    Ttl {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Score {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE}
     */
    ScoreRange{
        get {
            if(!this.HasProp("__ScoreRange"))
                this.__ScoreRange := GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE(this.ptr + 8)
            return this.__ScoreRange
        }
    }

    /**
     * @type {Pointer<SByte>}
     */
    Site {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SByte>}
     */
    Organization {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SByte>}
     */
    Location {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE}
     */
    GeographicalLocation{
        get {
            if(!this.HasProp("__GeographicalLocation"))
                this.__GeographicalLocation := GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE(this.ptr + 8)
            return this.__GeographicalLocation
        }
    }

    /**
     * @type {Integer}
     */
    TimeZone {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<SByte>}
     */
    Provider {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SByte>}
     */
    Version {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {GOPHER_ABSTRACT_ATTRIBUTE_TYPE}
     */
    Abstract{
        get {
            if(!this.HasProp("__Abstract"))
                this.__Abstract := GOPHER_ABSTRACT_ATTRIBUTE_TYPE(this.ptr + 8)
            return this.__Abstract
        }
    }

    /**
     * @type {GOPHER_VIEW_ATTRIBUTE_TYPE}
     */
    View{
        get {
            if(!this.HasProp("__View"))
                this.__View := GOPHER_VIEW_ATTRIBUTE_TYPE(this.ptr + 8)
            return this.__View
        }
    }

    /**
     * @type {Integer}
     */
    Veronica {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {GOPHER_ASK_ATTRIBUTE_TYPE}
     */
    Ask{
        get {
            if(!this.HasProp("__Ask"))
                this.__Ask := GOPHER_ASK_ATTRIBUTE_TYPE(this.ptr + 8)
            return this.__Ask
        }
    }

    /**
     * @type {Pointer<SByte>}
     */
    Unknown {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
