#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPM_OMAC.ahk" { OPM_OMAC }

/**
 * OPM_REQUESTED_INFORMATION (opmapi.h) contains the result of an Output Protection Manager (OPM) status request.
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusoutput">AMCOPPStatusOutput</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_requested_information
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_REQUESTED_INFORMATION {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_omac">OPM_OMAC</a> structure that contains a Message Authentication Code (MAC) of the status data. The driver will use AES-based one-key CBC MAC (OMAC) to calculate this value.
     */
    omac : OPM_OMAC

    /**
     * The size of the valid data in the <b>abRequestedInformation</b> member, in bytes.
     */
    cbRequestedInformationSize : UInt32

    /**
     * A buffer that contains the result of the status request. The meaning of the data depends on the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     */
    abRequestedInformation : Int8[4076]

}
