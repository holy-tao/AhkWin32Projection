#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GOPHER_ABSTRACT_ATTRIBUTE_TYPE.ahk" { GOPHER_ABSTRACT_ATTRIBUTE_TYPE }
#Import ".\GOPHER_ORGANIZATION_ATTRIBUTE_TYPE.ahk" { GOPHER_ORGANIZATION_ATTRIBUTE_TYPE }
#Import ".\GOPHER_ADMIN_ATTRIBUTE_TYPE.ahk" { GOPHER_ADMIN_ATTRIBUTE_TYPE }
#Import ".\GOPHER_TIMEZONE_ATTRIBUTE_TYPE.ahk" { GOPHER_TIMEZONE_ATTRIBUTE_TYPE }
#Import ".\GOPHER_LOCATION_ATTRIBUTE_TYPE.ahk" { GOPHER_LOCATION_ATTRIBUTE_TYPE }
#Import ".\GOPHER_VERSION_ATTRIBUTE_TYPE.ahk" { GOPHER_VERSION_ATTRIBUTE_TYPE }
#Import ".\GOPHER_SITE_ATTRIBUTE_TYPE.ahk" { GOPHER_SITE_ATTRIBUTE_TYPE }
#Import ".\GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE.ahk" { GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE }
#Import ".\GOPHER_ASK_ATTRIBUTE_TYPE.ahk" { GOPHER_ASK_ATTRIBUTE_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\GOPHER_VERONICA_ATTRIBUTE_TYPE.ahk" { GOPHER_VERONICA_ATTRIBUTE_TYPE }
#Import ".\GOPHER_UNKNOWN_ATTRIBUTE_TYPE.ahk" { GOPHER_UNKNOWN_ATTRIBUTE_TYPE }
#Import ".\GOPHER_VIEW_ATTRIBUTE_TYPE.ahk" { GOPHER_VIEW_ATTRIBUTE_TYPE }
#Import ".\GOPHER_PROVIDER_ATTRIBUTE_TYPE.ahk" { GOPHER_PROVIDER_ATTRIBUTE_TYPE }
#Import ".\GOPHER_TTL_ATTRIBUTE_TYPE.ahk" { GOPHER_TTL_ATTRIBUTE_TYPE }
#Import ".\GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE.ahk" { GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE }
#Import ".\GOPHER_SCORE_ATTRIBUTE_TYPE.ahk" { GOPHER_SCORE_ATTRIBUTE_TYPE }
#Import ".\GOPHER_MOD_DATE_ATTRIBUTE_TYPE.ahk" { GOPHER_MOD_DATE_ATTRIBUTE_TYPE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains the relevant information of a single Gopher attribute for an object.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-gopher_attribute_type
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct GOPHER_ATTRIBUTE_TYPE {
    #StructPack 8


    struct _AttributeType {
        Admin : GOPHER_ADMIN_ATTRIBUTE_TYPE

        static __New() {
            DefineProp(this.Prototype, 'ModDate', { type: GOPHER_MOD_DATE_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Ttl', { type: GOPHER_TTL_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Score', { type: GOPHER_SCORE_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'ScoreRange', { type: GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Site', { type: GOPHER_SITE_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Organization', { type: GOPHER_ORGANIZATION_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Location', { type: GOPHER_LOCATION_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'GeographicalLocation', { type: GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'TimeZone', { type: GOPHER_TIMEZONE_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Provider', { type: GOPHER_PROVIDER_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Version', { type: GOPHER_VERSION_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Abstract', { type: GOPHER_ABSTRACT_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'View', { type: GOPHER_VIEW_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Veronica', { type: GOPHER_VERONICA_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Ask', { type: GOPHER_ASK_ATTRIBUTE_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'Unknown', { type: GOPHER_UNKNOWN_ATTRIBUTE_TYPE, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Name of the Gopher category for the attribute. The possible values include: 
     * 
     * <a id="GOPHER_CATEGORY_ID_ABSTRACT"></a>
     * <a id="gopher_category_id_abstract"></a>
     */
    CategoryId : UInt32

    /**
     * Attribute type. The possible values include: 
     * 
     * <a id="GOPHER_ATTRIBUTE_ID_ABSTRACT"></a>
     * <a id="gopher_attribute_id_abstract"></a>
     */
    AttributeId : UInt32

    /**
     * Data for the Gopher attribute. The specific structure depends on the 
     * <b>AttributeId</b> member. The definitions of these data structures are available in Wininet.h.
     */
    AttributeType : GOPHER_ATTRIBUTE_TYPE._AttributeType

}
