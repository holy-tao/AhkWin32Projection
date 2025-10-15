#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class NetBios {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NCBNAMSZ => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_LANA => 254

    /**
     * @type {Integer (UInt32)}
     */
    static NAME_FLAGS_MASK => 135

    /**
     * @type {Integer (UInt32)}
     */
    static GROUP_NAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static UNIQUE_NAME => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REGISTERING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REGISTERED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEREGISTERED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_DEREG => 7

    /**
     * @type {Integer (UInt32)}
     */
    static LISTEN_OUTSTANDING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CALL_PENDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_ESTABLISHED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HANGUP_PENDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HANGUP_COMPLETE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_ABORTED => 6

    /**
     * @type {String}
     */
    static ALL_TRANSPORTS => "M\u0000\u0000\u0000"

    /**
     * @type {String}
     */
    static MS_NBF => "MNBF"

    /**
     * @type {Integer (UInt32)}
     */
    static NCBCALL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NCBLISTEN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static NCBHANGUP => 18

    /**
     * @type {Integer (UInt32)}
     */
    static NCBSEND => 20

    /**
     * @type {Integer (UInt32)}
     */
    static NCBRECV => 21

    /**
     * @type {Integer (UInt32)}
     */
    static NCBRECVANY => 22

    /**
     * @type {Integer (UInt32)}
     */
    static NCBCHAINSEND => 23

    /**
     * @type {Integer (UInt32)}
     */
    static NCBDGSEND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NCBDGRECV => 33

    /**
     * @type {Integer (UInt32)}
     */
    static NCBDGSENDBC => 34

    /**
     * @type {Integer (UInt32)}
     */
    static NCBDGRECVBC => 35

    /**
     * @type {Integer (UInt32)}
     */
    static NCBADDNAME => 48

    /**
     * @type {Integer (UInt32)}
     */
    static NCBDELNAME => 49

    /**
     * @type {Integer (UInt32)}
     */
    static NCBRESET => 50

    /**
     * @type {Integer (UInt32)}
     */
    static NCBASTAT => 51

    /**
     * @type {Integer (UInt32)}
     */
    static NCBSSTAT => 52

    /**
     * @type {Integer (UInt32)}
     */
    static NCBCANCEL => 53

    /**
     * @type {Integer (UInt32)}
     */
    static NCBADDGRNAME => 54

    /**
     * @type {Integer (UInt32)}
     */
    static NCBENUM => 55

    /**
     * @type {Integer (UInt32)}
     */
    static NCBUNLINK => 112

    /**
     * @type {Integer (UInt32)}
     */
    static NCBSENDNA => 113

    /**
     * @type {Integer (UInt32)}
     */
    static NCBCHAINSENDNA => 114

    /**
     * @type {Integer (UInt32)}
     */
    static NCBLANSTALERT => 115

    /**
     * @type {Integer (UInt32)}
     */
    static NCBACTION => 119

    /**
     * @type {Integer (UInt32)}
     */
    static NCBFINDNAME => 120

    /**
     * @type {Integer (UInt32)}
     */
    static NCBTRACE => 121

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNCH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_GOODRET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_BUFLEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_ILLCMD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_CMDTMO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_INCOMP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_BADDR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_SNUMOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_NORES => 9

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_SCLOSED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_CMDCAN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_DUPNAME => 13

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_NAMTFUL => 14

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_ACTSES => 15

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_LOCTFUL => 17

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_REMTFUL => 18

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_ILLNN => 19

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_NOCALL => 20

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_NOWILD => 21

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_INUSE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_NAMERR => 23

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_SABORT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_NAMCONF => 25

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_IFBUSY => 33

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_TOOMANY => 34

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_BRIDGE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_CANOCCR => 36

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_CANCEL => 38

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_DUPENV => 48

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_ENVNOTDEF => 52

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_OSRESNOTAV => 53

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_MAXAPPS => 54

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_NOSAPS => 55

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_NORESOURCES => 56

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_INVADDRESS => 57

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_INVDDID => 59

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_LOCKFAIL => 60

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_OPENERR => 63

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_SYSTEM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NRC_PENDING => 255
;@endregion Constants

;@region Methods
    /**
     * The Netbios function interprets and executes the specified network control block (NCB).
     * @param {Pointer<NCB>} pncb A  pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure that describes the network control block.
     * @returns {Integer} For synchronous requests, the return value is the return code in the <a href="/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure. That value is also returned in the <b>ncb_retcode</b> member of the <b>NCB</b> structure.
     * 
     * For asynchronous requests, there are the following possibilities:
     * 
     * <ul>
     * <li>If the asynchronous command has already completed when <b>Netbios</b> returns to its caller, the return value is the return code of the NCB structure, just as if it were a synchronous <a href="/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure.</li>
     * <li>If the asynchronous command is still pending when <b>Netbios</b> returns to its caller, the return value is zero.</li>
     * </ul>
     * If the address specified by the pncb parameter is invalid, the return value is <b>NRC_BADNCB</b>.
     * 
     * If the buffer length specified in the <b>ncb_length</b> member of the <a href="/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure is incorrect, or if the buffer specified by the <b>ncb_retcode</b> member is protected from write operations, the return value is <b>NRC_BUFLEN</b>.
     * @see https://docs.microsoft.com/windows/win32/api//nb30/nf-nb30-netbios
     * @since windows5.0
     */
    static Netbios(pncb) {
        result := DllCall("NETAPI32.dll\Netbios", "ptr", pncb, "char")
        return result
    }

;@endregion Methods
}
