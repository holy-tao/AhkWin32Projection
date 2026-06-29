#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FilterType.ahk" { FilterType }
#Import ".\RSVP_FILTERSPEC_V4_GPI.ahk" { RSVP_FILTERSPEC_V4_GPI }
#Import ".\IN_ADDR_IPV4.ahk" { IN_ADDR_IPV4 }
#Import ".\RSVP_FILTERSPEC_V6_FLOW.ahk" { RSVP_FILTERSPEC_V6_FLOW }
#Import ".\RSVP_FILTERSPEC_V6.ahk" { RSVP_FILTERSPEC_V6 }
#Import ".\RSVP_FILTERSPEC_V6_GPI.ahk" { RSVP_FILTERSPEC_V6_GPI }
#Import ".\IN_ADDR_IPV6.ahk" { IN_ADDR_IPV6 }
#Import ".\RSVP_FILTERSPEC_V4.ahk" { RSVP_FILTERSPEC_V4 }

/**
 * The RSVP_FILTERSPEC structure provides RSVP FILTERSPEC information.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_filterspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_FILTERSPEC {
    #StructPack 4

    /**
     * Specifies the type of FILTERSPEC using the <b>FilterSpec</b> enumeration.
     */
    Type : FilterType

    FilterSpecV4 : RSVP_FILTERSPEC_V4

    static __New() {
        DefineProp(this.Prototype, 'FilterSpecV6', { type: RSVP_FILTERSPEC_V6, offset: 4 })
        DefineProp(this.Prototype, 'FilterSpecV6Flow', { type: RSVP_FILTERSPEC_V6_FLOW, offset: 4 })
        DefineProp(this.Prototype, 'FilterSpecV4Gpi', { type: RSVP_FILTERSPEC_V4_GPI, offset: 4 })
        DefineProp(this.Prototype, 'FilterSpecV6Gpi', { type: RSVP_FILTERSPEC_V6_GPI, offset: 4 })
        this.DeleteProp("__New")
    }
}
