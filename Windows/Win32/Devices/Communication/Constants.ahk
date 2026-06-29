#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Communication
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MDM_COMPRESSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_ERROR_CONTROL := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_FORCED_EC := 4

/**
 * @type {Integer (UInt32)}
 */
export global MDM_CELLULAR := 8

/**
 * @type {Integer (UInt32)}
 */
export global MDM_FLOWCONTROL_HARD := 16

/**
 * @type {Integer (UInt32)}
 */
export global MDM_FLOWCONTROL_SOFT := 32

/**
 * @type {Integer (UInt32)}
 */
export global MDM_CCITT_OVERRIDE := 64

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SPEED_ADJUST := 128

/**
 * @type {Integer (UInt32)}
 */
export global MDM_TONE_DIAL := 256

/**
 * @type {Integer (UInt32)}
 */
export global MDM_BLIND_DIAL := 512

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V23_OVERRIDE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MDM_DIAGNOSTICS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_BEARERMODE := 61440

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_BEARERMODE := 12

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_PROTOCOLID := 983040

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_PROTOCOLID := 16

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_PROTOCOLDATA := 267386880

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_PROTOCOLDATA := 20

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_PROTOCOLINFO := 16

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_EXTENDEDINFO := 12

/**
 * @type {Integer (UInt32)}
 */
export global MDM_BEARERMODE_ANALOG := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_BEARERMODE_ISDN := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_BEARERMODE_GSM := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_HDLCPPP := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_V128 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_X75 := 3

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_V110 := 4

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_V120 := 5

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_AUTO := 6

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_ANALOG := 7

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_GPRS := 8

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PROTOCOLID_PIAFS := 9

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_HDLCPPP_SPEED := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_HDLCPPP_SPEED := 7

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_SPEED_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_SPEED_64K := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_SPEED_56K := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_HDLCPPP_AUTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_HDLCPPP_AUTH := 56

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_AUTH_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_AUTH_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_AUTH_PAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_AUTH_CHAP := 3

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_AUTH_MSCHAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_HDLCPPP_ML := 6

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_HDLCPPP_ML := 192

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_ML_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_ML_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_HDLCPPP_ML_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_V120_SPEED := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_V120_SPEED := 7

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V120_SPEED_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V120_SPEED_64K := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V120_SPEED_56K := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_V120_ML := 6

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_V120_ML := 192

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V120_ML_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V120_ML_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V120_ML_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_X75_DATA := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_X75_DATA := 7

/**
 * @type {Integer (UInt32)}
 */
export global MDM_X75_DATA_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_X75_DATA_64K := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_X75_DATA_128K := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_X75_DATA_T_70 := 3

/**
 * @type {Integer (UInt32)}
 */
export global MDM_X75_DATA_BTX := 4

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_V110_SPEED := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_V110_SPEED := 15

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_1DOT2K := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_2DOT4K := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_4DOT8K := 3

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_9DOT6K := 4

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_12DOT0K := 5

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_14DOT4K := 6

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_19DOT2K := 7

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_28DOT8K := 8

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_38DOT4K := 9

/**
 * @type {Integer (UInt32)}
 */
export global MDM_V110_SPEED_57DOT6K := 10

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_AUTO_SPEED := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_AUTO_SPEED := 7

/**
 * @type {Integer (UInt32)}
 */
export global MDM_AUTO_SPEED_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_SHIFT_AUTO_ML := 6

/**
 * @type {Integer (UInt32)}
 */
export global MDM_MASK_AUTO_ML := 192

/**
 * @type {Integer (UInt32)}
 */
export global MDM_AUTO_ML_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_AUTO_ML_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_AUTO_ML_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_ANALOG_RLP_ON := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_ANALOG_RLP_OFF := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDM_ANALOG_V34 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PIAFS_INCOMING := 0

/**
 * @type {Integer (UInt32)}
 */
export global MDM_PIAFS_OUTGOING := 1

/**
 * @type {Guid}
 */
export global SID_3GPP_SUPSVCMODEL := Guid("{d7d08e07-d767-4478-b14a-eecc87ea12f7}")

/**
 * @type {Integer (UInt32)}
 */
export global MAXLENGTH_NAI := 72

/**
 * @type {Integer (UInt32)}
 */
export global MAXLENGTH_UICCDATASTORE := 10
;@endregion Constants
