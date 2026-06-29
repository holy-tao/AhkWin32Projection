#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_MAX_STRING_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_RANDOM_SIZE_V1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_DIGEST_SIZE_V1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_CURVE_FIELD_SIZE_V1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_PUBLIC_KEY_SIZE_V1 := 65

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_PRIVATE_KEY_SIZE_V1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_SIGNATURE_SIZE_V1 := 64

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_ENCRYPTION_BLOCK_SIZE_V1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_SCP_ENCRYPTION_KEY_SIZE_V1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_BIR_ALIGN_SIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_BIR_ALGIN_SIZE := 8

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_DATA_FLAG_PRIVACY := 2

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_DATA_FLAG_INTEGRITY := 1

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_DATA_FLAG_SIGNED := 4

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_DATA_FLAG_RAW := 32

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_DATA_FLAG_INTERMEDIATE := 64

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_DATA_FLAG_PROCESSED := 128

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_DATA_FLAG_OPTION_MASK_PRESENT := 8

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_PIXELS_PER_INCH := 1

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_PIXELS_PER_CM := 2

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMG_UNCOMPRESSED := 0

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMG_BIT_PACKED := 1

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMG_COMPRESSED_WSQ := 2

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMG_COMPRESSED_JPEG := 3

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMG_COMPRESSED_JPEG2000 := 4

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMG_COMPRESSED_PNG := 5

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_PLAIN := 0

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_ROLLED := 1

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMP_TYPE_NONLIVE_SCAN_PLAIN := 2

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMP_TYPE_NONLIVE_SCAN_ROLLED := 3

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMP_TYPE_LATENT := 7

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMP_TYPE_SWIPE := 8

/**
 * @type {Integer (UInt16)}
 */
export global WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_CONTACTLESS := 9

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_WINBIO := 9

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_NONE := 0

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_UNSUPPORTED_FACTOR := -2146861055

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_UNIT := -2146861054

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_UNKNOWN_ID := -2146861053

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CANCELED := -2146861052

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_NO_MATCH := -2146861051

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CAPTURE_ABORTED := -2146861050

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_ENROLLMENT_IN_PROGRESS := -2146861049

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_BAD_CAPTURE := -2146861048

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_CONTROL_CODE := -2146861047

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATA_COLLECTION_IN_PROGRESS := -2146861045

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_UNSUPPORTED_DATA_FORMAT := -2146861044

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_UNSUPPORTED_DATA_TYPE := -2146861043

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_UNSUPPORTED_PURPOSE := -2146861042

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_DEVICE_STATE := -2146861041

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DEVICE_BUSY := -2146861040

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_CANT_CREATE := -2146861039

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_CANT_OPEN := -2146861038

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_CANT_CLOSE := -2146861037

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_CANT_ERASE := -2146861036

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_CANT_FIND := -2146861035

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_ALREADY_EXISTS := -2146861034

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_FULL := -2146861032

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_LOCKED := -2146861031

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_CORRUPTED := -2146861030

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_NO_SUCH_RECORD := -2146861029

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DUPLICATE_ENROLLMENT := -2146861028

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_READ_ERROR := -2146861027

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_WRITE_ERROR := -2146861026

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_NO_RESULTS := -2146861025

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_NO_MORE_RECORDS := -2146861024

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_EOF := -2146861023

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATABASE_BAD_INDEX_VECTOR := -2146861022

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INCORRECT_BSP := -2146861020

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INCORRECT_SENSOR_POOL := -2146861019

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_NO_CAPTURE_DATA := -2146861018

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_SENSOR_MODE := -2146861017

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_LOCK_VIOLATION := -2146861014

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DUPLICATE_TEMPLATE := -2146861013

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_OPERATION := -2146861012

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_SESSION_BUSY := -2146861011

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CRED_PROV_DISABLED := -2146861008

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CRED_PROV_NO_CREDENTIAL := -2146861007

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DISABLED := -2146861006

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CONFIGURATION_FAILURE := -2146861005

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_SENSOR_UNAVAILABLE := -2146861004

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_SAS_ENABLED := -2146861003

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DEVICE_FAILURE := -2146861002

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_FAST_USER_SWITCH_DISABLED := -2146861001

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_NOT_ACTIVE_CONSOLE := -2146861000

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_EVENT_MONITOR_ACTIVE := -2146860999

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_PROPERTY_TYPE := -2146860998

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_PROPERTY_ID := -2146860997

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_UNSUPPORTED_PROPERTY := -2146860996

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_ADAPTER_INTEGRITY_FAILURE := -2146860995

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INCORRECT_SESSION_TYPE := -2146860994

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_SESSION_HANDLE_CLOSED := -2146860993

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DEADLOCK_DETECTED := -2146860992

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_NO_PREBOOT_IDENTITY := -2146860991

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_MAX_ERROR_COUNT_EXCEEDED := -2146860990

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_AUTO_LOGON_DISABLED := -2146860989

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_TICKET := -2146860988

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_TICKET_QUOTA_EXCEEDED := -2146860987

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_DATA_PROTECTION_FAILURE := -2146860986

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CRED_PROV_SECURITY_LOCKOUT := -2146860985

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_UNSUPPORTED_POOL_TYPE := -2146860984

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_SELECTION_REQUIRED := -2146860983

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_PRESENCE_MONITOR_ACTIVE := -2146860982

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_SUBFACTOR := -2146860981

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_CALIBRATION_FORMAT_ARRAY := -2146860980

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_NO_SUPPORTED_CALIBRATION_FORMAT := -2146860979

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_UNSUPPORTED_SENSOR_CALIBRATION_FORMAT := -2146860978

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CALIBRATION_BUFFER_TOO_SMALL := -2146860977

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CALIBRATION_BUFFER_TOO_LARGE := -2146860976

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_CALIBRATION_BUFFER_INVALID := -2146860975

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_KEY_IDENTIFIER := -2146860974

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_KEY_CREATION_FAILED := -2146860973

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_KEY_IDENTIFIER_BUFFER_TOO_SMALL := -2146860972

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_PROPERTY_UNAVAILABLE := -2146860971

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_POLICY_PROTECTION_UNAVAILABLE := -2146860970

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INSECURE_SENSOR := -2146860969

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_BUFFER_ID := -2146860968

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_INVALID_BUFFER := -2146860967

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_TRUSTLET_INTEGRITY_FAIL := -2146860966

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_E_ENROLLMENT_CANCELED_BY_SUSPEND := -2146860965

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_I_MORE_DATA := 589825

/**
 * @type {Integer (Int32)}
 */
export global WINBIO_I_EXTENDED_STATUS_INFORMATION := 589826

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_BIOMETRIC_READER := Guid("{e2b5183a-99ea-4cc3-ad6b-80ca8d715b80}")

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_BIOMETRIC_VENDOR := 4464640

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_WBDI_MAJOR_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINBIO_WBDI_MINOR_VERSION := 0
;@endregion Constants
