#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OPM_RANDOM_NUMBER.ahk" { OPM_RANDOM_NUMBER }

/**
 * Contains parameters for the IOPMVideoOutput::COPPCompatibleGetInformation method.
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusinput">AMCOPPStatusInput</a> structure used in COPP.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_copp_compatible_get_info_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure that contains a cryptographically secure 128-bit random number.
     */
    rnRandomNumber : OPM_RANDOM_NUMBER

    /**
     * A GUID that defines the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     */
    guidInformation : Guid

    /**
     * The sequence number of the status request. The application must keep a running count of status requests. For each request, increment the sequence number by one.
     * 
     * On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-coppcompatiblegetinformation">COPPCompatibleGetInformation</a>, set <b>ulSequenceNumber</b> equal to the starting sequence number, which is specified when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-startinitialization">IOPMVideoOutput::FinishInitialization</a>. On each subsequent call, increment <b>ulSequenceNumber</b> by 1.
     */
    ulSequenceNumber : UInt32

    /**
     * The number of bytes of valid data in the <b>abParameters</b> member.
     */
    cbParametersSize : UInt32

    /**
     * The data for the status request. The meaning of the data depends on the request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     */
    abParameters : Int8[4056]

}
