#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A member of the ADDRESS_CAPABILITY enum is used by the ITAddressCapabilities::get_AddressCapability method to indicate the address capability required.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-address_capability
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ADDRESS_CAPABILITY extends Win32Enum{

    /**
     * An address may support more than one 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">address type</a>, but please note that one may be used during 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itaddress-createcall">ITAddress::CreateCall</a>.
     * @type {Integer (Int32)}
     */
    static AC_ADDRESSTYPES => 0

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebearermode--constants">Bearer modes</a>.
     * @type {Integer (Int32)}
     */
    static AC_BEARERMODES => 1

    /**
     * The maximum number of (minimum bandwidth) calls that can be active (connected) on the line at any one time. The actual number of active calls can be lower if higher bandwidth calls are established on the line.
     * @type {Integer (Int32)}
     */
    static AC_MAXACTIVECALLS => 2

    /**
     * Maximum number of calls that can be on hold at once.
     * @type {Integer (Int32)}
     */
    static AC_MAXONHOLDCALLS => 3

    /**
     * Maximum number of calls that can be simultaneously pending transfer or conference.
     * @type {Integer (Int32)}
     */
    static AC_MAXONHOLDPENDINGCALLS => 4

    /**
     * Contains the maximum number of parties that can join a single conference call on this address.
     * @type {Integer (Int32)}
     */
    static AC_MAXNUMCONFERENCE => 5

    /**
     * Specifies the number of parties (including "self") that can be added in a conference call that is initiated as a generic consultation call using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-transfer">ITBasicCallControl::Transfer</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-finish">ITBasicCallControl::Finish</a> (FM_ASCONFERENCE).
     * @type {Integer (Int32)}
     */
    static AC_MAXNUMTRANSCONF => 6

    /**
     * Specifies digit modes detectable on this address using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_</a> flags. If no flag is set, digit monitoring is not supported.
     * @type {Integer (Int32)}
     */
    static AC_MONITORDIGITSUPPORT => 7

    /**
     * Specifies digit modes that can be generated on this address using a subset of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_</a> flags: LINEDIGITMODE_PULSE indicates digits can be generated as pulse/rotary tones, and LINEDIGITMODE_DTMF indicates digits can be generated as DTMF tones. If no flag is set, digit generation is not supported.
     * @type {Integer (Int32)}
     */
    static AC_GENERATEDIGITSUPPORT => 8

    /**
     * Specifies the different kinds of tones that can be generated on this line, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetonemode--constants">LINETONEMODE_</a>.
     * @type {Integer (Int32)}
     */
    static AC_GENERATETONEMODES => 9

    /**
     * Contains the maximum number of frequencies that can be specified in describing a general tone.
     * @type {Integer (Int32)}
     */
    static AC_GENERATETONEMAXNUMFREQ => 10

    /**
     * Contains the maximum number of frequencies that can be specified when monitoring a general tone. A value of 0 indicates that tone monitor is not available.
     * @type {Integer (Int32)}
     */
    static AC_MONITORTONEMAXNUMFREQ => 11

    /**
     * Contains the maximum number of entries that can be specified in a tone list.
     * @type {Integer (Int32)}
     */
    static AC_MONITORTONEMAXNUMENTRIES => 12

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevcapflags--constants">Device capability flags</a>.
     * @type {Integer (Int32)}
     */
    static AC_DEVCAPFLAGS => 13

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineanswermode--constants">Answer modes</a>.
     * @type {Integer (Int32)}
     */
    static AC_ANSWERMODES => 14

    /**
     * Specifies the features available for this line using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linefeature--constants">LINEFEATURE_ constants</a>. Invoking a supported feature requires the line to be in the proper state and the underlying line device to be opened in a compatible mode. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the line is in the appropriate state for the operation to be meaningful. This member allows an application to discover which line features can be (and which can never be) supported by the device.
     * @type {Integer (Int32)}
     */
    static AC_LINEFEATURES => 15

    /**
     * Indicates 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS_</a> values that can be modified.
     * @type {Integer (Int32)}
     */
    static AC_SETTABLEDEVSTATUS => 16

    /**
     * Indicates whether park is supported using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineparkmode--constants">LINEPARKMODE_</a> flags.
     * @type {Integer (Int32)}
     */
    static AC_PARKSUPPORT => 17

    /**
     * Identifies support for caller number identification using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_</a> flags.
     * @type {Integer (Int32)}
     */
    static AC_CALLERIDSUPPORT => 18

    /**
     * Identifies support for called number identification using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_</a> flags.
     * @type {Integer (Int32)}
     */
    static AC_CALLEDIDSUPPORT => 19

    /**
     * Indicates whether connected ID is supported using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_</a> flags.
     * @type {Integer (Int32)}
     */
    static AC_CONNECTEDIDSUPPORT => 20

    /**
     * Indicates whether redirection ID is supported using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_</a> flags.
     * @type {Integer (Int32)}
     */
    static AC_REDIRECTIONIDSUPPORT => 21

    /**
     * Indicates whether redirecting ID is supported using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_</a> flags.
     * @type {Integer (Int32)}
     */
    static AC_REDIRECTINGIDSUPPORT => 22

    /**
     * The address 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrcapflags--constants">capability flags</a> describe various Boolean address capabilities. For example, LINEADDRCAPFLAGS_FWDNUMRINGS indicates whether the number of rings for a no-answer can be specified when forwarding on a no-answer.
     * @type {Integer (Int32)}
     */
    static AC_ADDRESSCAPFLAGS => 23

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallfeature--constants">Call feature set one</a>.
     * @type {Integer (Int32)}
     */
    static AC_CALLFEATURES1 => 24

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallfeature2--constants">Supplemental call features</a> for conferencing, transferring, and parking calls.
     * @type {Integer (Int32)}
     */
    static AC_CALLFEATURES2 => 25

    /**
     * Specifies the address's capabilities for removing calls from a conference call. This member uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineremovefromconf--constants">LINEREMOVEFROMCONF_ constants</a>.
     * @type {Integer (Int32)}
     */
    static AC_REMOVEFROMCONFCAPS => 26

    /**
     * Uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ constants</a> to specify the state of the call after it has been removed from a conference call.
     * @type {Integer (Int32)}
     */
    static AC_REMOVEFROMCONFSTATE => 27

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetransfermode--constants">Transfer modes</a>.
     * @type {Integer (Int32)}
     */
    static AC_TRANSFERMODES => 28

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrfeature--constants">line address features</a> describe operations that can be invoked on an address. For example, if LINEADDRFEATURE_FORWARD is set, the address can be forwarded.
     * @type {Integer (Int32)}
     */
    static AC_ADDRESSFEATURES => 29

    /**
     * The call state or states upon which a call made by a predictive dialer can be set to automatically transfer the call to another address; one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ constants</a>. The value 0 indicates automatic transfer based on call state is unavailable.
     * @type {Integer (Int32)}
     */
    static AC_PREDICTIVEAUTOTRANSFERSTATES => 30

    /**
     * Maximum data block size allowed.
     * @type {Integer (Int32)}
     */
    static AC_MAXCALLDATASIZE => 31

    /**
     * Returns the device identifier of the line device with which this address is associated. TAPI 2.1 cross-reference: 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a>.
     * @type {Integer (Int32)}
     */
    static AC_LINEID => 32

    /**
     * Address identifier. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @type {Integer (Int32)}
     */
    static AC_ADDRESSID => 33

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Forwarding modes</a>.
     * @type {Integer (Int32)}
     */
    static AC_FORWARDMODES => 34

    /**
     * The maximum number of different forwarding entries that can be supported by the current address.
     * @type {Integer (Int32)}
     */
    static AC_MAXFORWARDENTRIES => 35

    /**
     * Specifies the maximum number of entries that can be set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itforwardinformation-setforwardtype">ITForwardInformation::SetForwardType</a> that can contain forwarding instructions based on a specific caller (selective call forwarding). This member is zero if selective call forwarding is not supported.
     * @type {Integer (Int32)}
     */
    static AC_MAXSPECIFICENTRIES => 36

    /**
     * Specifies the minimum number of rings that can be set to determine when a call is officially considered "no answer."
     * @type {Integer (Int32)}
     */
    static AC_MINFWDNUMRINGS => 37

    /**
     * Specifies the maximum number of rings that can be set to determine when a call is officially considered "no answer."
     * @type {Integer (Int32)}
     */
    static AC_MAXFWDNUMRINGS => 38

    /**
     * The maximum number of concurrent call completion requests that can be outstanding on this address. Zero implies that call completion is not available.
     * @type {Integer (Int32)}
     */
    static AC_MAXCALLCOMPLETIONS => 39

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallcomplcond--constants">Call completion conditions</a>.
     * @type {Integer (Int32)}
     */
    static AC_CALLCOMPLETIONCONDITIONS => 40

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallcomplmode--constants">Call completion modes</a>.
     * @type {Integer (Int32)}
     */
    static AC_CALLCOMPLETIONMODES => 41

    /**
     * The permanent identifier by which the line device is known in the system's configuration. This value does not change as lines are added and removed from the system. It can therefore be used to link line-specific information in the registry or other files in a way that is not affected by changes in other lines. If a line has more than one address, all addresses will have the same permanent device identifier. TSP writers should note that this value must be preserved across operating system upgrades.
     * @type {Integer (Int32)}
     */
    static AC_PERMANENTDEVICEID => 42

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AC_GATHERDIGITSMINTIMEOUT => 43

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AC_GATHERDIGITSMAXTIMEOUT => 44

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AC_GENERATEDIGITMINDURATION => 45

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AC_GENERATEDIGITMAXDURATION => 46

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AC_GENERATEDIGITDEFAULTDURATION => 47
}
