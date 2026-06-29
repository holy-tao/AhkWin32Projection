#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }
#Import ".\CONTROL_SERVICE.ahk" { CONTROL_SERVICE }
#Import ".\PARAM_BUFFER.ahk" { PARAM_BUFFER }
#Import ".\AD_GENERAL_PARAMS.ahk" { AD_GENERAL_PARAMS }
#Import ".\AD_GUARANTEED.ahk" { AD_GUARANTEED }

/**
 * The QOS object RSVP_ADSPEC provides a means by which information describing network devices along the data path between sender and receiver, pertaining to RSVP functionality and available services, is provided or retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_adspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_ADSPEC {
    #StructPack 4

    /**
     * The QOS object 
     * <b>QOS_OBJECT_HDR</b>.
     */
    ObjectHdr : QOS_OBJECT_HDR

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-ad_general_params">AD_GENERAL_PARAMS</a> structure that provides general characterization parameters for the flow. Information includes RSVP-enabled hop count, bandwidth and latency estimates, and the path's MTU.
     */
    GeneralParams : AD_GENERAL_PARAMS

    /**
     * Provides a count of the number of services available.
     */
    NumberOfServices : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-control_service">CONTROL_SERVICE</a> array, its element count based on <b>NumberOfServices</b>, which provides information about the services available along the data path between the sender and receiver of a given flow.
     */
    Services : CONTROL_SERVICE[1]

}
