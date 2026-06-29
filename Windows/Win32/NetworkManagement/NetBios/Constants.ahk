#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global NCBNAMSZ := 16

/**
 * @type {Integer (UInt32)}
 */
export global MAX_LANA := 254

/**
 * @type {Integer (UInt32)}
 */
export global NAME_FLAGS_MASK := 135

/**
 * @type {Integer (UInt32)}
 */
export global GROUP_NAME := 128

/**
 * @type {Integer (UInt32)}
 */
export global UNIQUE_NAME := 0

/**
 * @type {Integer (UInt32)}
 */
export global REGISTERING := 0

/**
 * @type {Integer (UInt32)}
 */
export global REGISTERED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DEREGISTERED := 5

/**
 * @type {Integer (UInt32)}
 */
export global DUPLICATE := 6

/**
 * @type {Integer (UInt32)}
 */
export global DUPLICATE_DEREG := 7

/**
 * @type {Integer (UInt32)}
 */
export global LISTEN_OUTSTANDING := 1

/**
 * @type {Integer (UInt32)}
 */
export global CALL_PENDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global SESSION_ESTABLISHED := 3

/**
 * @type {Integer (UInt32)}
 */
export global HANGUP_PENDING := 4

/**
 * @type {Integer (UInt32)}
 */
export global HANGUP_COMPLETE := 5

/**
 * @type {Integer (UInt32)}
 */
export global SESSION_ABORTED := 6

/**
 * @type {String}
 */
export global ALL_TRANSPORTS := "M" Chr(0) "" Chr(0) "" Chr(0) ""

/**
 * @type {String}
 */
export global MS_NBF := "MNBF"

/**
 * @type {Integer (UInt32)}
 */
export global NCBCALL := 16

/**
 * @type {Integer (UInt32)}
 */
export global NCBLISTEN := 17

/**
 * @type {Integer (UInt32)}
 */
export global NCBHANGUP := 18

/**
 * @type {Integer (UInt32)}
 */
export global NCBSEND := 20

/**
 * @type {Integer (UInt32)}
 */
export global NCBRECV := 21

/**
 * @type {Integer (UInt32)}
 */
export global NCBRECVANY := 22

/**
 * @type {Integer (UInt32)}
 */
export global NCBCHAINSEND := 23

/**
 * @type {Integer (UInt32)}
 */
export global NCBDGSEND := 32

/**
 * @type {Integer (UInt32)}
 */
export global NCBDGRECV := 33

/**
 * @type {Integer (UInt32)}
 */
export global NCBDGSENDBC := 34

/**
 * @type {Integer (UInt32)}
 */
export global NCBDGRECVBC := 35

/**
 * @type {Integer (UInt32)}
 */
export global NCBADDNAME := 48

/**
 * @type {Integer (UInt32)}
 */
export global NCBDELNAME := 49

/**
 * @type {Integer (UInt32)}
 */
export global NCBRESET := 50

/**
 * @type {Integer (UInt32)}
 */
export global NCBASTAT := 51

/**
 * @type {Integer (UInt32)}
 */
export global NCBSSTAT := 52

/**
 * @type {Integer (UInt32)}
 */
export global NCBCANCEL := 53

/**
 * @type {Integer (UInt32)}
 */
export global NCBADDGRNAME := 54

/**
 * @type {Integer (UInt32)}
 */
export global NCBENUM := 55

/**
 * @type {Integer (UInt32)}
 */
export global NCBUNLINK := 112

/**
 * @type {Integer (UInt32)}
 */
export global NCBSENDNA := 113

/**
 * @type {Integer (UInt32)}
 */
export global NCBCHAINSENDNA := 114

/**
 * @type {Integer (UInt32)}
 */
export global NCBLANSTALERT := 115

/**
 * @type {Integer (UInt32)}
 */
export global NCBACTION := 119

/**
 * @type {Integer (UInt32)}
 */
export global NCBFINDNAME := 120

/**
 * @type {Integer (UInt32)}
 */
export global NCBTRACE := 121

/**
 * @type {Integer (UInt32)}
 */
export global ASYNCH := 128

/**
 * @type {Integer (UInt32)}
 */
export global NRC_GOODRET := 0

/**
 * @type {Integer (UInt32)}
 */
export global NRC_BUFLEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global NRC_ILLCMD := 3

/**
 * @type {Integer (UInt32)}
 */
export global NRC_CMDTMO := 5

/**
 * @type {Integer (UInt32)}
 */
export global NRC_INCOMP := 6

/**
 * @type {Integer (UInt32)}
 */
export global NRC_BADDR := 7

/**
 * @type {Integer (UInt32)}
 */
export global NRC_SNUMOUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global NRC_NORES := 9

/**
 * @type {Integer (UInt32)}
 */
export global NRC_SCLOSED := 10

/**
 * @type {Integer (UInt32)}
 */
export global NRC_CMDCAN := 11

/**
 * @type {Integer (UInt32)}
 */
export global NRC_DUPNAME := 13

/**
 * @type {Integer (UInt32)}
 */
export global NRC_NAMTFUL := 14

/**
 * @type {Integer (UInt32)}
 */
export global NRC_ACTSES := 15

/**
 * @type {Integer (UInt32)}
 */
export global NRC_LOCTFUL := 17

/**
 * @type {Integer (UInt32)}
 */
export global NRC_REMTFUL := 18

/**
 * @type {Integer (UInt32)}
 */
export global NRC_ILLNN := 19

/**
 * @type {Integer (UInt32)}
 */
export global NRC_NOCALL := 20

/**
 * @type {Integer (UInt32)}
 */
export global NRC_NOWILD := 21

/**
 * @type {Integer (UInt32)}
 */
export global NRC_INUSE := 22

/**
 * @type {Integer (UInt32)}
 */
export global NRC_NAMERR := 23

/**
 * @type {Integer (UInt32)}
 */
export global NRC_SABORT := 24

/**
 * @type {Integer (UInt32)}
 */
export global NRC_NAMCONF := 25

/**
 * @type {Integer (UInt32)}
 */
export global NRC_IFBUSY := 33

/**
 * @type {Integer (UInt32)}
 */
export global NRC_TOOMANY := 34

/**
 * @type {Integer (UInt32)}
 */
export global NRC_BRIDGE := 35

/**
 * @type {Integer (UInt32)}
 */
export global NRC_CANOCCR := 36

/**
 * @type {Integer (UInt32)}
 */
export global NRC_CANCEL := 38

/**
 * @type {Integer (UInt32)}
 */
export global NRC_DUPENV := 48

/**
 * @type {Integer (UInt32)}
 */
export global NRC_ENVNOTDEF := 52

/**
 * @type {Integer (UInt32)}
 */
export global NRC_OSRESNOTAV := 53

/**
 * @type {Integer (UInt32)}
 */
export global NRC_MAXAPPS := 54

/**
 * @type {Integer (UInt32)}
 */
export global NRC_NOSAPS := 55

/**
 * @type {Integer (UInt32)}
 */
export global NRC_NORESOURCES := 56

/**
 * @type {Integer (UInt32)}
 */
export global NRC_INVADDRESS := 57

/**
 * @type {Integer (UInt32)}
 */
export global NRC_INVDDID := 59

/**
 * @type {Integer (UInt32)}
 */
export global NRC_LOCKFAIL := 60

/**
 * @type {Integer (UInt32)}
 */
export global NRC_OPENERR := 63

/**
 * @type {Integer (UInt32)}
 */
export global NRC_SYSTEM := 64

/**
 * @type {Integer (UInt32)}
 */
export global NRC_PENDING := 255
;@endregion Constants
