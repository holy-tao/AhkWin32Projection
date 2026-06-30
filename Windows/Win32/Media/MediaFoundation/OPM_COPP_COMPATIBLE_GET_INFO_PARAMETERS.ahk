#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\OPM_RANDOM_NUMBER.ahk

/**
 * Contains parameters for the IOPMVideoOutput::COPPCompatibleGetInformation method.
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusinput">AMCOPPStatusInput</a> structure used in COPP.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_copp_compatible_get_info_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS extends Win32Struct {
    static sizeof => 4096

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure that contains a cryptographically secure 128-bit random number.
     * @type {OPM_RANDOM_NUMBER}
     */
    rnRandomNumber {
        get {
            if(!this.HasProp("__rnRandomNumber"))
                this.__rnRandomNumber := OPM_RANDOM_NUMBER(0, this)
            return this.__rnRandomNumber
        }
    }

    /**
     * A GUID that defines the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     * @type {Guid}
     */
    guidInformation {
        get {
            if(!this.HasProp("__guidInformation"))
                this.__guidInformation := Guid(16, this)
            return this.__guidInformation
        }
    }

    /**
     * The sequence number of the status request. The application must keep a running count of status requests. For each request, increment the sequence number by one.
     * 
     * On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-coppcompatiblegetinformation">COPPCompatibleGetInformation</a>, set <b>ulSequenceNumber</b> equal to the starting sequence number, which is specified when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-startinitialization">IOPMVideoOutput::FinishInitialization</a>. On each subsequent call, increment <b>ulSequenceNumber</b> by 1.
     * @type {Integer}
     */
    ulSequenceNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of bytes of valid data in the <b>abParameters</b> member.
     * @type {Integer}
     */
    cbParametersSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The data for the status request. The meaning of the data depends on the request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     * @type {Array<Integer>}
     */
    abParameters {
        get {
            if(!this.HasProp("__abParametersProxyArray"))
                this.__abParametersProxyArray := Win32FixedArray(this.ptr + 40, 4056, Primitive, "char")
            return this.__abParametersProxyArray
        }
    }
}
