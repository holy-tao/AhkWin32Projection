#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR_IPV4.ahk
#Include .\RSVP_FILTERSPEC_V4.ahk
#Include .\IN_ADDR_IPV6.ahk
#Include .\RSVP_FILTERSPEC_V6.ahk
#Include .\RSVP_FILTERSPEC_V6_FLOW.ahk
#Include .\RSVP_FILTERSPEC_V4_GPI.ahk
#Include .\RSVP_FILTERSPEC_V6_GPI.ahk

/**
 * The RSVP_FILTERSPEC structure provides RSVP FILTERSPEC information.
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ns-qossp-rsvp_filterspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_FILTERSPEC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the type of FILTERSPEC using the <b>FilterSpec</b> enumeration.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {RSVP_FILTERSPEC_V4}
     */
    FilterSpecV4{
        get {
            if(!this.HasProp("__FilterSpecV4"))
                this.__FilterSpecV4 := RSVP_FILTERSPEC_V4(8, this)
            return this.__FilterSpecV4
        }
    }

    /**
     * @type {RSVP_FILTERSPEC_V6}
     */
    FilterSpecV6{
        get {
            if(!this.HasProp("__FilterSpecV6"))
                this.__FilterSpecV6 := RSVP_FILTERSPEC_V6(8, this)
            return this.__FilterSpecV6
        }
    }

    /**
     * @type {RSVP_FILTERSPEC_V6_FLOW}
     */
    FilterSpecV6Flow{
        get {
            if(!this.HasProp("__FilterSpecV6Flow"))
                this.__FilterSpecV6Flow := RSVP_FILTERSPEC_V6_FLOW(8, this)
            return this.__FilterSpecV6Flow
        }
    }

    /**
     * @type {RSVP_FILTERSPEC_V4_GPI}
     */
    FilterSpecV4Gpi{
        get {
            if(!this.HasProp("__FilterSpecV4Gpi"))
                this.__FilterSpecV4Gpi := RSVP_FILTERSPEC_V4_GPI(8, this)
            return this.__FilterSpecV4Gpi
        }
    }

    /**
     * @type {RSVP_FILTERSPEC_V6_GPI}
     */
    FilterSpecV6Gpi{
        get {
            if(!this.HasProp("__FilterSpecV6Gpi"))
                this.__FilterSpecV6Gpi := RSVP_FILTERSPEC_V6_GPI(8, this)
            return this.__FilterSpecV6Gpi
        }
    }
}
