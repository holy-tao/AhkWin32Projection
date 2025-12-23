#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk
#Include .\AD_GENERAL_PARAMS.ahk
#Include .\AD_GUARANTEED.ahk
#Include .\PARAM_BUFFER.ahk
#Include .\CONTROL_SERVICE.ahk

/**
 * The QOS object RSVP_ADSPEC provides a means by which information describing network devices along the data path between sender and receiver, pertaining to RSVP functionality and available services, is provided or retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_adspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_ADSPEC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The QOS object 
     * <b>QOS_OBJECT_HDR</b>.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(0, this)
            return this.__ObjectHdr
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-ad_general_params">AD_GENERAL_PARAMS</a> structure that provides general characterization parameters for the flow. Information includes RSVP-enabled hop count, bandwidth and latency estimates, and the path's MTU.
     * @type {AD_GENERAL_PARAMS}
     */
    GeneralParams{
        get {
            if(!this.HasProp("__GeneralParams"))
                this.__GeneralParams := AD_GENERAL_PARAMS(8, this)
            return this.__GeneralParams
        }
    }

    /**
     * Provides a count of the number of services available.
     * @type {Integer}
     */
    NumberOfServices {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-control_service">CONTROL_SERVICE</a> array, its element count based on <b>NumberOfServices</b>, which provides information about the services available along the data path between the sender and receiver of a given flow.
     * @type {Array<CONTROL_SERVICE>}
     */
    Services{
        get {
            if(!this.HasProp("__ServicesProxyArray"))
                this.__ServicesProxyArray := Win32FixedArray(this.ptr + 32, 1, CONTROL_SERVICE, "")
            return this.__ServicesProxyArray
        }
    }
}
