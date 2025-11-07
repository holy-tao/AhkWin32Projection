#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PHONE_BUTTON_FUNCTION enum provides detailed information on a button's function.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-phone_button_function
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_BUTTON_FUNCTION{

    /**
     * A "dummy" function assignment that indicates that the exact function of the button is unknown or has not been assigned.
     * @type {Integer (Int32)}
     */
    static PBF_UNKNOWN => 0

    /**
     * Initiates a conference call or adds a call to a conference call.
     * @type {Integer (Int32)}
     */
    static PBF_CONFERENCE => 1

    /**
     * Initiates a call transfer or completes the transfer of a call.
     * @type {Integer (Int32)}
     */
    static PBF_TRANSFER => 2

    /**
     * Drops the active call.
     * @type {Integer (Int32)}
     */
    static PBF_DROP => 3

    /**
     * Places the active call on hold.
     * @type {Integer (Int32)}
     */
    static PBF_HOLD => 4

    /**
     * Takes a call off hold.
     * @type {Integer (Int32)}
     */
    static PBF_RECALL => 5

    /**
     * Disconnects a call, such as after initiating a transfer.
     * @type {Integer (Int32)}
     */
    static PBF_DISCONNECT => 6

    /**
     * Reconnects a call that is on consultation hold.
     * @type {Integer (Int32)}
     */
    static PBF_CONNECT => 7

    /**
     * Turns on a message waiting lamp.
     * @type {Integer (Int32)}
     */
    static PBF_MSGWAITON => 8

    /**
     * Turns off a message waiting lamp.
     * @type {Integer (Int32)}
     */
    static PBF_MSGWAITOFF => 9

    /**
     * Allows the user to select the ring pattern of the phone.
     * @type {Integer (Int32)}
     */
    static PBF_SELECTRING => 10

    /**
     * Indicates that the number to be dialed will be a short, abbreviated number consisting of one digit or a few digits.
     * @type {Integer (Int32)}
     */
    static PBF_ABBREVDIAL => 11

    /**
     * Initiates or changes call forwarding to this phone.
     * @type {Integer (Int32)}
     */
    static PBF_FORWARD => 12

    /**
     * Picks up a call ringing on another phone.
     * @type {Integer (Int32)}
     */
    static PBF_PICKUP => 13

    /**
     * Initiates a request to be notified if a call cannot be completed normally because of a busy signal or no answer.
     * @type {Integer (Int32)}
     */
    static PBF_RINGAGAIN => 14

    /**
     * Parks the active call on another phone, placing it on hold there.
     * @type {Integer (Int32)}
     */
    static PBF_PARK => 15

    /**
     * Rejects an incoming call before the call has been answered.
     * @type {Integer (Int32)}
     */
    static PBF_REJECT => 16

    /**
     * Redirects an incoming call to another extension before the call has been answered.
     * @type {Integer (Int32)}
     */
    static PBF_REDIRECT => 17

    /**
     * Mutes the phone's microphone device.
     * @type {Integer (Int32)}
     */
    static PBF_MUTE => 18

    /**
     * Increases the volume of audio through the phone's handset speaker or speakerphone.
     * @type {Integer (Int32)}
     */
    static PBF_VOLUMEUP => 19

    /**
     * Decreases the volume of audio through the phone's handset speaker or speakerphone.
     * @type {Integer (Int32)}
     */
    static PBF_VOLUMEDOWN => 20

    /**
     * Turns the phone's external speaker on.
     * @type {Integer (Int32)}
     */
    static PBF_SPEAKERON => 21

    /**
     * Turns the phone's external speaker off.
     * @type {Integer (Int32)}
     */
    static PBF_SPEAKEROFF => 22

    /**
     * Generates the equivalent of an onhook/offhook sequence. A flash typically indicates that any digits typed next are to be understood as commands to the switch. On many switches, places an active call on consultation hold.
     * @type {Integer (Int32)}
     */
    static PBF_FLASH => 23

    /**
     * Indicates that the next call is a data call.
     * @type {Integer (Int32)}
     */
    static PBF_DATAON => 24

    /**
     * Indicates that the next call is not a data call.
     * @type {Integer (Int32)}
     */
    static PBF_DATAOFF => 25

    /**
     * Places the phone in "do not disturb" mode; incoming calls receive a busy signal or are forwarded to an operator or voicemail system.
     * @type {Integer (Int32)}
     */
    static PBF_DONOTDISTURB => 26

    /**
     * Connects to the intercom to broadcast a page.
     * @type {Integer (Int32)}
     */
    static PBF_INTERCOM => 27

    /**
     * Selects a particular appearance of a bridged address.
     * @type {Integer (Int32)}
     */
    static PBF_BRIDGEDAPP => 28

    /**
     * Makes the phone appear "busy" to incoming calls.
     * @type {Integer (Int32)}
     */
    static PBF_BUSY => 29

    /**
     * Selects a particular call appearance.
     * @type {Integer (Int32)}
     */
    static PBF_CALLAPP => 30

    /**
     * Causes the phone to display the current date and time; this information would be sent by the switch.
     * @type {Integer (Int32)}
     */
    static PBF_DATETIME => 31

    /**
     * Calls up directory service from the switch.
     * @type {Integer (Int32)}
     */
    static PBF_DIRECTORY => 32

    /**
     * Forwards all calls destined for this phone to another phone used for coverage.
     * @type {Integer (Int32)}
     */
    static PBF_COVER => 33

    /**
     * Requests display of the caller ID on the phone's display.
     * @type {Integer (Int32)}
     */
    static PBF_CALLID => 34

    /**
     * Redials the last number dialed.
     * @type {Integer (Int32)}
     */
    static PBF_LASTNUM => 35

    /**
     * Places the phone in the mode it is configured for during night hours.
     * @type {Integer (Int32)}
     */
    static PBF_NIGHTSRV => 36

    /**
     * Sends all calls to another phone used for coverage; same as the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonfunction--constants">PHONEBUTTONFUNCTION_COVER constant</a>.
     * @type {Integer (Int32)}
     */
    static PBF_SENDCALLS => 37

    /**
     * Controls the message indicator lamp.
     * @type {Integer (Int32)}
     */
    static PBF_MSGINDICATOR => 38

    /**
     * Repertory dialing—the number to be dialed is provided as a shorthand following the pressing of this button.
     * @type {Integer (Int32)}
     */
    static PBF_REPDIAL => 39

    /**
     * Programs the shorthand-to-phone number mappings accessible by means of repertory dialing (the "REPDIAL" button).
     * @type {Integer (Int32)}
     */
    static PBF_SETREPDIAL => 40

    /**
     * The number to be dialed is provided as a shorthand following the pressing of this button. The mappings for system speed dialing are configured inside the switch.
     * @type {Integer (Int32)}
     */
    static PBF_SYSTEMSPEED => 41

    /**
     * The number to be dialed is provided as a shorthand following pressing of this button. The mappings for station speed dialing are specific to this station (phone).
     * @type {Integer (Int32)}
     */
    static PBF_STATIONSPEED => 42

    /**
     * Camps on an extension that returns a busy indication. When the remote station returns to idle, the phone will be rung with a distinctive pattern. Picking up the local phone reinitiates the call.
     * @type {Integer (Int32)}
     */
    static PBF_CAMPON => 43

    /**
     * When pressed while a call or call attempt is active, it will remember that call's number or command. When pressed while no call is active (such as during dial tone), it repeats the most recently saved command.
     * @type {Integer (Int32)}
     */
    static PBF_SAVEREPEAT => 44

    /**
     * Queues a call to an outside number after it encounters a trunk-busy indication. When a trunk becomes available later, the phone will be rung with a distinctive pattern. Picking up the local phone reinitiates the call.
     * @type {Integer (Int32)}
     */
    static PBF_QUEUECALL => 45

    /**
     * A "dummy" function assignment that indicates that the button does not have a function.
     * @type {Integer (Int32)}
     */
    static PBF_NONE => 46

    /**
     * Sends a request for a communications session.
     * @type {Integer (Int32)}
     */
    static PBF_SEND => 47
}
