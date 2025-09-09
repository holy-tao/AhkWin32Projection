#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPM_OMAC.ahk

/**
 * OPM_REQUESTED_INFORMATION (opmapi.h) contains the result of an Output Protection Manager (OPM) status request.
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusoutput">AMCOPPStatusOutput</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_requested_information
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_REQUESTED_INFORMATION extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 1

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_omac">OPM_OMAC</a> structure that contains a Message Authentication Code (MAC) of the status data. The driver will use AES-based one-key CBC MAC (OMAC) to calculate this value.
     * @type {OPM_OMAC}
     */
    omac{
        get {
            if(!this.HasProp("__omac"))
                this.__omac := OPM_OMAC(this.ptr + 0)
            return this.__omac
        }
    }

    /**
     * The size of the valid data in the <b>abRequestedInformation</b> member, in bytes.
     * @type {Integer}
     */
    cbRequestedInformationSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A buffer that contains the result of the status request. The meaning of the data depends on the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     * @type {Array<Byte>}
     */
    abRequestedInformation{
        get {
            if(!this.HasProp("__abRequestedInformationProxyArray"))
                this.__abRequestedInformationProxyArray := Win32FixedArray(this.ptr + 20, 4076, Primitive, "char")
            return this.__abRequestedInformationProxyArray
        }
    }
}
