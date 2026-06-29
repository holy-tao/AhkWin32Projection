#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\OPM_OMAC.ahk
#Include .\OPM_RANDOM_NUMBER.ahk

/**
 * OPM_GET_INFO_PARAMETERS (opmapi.h) contains parameters for the IOPMVideoOutput::GetInformation method.
 * @remarks
 * Initialize this structure as follows:
 * 
 * <ol>
 * <li>Generate a cryptographically secure 128-bit random number and copy it to the <b>rnRandomNumber</b> member. Do not re-use this number after calling <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-getinformation">GetInformation</a>.</li>
 * <li>Fill in the remaining structure members, except for the <b>omac</b> member.</li>
 * <li>Use the OMAC 1 algorithm to calculate a message authentication code (MAC) for the block of data that appears after the <b>omac</b> member (excluding the <b>omac</b> member).</li>
 * <li>Copy the MAC to the <b>omac</b> member.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_get_info_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_GET_INFO_PARAMETERS extends Win32Struct {
    static sizeof => 4112

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_omac">OPM_OMAC</a> structure that contains a message authentication code (MAC) for the data in the rest of the structure.
     * @type {OPM_OMAC}
     */
    omac {
        get {
            if(!this.HasProp("__omac"))
                this.__omac := OPM_OMAC(0, this)
            return this.__omac
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure that contains a cryptographically secure 128-bit random number.
     * @type {OPM_RANDOM_NUMBER}
     */
    rnRandomNumber {
        get {
            if(!this.HasProp("__rnRandomNumber"))
                this.__rnRandomNumber := OPM_RANDOM_NUMBER(16, this)
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
                this.__guidInformation := Guid(32, this)
            return this.__guidInformation
        }
    }

    /**
     * The status sequence number. The application must keep a running count of status requests. For each request, increment the sequence number by 1.
     * 
     * On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-getinformation">GetInformation</a>, set <b>ulSequenceNumber</b> equal to the starting status sequence number, which is specified when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-startinitialization">IOPMVideoOutput::FinishInitialization</a>. On each subsequent call, increment <b>ulSequenceNumber</b> by 1.
     * 
     * Exception: If the status request fails, do not increment the sequence number. Instead, re-use the same number for the next status request.
     * @type {Integer}
     */
    ulSequenceNumber {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of bytes of valid data in the <b>abParameters</b> member.
     * @type {Integer}
     */
    cbParametersSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The data for the status request. The meaning of the data depends on the request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     * @type {Array<Integer>}
     */
    abParameters {
        get {
            if(!this.HasProp("__abParametersProxyArray"))
                this.__abParametersProxyArray := Win32FixedArray(this.ptr + 56, 4056, Primitive, "char")
            return this.__abParametersProxyArray
        }
    }
}
