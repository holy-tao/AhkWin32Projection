#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class BiometricFramework {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_MAX_STRING_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_RANDOM_SIZE_V1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_DIGEST_SIZE_V1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_CURVE_FIELD_SIZE_V1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_PUBLIC_KEY_SIZE_V1 => 65

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_PRIVATE_KEY_SIZE_V1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_SIGNATURE_SIZE_V1 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_ENCRYPTION_BLOCK_SIZE_V1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SCP_ENCRYPTION_KEY_SIZE_V1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_BIR_ALIGN_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_BIR_ALGIN_SIZE => 8

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_DATA_FLAG_PRIVACY => 2

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_DATA_FLAG_INTEGRITY => 1

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_DATA_FLAG_SIGNED => 4

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_DATA_FLAG_RAW => 32

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_DATA_FLAG_INTERMEDIATE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_DATA_FLAG_PROCESSED => 128

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_DATA_FLAG_OPTION_MASK_PRESENT => 8

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_PIXELS_PER_INCH => 1

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_PIXELS_PER_CM => 2

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMG_UNCOMPRESSED => 0

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMG_BIT_PACKED => 1

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMG_COMPRESSED_WSQ => 2

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMG_COMPRESSED_JPEG => 3

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMG_COMPRESSED_JPEG2000 => 4

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMG_COMPRESSED_PNG => 5

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_PLAIN => 0

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_ROLLED => 1

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMP_TYPE_NONLIVE_SCAN_PLAIN => 2

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMP_TYPE_NONLIVE_SCAN_ROLLED => 3

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMP_TYPE_LATENT => 7

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMP_TYPE_SWIPE => 8

    /**
     * @type {Integer (UInt16)}
     */
    static WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_CONTACTLESS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINBIO => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_UNSUPPORTED_FACTOR => -2146861055

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_UNIT => -2146861054

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_UNKNOWN_ID => -2146861053

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CANCELED => -2146861052

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_NO_MATCH => -2146861051

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CAPTURE_ABORTED => -2146861050

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_ENROLLMENT_IN_PROGRESS => -2146861049

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_BAD_CAPTURE => -2146861048

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_CONTROL_CODE => -2146861047

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATA_COLLECTION_IN_PROGRESS => -2146861045

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_UNSUPPORTED_DATA_FORMAT => -2146861044

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_UNSUPPORTED_DATA_TYPE => -2146861043

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_UNSUPPORTED_PURPOSE => -2146861042

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_DEVICE_STATE => -2146861041

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DEVICE_BUSY => -2146861040

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_CANT_CREATE => -2146861039

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_CANT_OPEN => -2146861038

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_CANT_CLOSE => -2146861037

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_CANT_ERASE => -2146861036

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_CANT_FIND => -2146861035

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_ALREADY_EXISTS => -2146861034

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_FULL => -2146861032

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_LOCKED => -2146861031

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_CORRUPTED => -2146861030

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_NO_SUCH_RECORD => -2146861029

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DUPLICATE_ENROLLMENT => -2146861028

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_READ_ERROR => -2146861027

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_WRITE_ERROR => -2146861026

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_NO_RESULTS => -2146861025

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_NO_MORE_RECORDS => -2146861024

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_EOF => -2146861023

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATABASE_BAD_INDEX_VECTOR => -2146861022

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INCORRECT_BSP => -2146861020

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INCORRECT_SENSOR_POOL => -2146861019

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_NO_CAPTURE_DATA => -2146861018

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_SENSOR_MODE => -2146861017

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_LOCK_VIOLATION => -2146861014

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DUPLICATE_TEMPLATE => -2146861013

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_OPERATION => -2146861012

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_SESSION_BUSY => -2146861011

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CRED_PROV_DISABLED => -2146861008

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CRED_PROV_NO_CREDENTIAL => -2146861007

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DISABLED => -2146861006

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CONFIGURATION_FAILURE => -2146861005

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_SENSOR_UNAVAILABLE => -2146861004

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_SAS_ENABLED => -2146861003

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DEVICE_FAILURE => -2146861002

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_FAST_USER_SWITCH_DISABLED => -2146861001

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_NOT_ACTIVE_CONSOLE => -2146861000

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_EVENT_MONITOR_ACTIVE => -2146860999

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_PROPERTY_TYPE => -2146860998

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_PROPERTY_ID => -2146860997

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_UNSUPPORTED_PROPERTY => -2146860996

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_ADAPTER_INTEGRITY_FAILURE => -2146860995

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INCORRECT_SESSION_TYPE => -2146860994

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_SESSION_HANDLE_CLOSED => -2146860993

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DEADLOCK_DETECTED => -2146860992

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_NO_PREBOOT_IDENTITY => -2146860991

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_MAX_ERROR_COUNT_EXCEEDED => -2146860990

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_AUTO_LOGON_DISABLED => -2146860989

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_TICKET => -2146860988

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_TICKET_QUOTA_EXCEEDED => -2146860987

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_DATA_PROTECTION_FAILURE => -2146860986

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CRED_PROV_SECURITY_LOCKOUT => -2146860985

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_UNSUPPORTED_POOL_TYPE => -2146860984

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_SELECTION_REQUIRED => -2146860983

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_PRESENCE_MONITOR_ACTIVE => -2146860982

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_SUBFACTOR => -2146860981

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_CALIBRATION_FORMAT_ARRAY => -2146860980

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_NO_SUPPORTED_CALIBRATION_FORMAT => -2146860979

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_UNSUPPORTED_SENSOR_CALIBRATION_FORMAT => -2146860978

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CALIBRATION_BUFFER_TOO_SMALL => -2146860977

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CALIBRATION_BUFFER_TOO_LARGE => -2146860976

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_CALIBRATION_BUFFER_INVALID => -2146860975

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_KEY_IDENTIFIER => -2146860974

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_KEY_CREATION_FAILED => -2146860973

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_KEY_IDENTIFIER_BUFFER_TOO_SMALL => -2146860972

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_PROPERTY_UNAVAILABLE => -2146860971

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_POLICY_PROTECTION_UNAVAILABLE => -2146860970

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INSECURE_SENSOR => -2146860969

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_BUFFER_ID => -2146860968

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_INVALID_BUFFER => -2146860967

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_TRUSTLET_INTEGRITY_FAIL => -2146860966

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_E_ENROLLMENT_CANCELED_BY_SUSPEND => -2146860965

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_I_MORE_DATA => 589825

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_I_EXTENDED_STATUS_INFORMATION => 589826

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_BIOMETRIC_READER => "{e2b5183a-99ea-4cc3-ad6b-80ca8d715b80}"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BIOMETRIC_VENDOR => 4464640

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_WBDI_MAJOR_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_WBDI_MINOR_VERSION => 0
;@endregion Constants

;@region Methods
    /**
     * Retrieves information about installed biometric service providers. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} Factor A bitmask of WINBIO_BIOMETRIC_TYPE flags that specifies the biometric unit types to be enumerated. Only <b>WINBIO_TYPE_FINGERPRINT</b> is currently supported.
     * @param {Pointer<WINBIO_BSP_SCHEMA>} BspSchemaArray Address of a variable that receives a pointer  to an array of <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bsp-schema">WINBIO_BSP_SCHEMA</a> structures that contain information about each of the available service providers.  If the function does not succeed, the pointer is set to <b>NULL</b>. If the function succeeds, you must pass the pointer to <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release memory allocated internally for the array.
     * @param {Pointer<UIntPtr>} BspCount Pointer to a value that specifies the number of structures pointed to by the <i>BspSchemaArray</i> parameter.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmask contained in the <i>Factor</i> parameter contains one or more an invalid type bits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>BspSchemaArray</i> and <i>BspCount</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenumserviceproviders
     * @since windows6.1
     */
    static WinBioEnumServiceProviders(Factor, BspSchemaArray, BspCount) {
        result := DllCall("winbio.dll\WinBioEnumServiceProviders", "uint", Factor, "ptr", BspSchemaArray, "ptr*", BspCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enumerates all attached biometric units that match the input type.
     * @param {Integer} Factor A bitmask of WINBIO_BIOMETRIC_TYPE flags that specifies the biometric unit types to be enumerated. Only <b>WINBIO_TYPE_FINGERPRINT</b> is currently supported.
     * @param {Pointer<WINBIO_UNIT_SCHEMA>} UnitSchemaArray Address of a variable that receives a pointer to an array of   <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-unit-schema">WINBIO_UNIT_SCHEMA</a> structures that contain information about each enumerated biometric unit. If the function does not succeed, the pointer is set to <b>NULL</b>. If the function succeeds, you must pass the pointer to <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release memory allocated internally for the array.
     * @param {Pointer<UIntPtr>} UnitCount Pointer to a value that specifies the number of structures pointed to by the <i>UnitSchemaArray</i> parameter.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmask contained in the <i>Factor</i> parameter contains one or more an invalid type bits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitSchemaArray</i> and <i>UnitCount</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DISABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current administrative policy prohibits use of the Windows Biometric Framework API.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenumbiometricunits
     * @since windows6.1
     */
    static WinBioEnumBiometricUnits(Factor, UnitSchemaArray, UnitCount) {
        result := DllCall("winbio.dll\WinBioEnumBiometricUnits", "uint", Factor, "ptr", UnitSchemaArray, "ptr*", UnitCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enumerates all registered databases that match a specified type.
     * @param {Integer} Factor A bitmask of WINBIO_BIOMETRIC_TYPE flags that specifies the biometric unit types to be enumerated.  Only <b>WINBIO_TYPE_FINGERPRINT</b> is currently supported.
     * @param {Pointer<WINBIO_STORAGE_SCHEMA>} StorageSchemaArray Address of a variable that receives a pointer to  an array of   <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-storage-schema">WINBIO_STORAGE_SCHEMA</a> structures that contain information about each database. If the function does not succeed, the pointer is set to <b>NULL</b>. If the function succeeds, you must pass the pointer to <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release memory allocated internally for the array.
     * @param {Pointer<UIntPtr>} StorageCount Pointer to a value that specifies the number of structures pointed to by the <i>StorageSchemaArray</i> parameter.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmask contained in the <i>Factor</i> parameter contains one or more an invalid type bits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>StorageSchemaArray</i> and <i>StorageCount</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenumdatabases
     * @since windows6.1
     */
    static WinBioEnumDatabases(Factor, StorageSchemaArray, StorageCount) {
        result := DllCall("winbio.dll\WinBioEnumDatabases", "uint", Factor, "ptr", StorageSchemaArray, "ptr*", StorageCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens a handle to the biometric framework. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} NotificationMethod 
     * @param {Pointer<Void>} TargetWindow Handle  of the window that will receive the completion notices. This value is ignored unless the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_MESSAGE</b>.
     * @param {Integer} MessageCode Window message code the framework must send to signify completion notices. This value is ignored unless the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_MESSAGE</b>. The value must be within the range <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-app">WM_APP</a> (0x8000) to 0xBFFF.
     * 
     * The Windows Biometric Framework sets the <b>LPARAM</b> value of the message to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure that contains the results of the operation. You must call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release the structure after you have finished using it.
     * @param {Pointer<PWINBIO_ASYNC_COMPLETION_CALLBACK>} CallbackRoutine Address of the callback routine to be invoked for  completion notices. This value is ignored unless the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_CALLBACK</b>.
     * @param {Pointer<Void>} UserData Address of a buffer supplied by the caller. The buffer is not modified by the framework or the biometric unit. It is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure. Your application can use the data to help it determine what actions to perform upon receipt of the completion notice or to maintain additional information about the requested operation.
     * @param {Integer} AsynchronousOpen Specifies whether to block until the framework session has been opened. Specifying <b>FALSE</b> causes the process to block. Specifying <b>TRUE</b> causes the session to be opened asynchronously.
     * 
     * If you specify <b>FALSE</b> to open the framework session synchronously, success or failure is returned to the caller directly by this function in the  <b>HRESULT</b> return value. If the session is opened successfully, the first  asynchronous completion event your application receives will be for an asynchronous operation requested after the framework has been open.
     * 
     * If you specify <b>TRUE</b> to open the framework session asynchronously, the first asynchronous completion notice received will be for opening the framework. If the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_CALLBACK</b>, operation results are delivered to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure in the callback function specified by the <i>CallbackRoutine</i> parameter. If the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_MESSAGE</b>, operation results are delivered to the <b>WINBIO_ASYNC_RESULT</b> structure pointed to by the <b>LPARAM</b> field of the window message.
     * @param {Pointer<UInt32>} FrameworkHandle If the function does not succeed, this parameter will be <b>NULL</b>.
     * 
     * If the session is opened synchronously and successfully, this parameter will contain a pointer to the  session handle.
     * 
     * If you specify that the session be opened asynchronously, this method returns immediately, the session handle will be <b>NULL</b>, and you must examine the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure to determine whether the session was successfully opened.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to create the framework session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you set the notification method to <b>WINBIO_ASYNC_NOTIFY_MESSAGE</b>, the <i>TargetWindow</i> parameter cannot be <b>NULL</b> or <b>HWND_BROADCAST</b> and the <i>MessageCode</i> parameter cannot be zero (0).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FrameworkHandle</i> parameter and the <i>AsynchronousOpen</i> parameter must be set.
     * 
     * If you set the notification method to <b>WINBIO_ASYNC_NOTIFY_CALLBACK</b>, you must also specify the address of a callback function in the <i>CallbackRoutine</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioasyncopenframework
     * @since windows8.0
     */
    static WinBioAsyncOpenFramework(NotificationMethod, TargetWindow, MessageCode, CallbackRoutine, UserData, AsynchronousOpen, FrameworkHandle) {
        result := DllCall("winbio.dll\WinBioAsyncOpenFramework", "int", NotificationMethod, "ptr", TargetWindow, "uint", MessageCode, "ptr", CallbackRoutine, "ptr", UserData, "int", AsynchronousOpen, "uint*", FrameworkHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a framework handle previously opened with WinBioAsyncOpenFramework. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} FrameworkHandle Handle to the framework session that will be closed.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiocloseframework
     * @since windows8.0
     */
    static WinBioCloseFramework(FrameworkHandle) {
        result := DllCall("winbio.dll\WinBioCloseFramework", "uint", FrameworkHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously returns information about installed biometric service providers. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} FrameworkHandle Handle to the framework session opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>.
     * @param {Integer} Factor A bitmask of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_sensor_attributes">WINBIO_BIOMETRIC_TYPE</a> flags that specifies the biometric service provider types to be enumerated. For Windows 8, only <b>WINBIO_TYPE_FINGERPRINT</b> is supported.
     * @returns {HRESULT} The function returns an <b>HRESULT</b> indicating success or failure. Note that success indicates only that the function's arguments were valid. Failures encountered during the execution of the operation will be returned asynchronously to a <a href="/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure using the notification method specified in the call to <a href="/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You must set the <i>FrameworkHandle</i> argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmask contained in the <i>Factor</i> parameter contains one or more an invalid type bits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INCORRECT_SESSION_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FrameworkHandle</i> argument must represent an asynchronous framework session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioasyncenumserviceproviders
     * @since windows8.0
     */
    static WinBioAsyncEnumServiceProviders(FrameworkHandle, Factor) {
        result := DllCall("winbio.dll\WinBioAsyncEnumServiceProviders", "uint", FrameworkHandle, "uint", Factor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously enumerates all attached biometric units that match the input factor type.
     * @param {Integer} FrameworkHandle Handle to the framework session opened by calling  <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>.
     * @param {Integer} Factor A bitmask of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_sensor_attributes">WINBIO_BIOMETRIC_TYPE</a> flags that specifies the biometric unit types to be enumerated.  Only <b>WINBIO_TYPE_FINGERPRINT</b> is currently supported.
     * @returns {HRESULT} The function returns an <b>HRESULT</b> indicating success or failure. Note that success indicates only that the arguments were valid. Failures encountered during the execution of the operation will be returned asynchronously to a <a href="/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure using the notification method specified in the call to <a href="/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You must set the <i>FrameworkHandle</i> argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmask contained in the <i>Factor</i> parameter contains one or more an invalid type bits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DISABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current administrative policy prohibits use of the Windows Biometric Framework API.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INCORRECT_SESSION_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FrameworkHandle</i> argument must represent an asynchronous framework session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_SESSION_HANDLE_CLOSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle has been marked for closure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioasyncenumbiometricunits
     * @since windows8.0
     */
    static WinBioAsyncEnumBiometricUnits(FrameworkHandle, Factor) {
        result := DllCall("winbio.dll\WinBioAsyncEnumBiometricUnits", "uint", FrameworkHandle, "uint", Factor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously enumerates all registered databases that match a specified type.
     * @param {Integer} FrameworkHandle Handle to the framework session opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>.
     * @param {Integer} Factor A bitmask of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_sensor_attributes">WINBIO_BIOMETRIC_TYPE</a> flags that specifies the biometric database types to be enumerated. Only <b>WINBIO_TYPE_FINGERPRINT</b> is currently supported.
     * @returns {HRESULT} The function returns an <b>HRESULT</b> indicating success or failure. Note that success indicates only that the function's arguments were valid. Failures encountered during the execution of the operation will be returned asynchronously to a <a href="/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure using the notification method specified in the call to <a href="/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You must set the <i>FrameworkHandle</i> argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmask contained in the <i>Factor</i> parameter contains one or more an invalid type bits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INCORRECT_SESSION_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FrameworkHandle</i> argument must represent an asynchronous framework session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioasyncenumdatabases
     * @since windows8.0
     */
    static WinBioAsyncEnumDatabases(FrameworkHandle, Factor) {
        result := DllCall("winbio.dll\WinBioAsyncEnumDatabases", "uint", FrameworkHandle, "uint", Factor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Starts an asynchronous monitor of changes to the biometric framework.
     * @param {Integer} FrameworkHandle Handle to the framework session opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>.
     * @param {Integer} ChangeTypes A bitmask of type <b>WINBIO_FRAMEWORK_CHANGE_TYPE</b> flags that indicates the types of events that should generate asynchronous notifications. Beginning with  Windows 8, the following flag is available:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FRAMEWORK_CHANGE_UNIT"></a><a id="winbio_framework_change_unit"></a><dl>
     * <dt><b>WINBIO_FRAMEWORK_CHANGE_UNIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A biometric unit has been attached to or detached from the computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The function returns an <b>HRESULT</b> indicating success or failure. Note that success indicates only that the function arguments were valid. Failures encountered during the execution of the operation will be returned asynchronously to a <a href="/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure using the notification method specified in <a href="/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You must set the <i>FrameworkHandle</i> argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmask contained in the <i>ChangeTypes</i> parameter contains one or more an invalid type bits. Currently, the only available value is <b>WINBIO_FRAMEWORK_CHANGE_UNIT</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INCORRECT_SESSION_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FrameworkHandle</i> argument must represent an asynchronous framework session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioasyncmonitorframeworkchanges
     * @since windows8.0
     */
    static WinBioAsyncMonitorFrameworkChanges(FrameworkHandle, ChangeTypes) {
        result := DllCall("winbio.dll\WinBioAsyncMonitorFrameworkChanges", "uint", FrameworkHandle, "uint", ChangeTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Connects to a biometric service provider and one or more biometric units.
     * @param {Integer} Factor A bitmask of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_sensor_attributes">WINBIO_BIOMETRIC_TYPE</a> flags that specifies the biometric unit types to be enumerated. Only <b>WINBIO_TYPE_FINGERPRINT</b> is currently supported.
     * @param {Integer} PoolType 
     * @param {Integer} Flags A <b>ULONG</b> value that specifies biometric unit configuration and access characteristics for the new session. Configuration flags specify the general configuration of units in the session. Access flags specify how the application will use the biometric units. You must specify one configuration flag but you can combine that flag with any access flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_DEFAULT"></a><a id="winbio_flag_default"></a><dl>
     * <dt><b>WINBIO_FLAG_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: configuration
     * 
     * The biometric units operate in the manner specified during installation. You must use this value when the <i>PoolType</i> parameter is WINBIO_POOL_SYSTEM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_BASIC"></a><a id="winbio_flag_basic"></a><dl>
     * <dt><b>WINBIO_FLAG_BASIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: configuration
     * 
     * The biometric units operate only as basic capture devices. All processing, matching, and storage operations is performed by software plug-ins.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_ADVANCED"></a><a id="winbio_flag_advanced"></a><dl>
     * <dt><b>WINBIO_FLAG_ADVANCED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: configuration
     * 
     * The biometric units use internal processing and storage capabilities.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_RAW"></a><a id="winbio_flag_raw"></a><dl>
     * <dt><b>WINBIO_FLAG_RAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: access
     * 
     * The client application captures raw biometric data using <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiocapturesample">WinBioCaptureSample</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_MAINTENANCE"></a><a id="winbio_flag_maintenance"></a><dl>
     * <dt><b>WINBIO_FLAG_MAINTENANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: access
     * 
     * The client performs vendor-defined control operations on a biometric unit by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiocontrolunitprivileged">WinBioControlUnitPrivileged</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} UnitArray Pointer to an array of biometric unit identifiers to be included in the session. You can call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenumbiometricunits">WinBioEnumBiometricUnits</a> to enumerate the biometric units. Set this value to <b>NULL</b> if the <i>PoolType</i> parameter is <b>WINBIO_POOL_SYSTEM</b>.
     * @param {Pointer} UnitCount A value that specifies the number of elements in the array pointed to by the <i>UnitArray</i> parameter. Set this value to zero if the <i>PoolType</i> parameter is <b>WINBIO_POOL_SYSTEM</b>.
     * @param {Pointer<Guid>} DatabaseId A value that specifies the database(s) to be used by the session. If the <i>PoolType</i> parameter is <b>WINBIO_POOL_PRIVATE</b>, you must specify the GUID of an installed database.  If the <i>PoolType</i> parameter is not <b>WINBIO_POOL_PRIVATE</b>, you can specify one of the following common values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_DB_DEFAULT"></a><a id="winbio_db_default"></a><dl>
     * <dt><b>WINBIO_DB_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Each biometric unit in the sensor pool uses the default database specified in the default biometric unit configuration. You must specify this value if the <i>PoolType</i> parameter is <b>WINBIO_POOL_SYSTEM</b>. You cannot use this value if the <i>PoolType</i> parameter is <b>WINBIO_POOL_PRIVATE</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_DB_BOOTSTRAP"></a><a id="winbio_db_bootstrap"></a><dl>
     * <dt><b>WINBIO_DB_BOOTSTRAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can specify this value to be used for scenarios prior to starting Windows. Typically, the database is part of the sensor chip or is part of the BIOS and can only be used for template enrollment and deletion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_DB_ONCHIP"></a><a id="winbio_db_onchip"></a><dl>
     * <dt><b>WINBIO_DB_ONCHIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database is on the sensor chip and is available for enrollment and matching.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} SessionHandle Pointer to the new session handle. If the function does not succeed, the handle is set to zero.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments have incorrect values or are incompatible with other arguments.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle pointer in the <i>SessionHandle</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Flags</i> parameter contains the <b>WINBIO_FLAG_RAW</b> or the <b>WINBIO_FLAG_MAINTENANCE</b> flag and the caller has not been granted either access permission.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_INVALID_UNIT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the biometric unit numbers specified in the <i>UnitArray</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_NOT_ACTIVE_CONSOLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client application is running on a remote desktop client and is attempting to open a system pool session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_SENSOR_UNAVAILABLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>PoolType</i> parameter is set to WINBIO_POOL_PRIVATE and one or more of the requested sensors in that pool is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DISABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current administrative policy prohibits use of the Windows Biometric Framework API.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioopensession
     * @since windows6.1
     */
    static WinBioOpenSession(Factor, PoolType, Flags, UnitArray, UnitCount, DatabaseId, SessionHandle) {
        result := DllCall("winbio.dll\WinBioOpenSession", "uint", Factor, "uint", PoolType, "uint", Flags, "uint*", UnitArray, "ptr", UnitCount, "ptr", DatabaseId, "uint*", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously connects to a biometric service provider and one or more biometric units. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} Factor A bitmask of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_sensor_attributes">WINBIO_BIOMETRIC_TYPE</a> flags that specifies the biometric unit types to be enumerated. Only <b>WINBIO_TYPE_FINGERPRINT</b> is currently supported.
     * @param {Integer} PoolType 
     * @param {Integer} Flags A <b>ULONG</b> value that specifies biometric unit configuration and access characteristics for the new session. Configuration flags specify the general configuration of units in the session. Access flags specify how the application will use the biometric units. You must specify one configuration flag but you can combine that flag with any access flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_DEFAULT"></a><a id="winbio_flag_default"></a><dl>
     * <dt><b>WINBIO_FLAG_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: configuration
     * 
     * The biometric units operate in the manner specified during installation. You must use this value when the <i>PoolType</i> parameter is <b>WINBIO_POOL_SYSTEM</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_BASIC"></a><a id="winbio_flag_basic"></a><dl>
     * <dt><b>WINBIO_FLAG_BASIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: configuration
     * 
     * The biometric units operate only as basic capture devices. All processing, matching, and storage operations is performed by software plug-ins.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_ADVANCED"></a><a id="winbio_flag_advanced"></a><dl>
     * <dt><b>WINBIO_FLAG_ADVANCED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: configuration
     * 
     * The biometric units use internal processing and storage capabilities.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_RAW"></a><a id="winbio_flag_raw"></a><dl>
     * <dt><b>WINBIO_FLAG_RAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: access
     * 
     * The client application captures raw biometric data using <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiocapturesample">WinBioCaptureSample</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_FLAG_MAINTENANCE"></a><a id="winbio_flag_maintenance"></a><dl>
     * <dt><b>WINBIO_FLAG_MAINTENANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group: access
     * 
     * The client performs vendor-defined control operations on a biometric unit by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiocontrolunitprivileged">WinBioControlUnitPrivileged</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} UnitArray Pointer to an array of biometric unit identifiers to be included in the session. You can call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenumbiometricunits">WinBioEnumBiometricUnits</a> to enumerate the biometric units. Set this value to <b>NULL</b> if the <i>PoolType</i> parameter is <b>WINBIO_POOL_SYSTEM</b>.
     * @param {Pointer} UnitCount A value that specifies the number of elements in the array pointed to by the <i>UnitArray</i> parameter. Set this value to zero if the <i>PoolType</i> parameter is <b>WINBIO_POOL_SYSTEM</b>.
     * @param {Pointer<Guid>} DatabaseId A value that specifies the database(s) to be used by the session. If the <i>PoolType</i> parameter is <b>WINBIO_POOL_PRIVATE</b>, you must specify the GUID of an installed database.  If the <i>PoolType</i> parameter is not <b>WINBIO_POOL_PRIVATE</b>, you can specify one of the following common values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_DB_DEFAULT"></a><a id="winbio_db_default"></a><dl>
     * <dt><b>WINBIO_DB_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Each biometric unit in the sensor pool uses the default database specified in the default biometric unit configuration. You must specify this value if the <i>PoolType</i> parameter is <b>WINBIO_POOL_SYSTEM</b>. You cannot use this value if the <i>PoolType</i> parameter is <b>WINBIO_POOL_PRIVATE</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_DB_BOOTSTRAP"></a><a id="winbio_db_bootstrap"></a><dl>
     * <dt><b>WINBIO_DB_BOOTSTRAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can specify this value to be used for scenarios prior to starting Windows. Typically, the database is part of the sensor chip or is part of the BIOS and can only be used for template enrollment and deletion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_DB_ONCHIP"></a><a id="winbio_db_onchip"></a><dl>
     * <dt><b>WINBIO_DB_ONCHIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database is on the sensor chip and is available for enrollment and matching.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} NotificationMethod 
     * @param {Pointer<Void>} TargetWindow Handle  of the window that will receive the completion notices. This value is ignored unless the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_MESSAGE</b>.
     * @param {Integer} MessageCode Window message code the framework must send to signify completion notices. This value is ignored unless the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_MESSAGE</b>. The value must be within the range WM_APP(0x8000) to 0xBFFF.
     * 
     * The Windows Biometric Framework sets the <b>LPARAM</b> value of the message to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure that contains the results of the operation. You must call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release the structure after you have finished using it.
     * @param {Pointer<PWINBIO_ASYNC_COMPLETION_CALLBACK>} CallbackRoutine Address of callback routine to be invoked when the operation started by using the session handle completes. This value is ignored unless the  <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_CALLBACK</b>.
     * @param {Pointer<Void>} UserData Address of a buffer supplied by the caller. The buffer is not modified by the framework or the biometric unit. It is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure. Your application can use the data to help it determine what actions to perform upon receipt of the completion notice or to maintain additional information about the requested operation.
     * @param {Integer} AsynchronousOpen Specifies whether to block until the framework session has been opened. Specifying <b>FALSE</b> causes the process to block. Specifying <b>TRUE</b> causes the session to be opened asynchronously.
     * 
     * If you specify <b>FALSE</b> to open the framework session synchronously, success or failure is returned to the caller directly by this function in the  <b>HRESULT</b> return value. If the session is opened successfully, the first  asynchronous completion event your application receives will be for an asynchronous operation requested after the framework has been open.
     * 
     * If you specify <b>TRUE</b> to open the framework session asynchronously, the first asynchronous completion notice received will be for opening the framework. If the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_CALLBACK</b>, operation results are delivered to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure in the callback function specified by the <i>CallbackRoutine</i> parameter. If the <i>NotificationMethod</i> parameter is set to <b>WINBIO_ASYNC_NOTIFY_MESSAGE</b>, operation results are delivered to the <b>WINBIO_ASYNC_RESULT</b> structure pointed to by the LPARAM field of the window message.
     * @param {Pointer<UInt32>} SessionHandle If the function does not succeed, this parameter will be <b>NULL</b>.
     * 
     * If the session is opened synchronously and successfully, this parameter will contain a pointer to the  session handle.
     * 
     * If you specify that the session be opened asynchronously, this method returns immediately, the session handle will be <b>NULL</b>, and you must examine the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure to determine whether the session was successfully opened.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to create the biometric session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you set the notification method to <b>WINBIO_ASYNC_NOTIFY_MESSAGE</b>, the <i>TargetWindow</i> parameter cannot be <b>NULL</b> or <b>HWND_BROADCAST</b> and the <i>MessageCode</i> parameter cannot be zero (0).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SessionHandle</i> parameter and the <i>AsynchronousOpen</i> parameter must be set.
     * 
     * If you set the notification method to <b>WINBIO_ASYNC_NOTIFY_CALLBACK</b>, you must also specify the address of a callback function in the <i>CallbackRoutine</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Flags</i> parameter contains the <b>WINBIO_FLAG_RAW</b> or the <b>WINBIO_FLAG_MAINTENANCE</b> flag and the caller has not been granted either access permission.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_INVALID_UNIT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the biometric unit numbers specified in the <i>UnitArray</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_NOT_ACTIVE_CONSOLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client application is running on a remote desktop client and is attempting to open a system pool session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_SENSOR_UNAVAILABLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>PoolType</i> parameter is set to <b>WINBIO_POOL_PRIVATE</b> and one or more of the requested sensors in that pool is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DISABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current administrative policy prohibits use of the Windows Biometric Framework API.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioasyncopensession
     * @since windows8.0
     */
    static WinBioAsyncOpenSession(Factor, PoolType, Flags, UnitArray, UnitCount, DatabaseId, NotificationMethod, TargetWindow, MessageCode, CallbackRoutine, UserData, AsynchronousOpen, SessionHandle) {
        result := DllCall("winbio.dll\WinBioAsyncOpenSession", "uint", Factor, "uint", PoolType, "uint", Flags, "uint*", UnitArray, "ptr", UnitCount, "ptr", DatabaseId, "int", NotificationMethod, "ptr", TargetWindow, "uint", MessageCode, "ptr", CallbackRoutine, "ptr", UserData, "int", AsynchronousOpen, "uint*", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a biometric session and releases associated resources. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session. Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioclosesession
     * @since windows6.1
     */
    static WinBioCloseSession(SessionHandle) {
        result := DllCall("winbio.dll\WinBioCloseSession", "uint", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Captures a biometric sample and determines whether the sample corresponds to the specified user identity. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID of the user providing the biometric sample.
     * @param {Integer} SubFactor A <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that specifies the sub-factor associated with the biometric sample. The Windows Biometric Framework (WBF) currently supports only fingerprint capture and can use the following constants to represent sub-type information.
     * 
     * <ul>
     * <li>WINBIO_ANSI_381_POS_RH_THUMB</li>
     * <li>WINBIO_ANSI_381_POS_RH_INDEX_FINGER</li>
     * <li>WINBIO_ANSI_381_POS_RH_MIDDLE_FINGER</li>
     * <li>WINBIO_ANSI_381_POS_RH_RING_FINGER</li>
     * <li>WINBIO_ANSI_381_POS_RH_LITTLE_FINGER</li>
     * <li>WINBIO_ANSI_381_POS_LH_THUMB</li>
     * <li>WINBIO_ANSI_381_POS_LH_INDEX_FINGER</li>
     * <li>WINBIO_ANSI_381_POS_LH_MIDDLE_FINGER</li>
     * <li>WINBIO_ANSI_381_POS_LH_RING_FINGER</li>
     * <li>WINBIO_ANSI_381_POS_LH_LITTLE_FINGER</li>
     * <li>WINBIO_ANSI_381_POS_RH_FOUR_FINGERS</li>
     * <li>WINBIO_ANSI_381_POS_LH_FOUR_FINGERS</li>
     * <li>WINBIO_SUBTYPE_ANY</li>
     * </ul>
     * @param {Pointer<UInt32>} UnitId A pointer to a  <b>WINBIO_UNIT_ID</b> value that specifies the biometric unit that performed the verification.
     * @param {Pointer<Byte>} Match Pointer to a Boolean value that specifies whether the captured sample matched the user identity specified by the <i>Identity</i> parameter.
     * @param {Pointer<UInt32>} RejectDetail A pointer to a <b>ULONG</b> value that contains additional information about the failure to capture a biometric sample. If the capture succeeded, this parameter is set to zero. The following values are defined for fingerprint capture:
     * 
     * <ul>
     * <li>WINBIO_FP_TOO_HIGH</li>
     * <li>WINBIO_FP_TOO_LOW</li>
     * <li>WINBIO_FP_TOO_LEFT</li>
     * <li>WINBIO_FP_TOO_RIGHT</li>
     * <li>WINBIO_FP_TOO_FAST</li>
     * <li>WINBIO_FP_TOO_SLOW</li>
     * <li>WINBIO_FP_POOR_QUALITY</li>
     * <li>WINBIO_FP_TOO_SKEWED</li>
     * <li>WINBIO_FP_TOO_SHORT</li>
     * <li>WINBIO_FP_MERGE_FAILURE</li>
     * </ul>
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SubFactor</i> argument is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer specified by the <i>UnitId</i>,  <i>Identity</i>, <i>SubFactor</i>, or <i>RejectDetail</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_BAD_CAPTURE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric sample could not be captured. Use the <i>RejectDetail</i> value for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the specified biometric unit is currently being used for an enrollment transaction (system pool only).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_NO_MATCH</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric sample does not correspond to the specified <i>Identity</i> and <i>SubFactor</i> combination.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioverify
     * @since windows6.1
     */
    static WinBioVerify(SessionHandle, Identity, SubFactor, UnitId, Match, RejectDetail) {
        result := DllCall("winbio.dll\WinBioVerify", "uint", SessionHandle, "ptr", Identity, "char", SubFactor, "uint*", UnitId, "char*", Match, "uint*", RejectDetail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously captures a biometric sample and determines whether the sample corresponds to the specified user identity.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID of the user providing the biometric sample.
     * @param {Integer} SubFactor A <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that specifies the sub-factor associated with the biometric sample. See the Remarks section for more details.
     * @param {Pointer<PWINBIO_VERIFY_CALLBACK>} VerifyCallback Address of a callback function that will be called by the <b>WinBioVerifyWithCallback</b> function when verification succeeds or fails. You must create the callback.
     * @param {Pointer<Void>} VerifyCallbackContext An optional application-defined structure that is returned in the <i>VerifyCallbackContext</i> parameter of the callback function. This structure can contain any data that the custom callback function is designed to handle.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SubFactor</i> argument is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer specified by the <i>Identity</i> and <i>VerifyCallback</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioverifywithcallback
     * @since windows6.1
     */
    static WinBioVerifyWithCallback(SessionHandle, Identity, SubFactor, VerifyCallback, VerifyCallbackContext) {
        result := DllCall("winbio.dll\WinBioVerifyWithCallback", "uint", SessionHandle, "ptr", Identity, "char", SubFactor, "ptr", VerifyCallback, "ptr", VerifyCallbackContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Captures a biometric sample and determines whether it matches an existing biometric template. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Pointer<UInt32>} UnitId A pointer to a <b>ULONG</b> value that specifies the biometric unit used to perform the identification.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that receives the GUID or SID of the user providing the biometric sample.
     * @param {Pointer<Byte>} SubFactor Pointer to a <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that receives the sub-factor associated with the biometric sample. See the Remarks section for more details.
     * @param {Pointer<UInt32>} RejectDetail A pointer to a <b>ULONG</b> value that contains additional information about the failure, if any, to capture a biometric sample. If the capture succeeded, this parameter is set to zero. The following values are defined for fingerprint capture:
     * 
     * <ul>
     * <li>WINBIO_FP_TOO_HIGH</li>
     * <li>WINBIO_FP_TOO_LOW</li>
     * <li>WINBIO_FP_TOO_LEFT</li>
     * <li>WINBIO_FP_TOO_RIGHT</li>
     * <li>WINBIO_FP_TOO_FAST</li>
     * <li>WINBIO_FP_TOO_SLOW</li>
     * <li>WINBIO_FP_POOR_QUALITY</li>
     * <li>WINBIO_FP_TOO_SKEWED</li>
     * <li>WINBIO_FP_TOO_SHORT</li>
     * <li>WINBIO_FP_MERGE_FAILURE</li>
     * </ul>
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer specified by the <i>UnitId</i>,  <i>Identity</i>, <i>SubFactor</i>, or <i>RejectDetail</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_BAD_CAPTURE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample could not be captured. Use the <i>RejectDetail</i> value for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the biometric unit is currently being used for an enrollment transaction (system pool only).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_UNKNOWN_ID</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric sample does not match any saved in the database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioidentify
     * @since windows6.1
     */
    static WinBioIdentify(SessionHandle, UnitId, Identity, SubFactor, RejectDetail) {
        result := DllCall("winbio.dll\WinBioIdentify", "uint", SessionHandle, "uint*", UnitId, "ptr", Identity, "char*", SubFactor, "uint*", RejectDetail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously captures a biometric sample and determines whether it matches an existing biometric template.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.
     * @param {Pointer<PWINBIO_IDENTIFY_CALLBACK>} IdentifyCallback Address of a callback function that will be called by the <b>WinBioIdentifyWithCallback</b> function when identification succeeds or fails. You must create the callback.
     * @param {Pointer<Void>} IdentifyCallbackContext Pointer to  an application-defined data structure that is passed to the callback function in its <i>IdentifyCallbackContext</i> parameter. This structure can contain any data that the custom callback function is designed to handle.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SessionHandle</i> and <i>IdentifyCallback</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioidentifywithcallback
     * @since windows6.1
     */
    static WinBioIdentifyWithCallback(SessionHandle, IdentifyCallback, IdentifyCallbackContext) {
        result := DllCall("winbio.dll\WinBioIdentifyWithCallback", "uint", SessionHandle, "ptr", IdentifyCallback, "ptr", IdentifyCallbackContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Blocks caller execution until all pending biometric operations for a session have been completed or canceled. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiowait
     * @since windows6.1
     */
    static WinBioWait(SessionHandle) {
        result := DllCall("winbio.dll\WinBioWait", "uint", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels all pending biometric operations for a specified session. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session. Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiocancel
     * @since windows6.1
     */
    static WinBioCancel(SessionHandle) {
        result := DllCall("winbio.dll\WinBioCancel", "uint", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the ID number of a biometric unit selected interactively by a user.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Pointer<UInt32>} UnitId A pointer to a <b>ULONG</b> value that specifies the biometric unit.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer specified by the <i>UnitId</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the biometric unit is currently being used for an enrollment transaction (system pool only).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiolocatesensor
     * @since windows6.1
     */
    static WinBioLocateSensor(SessionHandle, UnitId) {
        result := DllCall("winbio.dll\WinBioLocateSensor", "uint", SessionHandle, "uint*", UnitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously retrieves the ID number of the biometric unit selected interactively by a user.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.
     * @param {Pointer<PWINBIO_LOCATE_SENSOR_CALLBACK>} LocateCallback Address of a callback function that will be called by the <b>WinBioLocateSensorWithCallback</b> function when sensor location succeeds or fails. You must create the callback.
     * @param {Pointer<Void>} LocateCallbackContext Address of an application-defined data structure that is passed to the callback function in its <i>LocateCallbackContext</i> parameter. This structure can contain any data that the custom callback function is designed to handle.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address specified by the <i>LocateCallback</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiolocatesensorwithcallback
     * @since windows6.1
     */
    static WinBioLocateSensorWithCallback(SessionHandle, LocateCallback, LocateCallbackContext) {
        result := DllCall("winbio.dll\WinBioLocateSensorWithCallback", "uint", SessionHandle, "ptr", LocateCallback, "ptr", LocateCallbackContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initiates a biometric enrollment sequence and creates an empty biometric template. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} SubFactor 
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that identifies the biometric unit. This value cannot be zero. You can find a  unit ID by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenumbiometricunits">WinBioEnumBiometricUnits</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiolocatesensor">WinBioLocateSensor</a> functions.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to enroll.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SubFactor</i> parameter cannot equal WINBIO_SUBTYPE_NO_INFORMATION or WINBIO_SUBTYPE_ANY, and the <i>UnitId</i> parameter cannot equal zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An enrollment operation is already in progress, and only one enrollment can occur at a given time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_LOCK_VIOLATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit is in use and is locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenrollbegin
     * @since windows6.1
     */
    static WinBioEnrollBegin(SessionHandle, SubFactor, UnitId) {
        result := DllCall("winbio.dll\WinBioEnrollBegin", "uint", SessionHandle, "char", SubFactor, "uint", UnitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Specifies the individual that you want to enroll when data that represents multiple individuals is present in the sample buffer. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * 
     * For enrollment in facial recognition, use <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a> with the <i>PoolType</i> parameter set to <b>WINBIO_POOL_SYSTEM</b> to get the handle.
     * @param {Integer} SelectorValue A value that identifies that individual that you want to select for enrollment.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SelectorValue</i> parameter cannot equal zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_INCORRECT_SESSION_TYPE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle does not correspond to a biometric session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenrollselect
     * @since windows10.0.10240
     */
    static WinBioEnrollSelect(SessionHandle, SelectorValue) {
        result := DllCall("winbio.dll\WinBioEnrollSelect", "uint", SessionHandle, "uint", SelectorValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Captures a biometric sample and adds it to a template. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Pointer<UInt32>} RejectDetail A pointer to a <b>ULONG</b> value that contains additional information the failure to capture a biometric sample. If the capture succeeded, this parameter is set to zero. The following values are defined for fingerprint capture:
     * 
     * <ul>
     * <li>WINBIO_FP_TOO_HIGH</li>
     * <li>WINBIO_FP_TOO_LOW</li>
     * <li>WINBIO_FP_TOO_LEFT</li>
     * <li>WINBIO_FP_TOO_RIGHT</li>
     * <li>WINBIO_FP_TOO_FAST</li>
     * <li>WINBIO_FP_TOO_SLOW</li>
     * <li>WINBIO_FP_POOR_QUALITY</li>
     * <li>WINBIO_FP_TOO_SKEWED</li>
     * <li>WINBIO_FP_TOO_SHORT</li>
     * <li>WINBIO_FP_MERGE_FAILURE</li>
     * </ul>
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling account is not allowed to perform enrollment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer specified by the <i>RejectDetail</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_BAD_CAPTURE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample could not be captured. Use the <i>RejectDetail</i> value for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_LOCK_VIOLATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit is in use and is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_I_MORE_DATA</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The matching engine requires one or more additional samples to generate a reliable template. You should update instructions to the user to submit more samples and call <a href="/windows/desktop/api/winbio/nf-winbio-winbioenrollcapture">WinBioEnrollCapture</a> again.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenrollcapture
     * @since windows6.1
     */
    static WinBioEnrollCapture(SessionHandle, RejectDetail) {
        result := DllCall("winbio.dll\WinBioEnrollCapture", "uint", SessionHandle, "uint*", RejectDetail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously captures a biometric sample and adds it to a template.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.
     * @param {Pointer<PWINBIO_ENROLL_CAPTURE_CALLBACK>} EnrollCallback Address of a callback function that will be called by the <b>WinBioEnrollCaptureWithCallback</b> function when the capture operation succeeds or fails. You must create the callback.
     * @param {Pointer<Void>} EnrollCallbackContext Pointer to an optional application-defined structure that is passed to the <i>EnrollCallbackContext</i> parameter of the callback function. This structure can contain any data that the custom callback function is designed to handle.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling account is not allowed to perform enrollment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer specified by the <i>EnrollCallback</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenrollcapturewithcallback
     * @since windows6.1
     */
    static WinBioEnrollCaptureWithCallback(SessionHandle, EnrollCallback, EnrollCallbackContext) {
        result := DllCall("winbio.dll\WinBioEnrollCaptureWithCallback", "uint", SessionHandle, "ptr", EnrollCallback, "ptr", EnrollCallbackContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Finalizes a pending biometric template and saves it to the database associated with the biometric unit used for enrollment. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that receives the identifier (GUID or SID) of the template.
     * @param {Pointer<Byte>} IsNewTemplate Pointer to a Boolean value that specifies whether the template being added to the database is new.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointers specified by the <i>Identity</i> and <i>IsNewTemplate</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_DATABASE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no space available in the database for the template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_DUPLICATE_TEMPLATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The template matches one already saved in the database with a different identity or sub-factor (system pool only).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_LOCK_VIOLATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit is in use and is locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenrollcommit
     * @since windows6.1
     */
    static WinBioEnrollCommit(SessionHandle, Identity, IsNewTemplate) {
        result := DllCall("winbio.dll\WinBioEnrollCommit", "uint", SessionHandle, "ptr", Identity, "char*", IsNewTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Ends the enrollment sequence and discards a pending biometric template. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to enroll.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_LOCK_VIOLATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit is in use and is locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenrolldiscard
     * @since windows6.1
     */
    static WinBioEnrollDiscard(SessionHandle) {
        result := DllCall("winbio.dll\WinBioEnrollDiscard", "uint", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the biometric sub-factors enrolled for a specified identity and biometric unit. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that specifies the biometric unit.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID of the template from which the sub-factors are to be retrieved.
     * @param {Pointer<Byte>} SubFactorArray Address of a variable that receives a pointer to an array of sub-factors. If the function does not succeed, the pointer is set to <b>NULL</b>. If the function succeeds, you must pass the pointer to <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release memory allocated internally for the array.
     * @param {Pointer<UIntPtr>} SubFactorCount Pointer to a value that specifies the number of elements in the array pointed to by the <i>SubFactorArray</i> parameter. If the function does not succeed, this value is set to zero.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitId</i> parameter cannot be zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Identity</i>,  <i>SubFactorArray</i>, and  <i>SubFactorCount</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the biometric unit specified by the <i>UnitId</i> parameter is currently being used for an enrollment transaction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_UNKNOWN_ID</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GUID or SID specified by the <i>Identity</i> parameter cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioenumenrollments
     * @since windows6.1
     */
    static WinBioEnumEnrollments(SessionHandle, UnitId, Identity, SubFactorArray, SubFactorCount) {
        result := DllCall("winbio.dll\WinBioEnumEnrollments", "uint", SessionHandle, "uint", UnitId, "ptr", Identity, "ptr", SubFactorArray, "ptr*", SubFactorCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SessionHandle 
     * @param {Integer} UnitId 
     * @returns {HRESULT} 
     */
    static WinBioImproveBegin(SessionHandle, UnitId) {
        result := DllCall("winbio.dll\WinBioImproveBegin", "uint", SessionHandle, "uint", UnitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SessionHandle 
     * @returns {HRESULT} 
     */
    static WinBioImproveEnd(SessionHandle) {
        result := DllCall("winbio.dll\WinBioImproveEnd", "uint", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a callback function to receive event notifications from the service provider associated with an open session.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies the open biometric session. Open the session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>.
     * @param {Integer} EventMask A value that specifies the types of events to monitor. Only the fingerprint provider is currently supported. You must specify one of the following flags.
     * 
     * 
     * 
     * * **WINBIO_EVENT_FP_UNCLAIMED**
     * 
     * The sensor detected a finger swipe that was not requested by the application, or the requesting application does not have window focus. The Windows Biometric Framework calls into your callback function to indicate that a finger swipe has occurred but does not try to identify the fingerprint.
     * 
     * * **WINBIO_EVENT_FP_UNCLAIMED_IDENTIFY**
     * 
     * The sensor detected a finger swipe that was not requested by the application, or the requesting application does not have window focus. The Windows Biometric Framework attempts to identify the fingerprint and passes the result of that process to your callback function.
     * @param {Pointer<PWINBIO_EVENT_CALLBACK>} EventCallback Address of a callback function that receives the event notifications sent by the Windows Biometric Framework. You must define this function.
     * @param {Pointer<Void>} EventCallbackContext An optional application-defined value that is returned in the <i>pvContext</i> parameter of the callback function. This value can contain any data that the custom callback function is designed to handle.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address of the callback function specified by the <i>EventCallback</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>EventMask</i> parameter cannot be zero and you cannot specify both <b>WINBIO_EVENT_FP_UNCLAIMED</b> and <b>WINBIO_EVENT_FP_UNCLAIMED_IDENTIFY</b> at the same time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_EVENT_MONITOR_ACTIVE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An active event monitor has already been registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_INVALID_OPERATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service provider does not support event notification.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioregistereventmonitor
     * @since windows6.1
     */
    static WinBioRegisterEventMonitor(SessionHandle, EventMask, EventCallback, EventCallbackContext) {
        result := DllCall("winbio.dll\WinBioRegisterEventMonitor", "uint", SessionHandle, "uint", EventMask, "ptr", EventCallback, "ptr", EventCallbackContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels event notifications from the service provider associated with an open biometric session.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies the open biometric session. Open the session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiounregistereventmonitor
     * @since windows6.1
     */
    static WinBioUnregisterEventMonitor(SessionHandle) {
        result := DllCall("winbio.dll\WinBioUnregisterEventMonitor", "uint", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Turns on the face-recognition or iris-monitoring mechanism for the specified biometric unit. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle An asynchronous handle for the biometric session that you obtained by  calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a> function with the <i>PoolType</i> parameter set to <b>WINBIO_POOL_SYSTEM</b>.
     * @param {Integer} UnitId The identifier of the biometric unit for which you want to turn on the  face-recognition or iris-monitoring mechanism.
     * @returns {HRESULT} If the function parameters are acceptable, it returns <b>S_OK</b>. If the function parameters are not acceptable, it returns an <b>HRESULT</b> value that indicates the error.  
     * Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitId</i> parameter cannot equal zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_INCORRECT_SESSION_TYPE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle does not correspond to an asynchronous biometric session.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The actual success or failure of the operation itself is returned to the your notification function in a <a href="/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiomonitorpresence
     * @since windows10.0.10240
     */
    static WinBioMonitorPresence(SessionHandle, UnitId) {
        result := DllCall("winbio.dll\WinBioMonitorPresence", "uint", SessionHandle, "uint", UnitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Captures a biometric sample and fills a biometric information record (BIR) with the raw or processed data.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} Purpose 
     * @param {Integer} Flags A value that specifies the type of processing to be applied to the captured sample. This can be a bitwise <b>OR</b> of the following security and processing level flags:
     * 
     * * **WINBIO_DATA_FLAG_PRIVACY**
     * 
     * Encrypt the sample.
     *     
     * * **WINBIO_DATA_FLAG_INTEGRITY**
     * 
     * Sign the sample or protect it by using a message authentication code (MAC)
     *     
     * * **WINBIO_DATA_FLAG_SIGNED**
     *       
     * If this flag and the WINBIO_DATA_FLAG_INTEGRITY flag are set, sign the sample. If this flag is not set but the WINBIO_DATA_FLAG_INTEGRITY flag is set, compute a MAC.
     *    
     * * **WINBIO_DATA_FLAG_RAW**
     * 
     * Return the sample exactly as it was captured by the sensor.
     *    
     * * **WINBIO_DATA_FLAG_INTERMEDIATE**
     * 
     * Return the sample after it has been cleaned and filtered.
     *    
     * * **WINBIO_DATA_FLAG_PROCESSED**
     *    
     * Return the sample after it is ready to be used for the purpose specified by the Purpose parameter.
     * @param {Pointer<UInt32>} UnitId A pointer to a <b>WINBIO_UNIT_ID</b> value that contains the ID of  the biometric unit that generated the sample.
     * @param {Pointer<WINBIO_BIR>} Sample Address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure that contains the sample. When you have finished using the structure, you must pass the pointer to  <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release the memory allocated for the sample.
     * @param {Pointer<UIntPtr>} SampleSize A pointer to a <b>SIZE_T</b> value that contains the size, in bytes,  of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure returned in the <i>Sample</i> parameter.
     * @param {Pointer<UInt32>} RejectDetail A pointer to a <b>WINBIO_REJECT_DETAIL</b> value that contains additional information about the failure to capture a biometric sample. If the capture succeeded, this parameter is set to zero. The following values are defined for fingerprint capture:
     * 
     * <ul>
     * <li><b>WINBIO_FP_TOO_HIGH</b></li>
     * <li><b>WINBIO_FP_TOO_LOW</b></li>
     * <li><b>WINBIO_FP_TOO_LEFT</b></li>
     * <li><b>WINBIO_FP_TOO_RIGHT</b></li>
     * <li><b>WINBIO_FP_TOO_FAST</b></li>
     * <li><b>WINBIO_FP_TOO_SLOW</b></li>
     * <li><b>WINBIO_FP_POOR_QUALITY</b></li>
     * <li><b>WINBIO_FP_TOO_SKEWED</b></li>
     * <li><b>WINBIO_FP_TOO_SHORT</b></li>
     * <li><b>WINBIO_FP_MERGE_FAILURE</b></li>
     * </ul>
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to capture raw samples, or the session was not opened by using the <b>WINBIO_FLAG_RAW</b> flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit does not support the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitId</i>, <i>Sample</i>, <i>SampleSize</i>, and <i>RejectDetail</i> pointers cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the biometric unit is currently being used for an enrollment transaction (system pool only).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because a secure sensor is present in the sensor pool.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiocapturesample
     * @since windows6.1
     */
    static WinBioCaptureSample(SessionHandle, Purpose, Flags, UnitId, Sample, SampleSize, RejectDetail) {
        result := DllCall("winbio.dll\WinBioCaptureSample", "uint", SessionHandle, "char", Purpose, "char", Flags, "uint*", UnitId, "ptr", Sample, "ptr*", SampleSize, "uint*", RejectDetail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Captures a biometric sample asynchronously and returns the raw or processed data in a biometric information record (BIR).
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.
     * @param {Integer} Purpose 
     * @param {Integer} Flags A value that specifies the type of processing to be applied to the captured sample. This can be a bitwise <b>OR</b> of the following security and processing level flags:
     * 
     * * **WINBIO_DATA_FLAG_PRIVACY**
     * 
     * Encrypt the sample.
     * 
     * * **WINBIO_DATA_FLAG_INTEGRITY**
     * 
     * Sign the sample or protect it by using a message authentication code (MAC).
     * 
     * * **WINBIO_DATA_FLAG_SIGNED**
     * 
     * If this flag and the WINBIO_DATA_FLAG_INTEGRITYflag are set, sign the sample. If this flag is not set but the WINBIO_DATA_FLAG_INTEGRITY flag is set, compute a MAC.
     * 
     * * **WINBIO_DATA_FLAG_RAW**
     * 
     * Return the sample exactly as it was captured by the sensor.
     * 
     * * **WINBIO_DATA_FLAG_INTERMEDIATE**
     * 
     * Return the sample after it has been cleaned and filtered.
     * 
     * * **WINBIO_DATA_FLAG_PROCESSED**
     * 
     * Return the sample after it is ready to be used for the purpose specified by the <mark type="param">Purpose</mark> parameter.
     * @param {Pointer<PWINBIO_CAPTURE_CALLBACK>} CaptureCallback Address of a callback function that will be called by the <b>WinBioCaptureSampleWithCallback</b> function when the capture operation succeeds or fails. You must create the callback.
     * @param {Pointer<Void>} CaptureCallbackContext Address of an application-defined data structure that is passed to the callback function in its <i>CaptureCallbackContext</i> parameter. This structure can contain any data that the custom callback function is designed to handle.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to capture raw samples, or the session was not opened by using the <b>WINBIO_FLAG_RAW</b> flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit does not support the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitId</i>, <i>Sample</i>, <i>SampleSize</i>, and <i>RejectDetail</i> pointers cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the biometric unit is currently being used for an enrollment transaction (system pool only).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiocapturesamplewithcallback
     * @since windows6.1
     */
    static WinBioCaptureSampleWithCallback(SessionHandle, Purpose, Flags, CaptureCallback, CaptureCallbackContext) {
        result := DllCall("winbio.dll\WinBioCaptureSampleWithCallback", "uint", SessionHandle, "char", Purpose, "char", Flags, "ptr", CaptureCallback, "ptr", CaptureCallbackContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes a biometric template from the template store. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that identifies the biometric unit where the template is located.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID of the template to be deleted. If the <b>Type</b> member of the <b>WINBIO_IDENTITY</b> structure is <b>WINBIO_ID_TYPE_WILDCARD</b>, templates matching the <i>SubFactor</i> parameter will be deleted for all identities. Only administrators can perform wildcard identity deletion.
     * @param {Integer} SubFactor A <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that provides additional information about the template to be deleted. If you specify WINBIO_SUBTYPE_ANY, all templates for the biometric unit specified by the <i>UnitId</i> parameter are deleted.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitId</i> parameter contains zero or the <i>SubFactor</i> contains WINBIO_SUBTYPE_NO_INFORMATION.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer specified in the  <i>Identity</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the biometric unit is currently being used for an enrollment transaction.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiodeletetemplate
     * @since windows6.1
     */
    static WinBioDeleteTemplate(SessionHandle, UnitId, Identity, SubFactor) {
        result := DllCall("winbio.dll\WinBioDeleteTemplate", "uint", SessionHandle, "uint", UnitId, "ptr", Identity, "char", SubFactor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Locks a biometric unit for exclusive use by a single session. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that specifies the biometric unit to be locked.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitId</i> parameter cannot contain zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the specified biometric unit is currently being used for an enrollment transaction (system pool only).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_LOCK_VIOLATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit cannot be locked because the specified session already has another unit locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiolockunit
     * @since windows6.1
     */
    static WinBioLockUnit(SessionHandle, UnitId) {
        result := DllCall("winbio.dll\WinBioLockUnit", "uint", SessionHandle, "uint", UnitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the session lock on the specified biometric unit.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that specifies the biometric unit to unlock.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitId</i> parameter cannot contain zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_LOCK_VIOLATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit specified by the <i>UnitId</i> parameter is not currently locked by the session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiounlockunit
     * @since windows6.1
     */
    static WinBioUnlockUnit(SessionHandle, UnitId) {
        result := DllCall("winbio.dll\WinBioUnlockUnit", "uint", SessionHandle, "uint", UnitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows the caller to perform vendor-defined control operations on a biometric unit. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session. Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that identifies the biometric unit. This value must correspond to the unit ID used previously in  the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiolockunit">WinBioLockUnit</a> function.
     * @param {Integer} Component 
     * @param {Integer} ControlCode A vendor-defined code recognized by the biometric unit specified by the <i>UnitId</i> parameter and the adapter specified by the <i>Component</i> parameter.
     * @param {Pointer} SendBuffer Address of the buffer that contains the control information to be sent to the adapter specified by the <i>Component</i> parameter. The format and content of the buffer is vendor-defined.
     * @param {Pointer} SendBufferSize Size, in bytes, of the buffer specified by the <i>SendBuffer</i> parameter.
     * @param {Pointer} ReceiveBuffer Address of the buffer that receives information sent by the adapter specified by the <i>Component</i> parameter. The format and content of the buffer is vendor-defined.
     * @param {Pointer} ReceiveBufferSize Size, in bytes, of the buffer specified by the <i>ReceiveBuffer</i> parameter.
     * @param {Pointer<UIntPtr>} ReceiveDataSize Pointer to a <b>SIZE_T</b> value that contains the size, in bytes, of the data written to the buffer specified by the <i>ReceiveBuffer</i> parameter.
     * @param {Pointer<UInt32>} OperationStatus Pointer to an integer that contains a vendor-defined status code that specifies the outcome of the control operation.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>ControlCode</i> parameter is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SendBuffer</i>, <i>ReceiveBuffer</i>, <i>ReceiveDataSize</i>, <i>OperationStatus</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_INVALID_CONTROL_CODE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>ControlCode</i> parameter is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_LOCK_VIOLATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit specified by the <i>UnitId</i> parameter must be locked before any control operations can be performed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiocontrolunit
     * @since windows6.1
     */
    static WinBioControlUnit(SessionHandle, UnitId, Component, ControlCode, SendBuffer, SendBufferSize, ReceiveBuffer, ReceiveBufferSize, ReceiveDataSize, OperationStatus) {
        result := DllCall("winbio.dll\WinBioControlUnit", "uint", SessionHandle, "uint", UnitId, "uint", Component, "uint", ControlCode, "ptr", SendBuffer, "ptr", SendBufferSize, "ptr", ReceiveBuffer, "ptr", ReceiveBufferSize, "ptr*", ReceiveDataSize, "uint*", OperationStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows the caller to perform privileged vendor-defined control operations on a biometric unit. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session. Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that identifies the biometric unit. This value must correspond to the unit ID used previously in  the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiolockunit">WinBioLockUnit</a> function.
     * @param {Integer} Component 
     * @param {Integer} ControlCode A vendor-defined code recognized by the biometric unit specified by the <i>UnitId</i> parameter and the adapter specified by the <i>Component</i> parameter.
     * @param {Pointer} SendBuffer Address of the buffer that contains the control information to be sent to the adapter specified by the <i>Component</i> parameter. The format and content of the buffer is vendor-defined.
     * @param {Pointer} SendBufferSize Size, in bytes, of the buffer specified by the <i>SendBuffer</i> parameter.
     * @param {Pointer} ReceiveBuffer Address of the buffer that receives information sent by the adapter specified by the <i>Component</i> parameter. The format and content of the buffer is vendor-defined.
     * @param {Pointer} ReceiveBufferSize Size, in bytes, of the buffer specified by the <i>ReceiveBuffer</i> parameter.
     * @param {Pointer<UIntPtr>} ReceiveDataSize Pointer to a <b>SIZE_T</b> value that contains the size, in bytes, of the data written to the buffer specified by the <i>ReceiveBuffer</i> parameter.
     * @param {Pointer<UInt32>} OperationStatus Pointer to an integer that contains a vendor-defined status code that specifies the outcome of the control operation.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>ControlCode</i> parameter is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SendBuffer</i>, <i>ReceiveBuffer</i>, <i>ReceiveDataSize</i>, <i>OperationStatus</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to perform the operation, or the session was not opened by using <b>WINBIO_FLAG_MAINTENANCE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>ControlCode</i> parameter is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_LOCK_VIOLATION</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The biometric unit specified by the <i>UnitId</i> parameter must be locked before any control operations can be performed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiocontrolunitprivileged
     * @since windows6.1
     */
    static WinBioControlUnitPrivileged(SessionHandle, UnitId, Component, ControlCode, SendBuffer, SendBufferSize, ReceiveBuffer, ReceiveBufferSize, ReceiveDataSize, OperationStatus) {
        result := DllCall("winbio.dll\WinBioControlUnitPrivileged", "uint", SessionHandle, "uint", UnitId, "uint", Component, "uint", ControlCode, "ptr", SendBuffer, "ptr", SendBufferSize, "ptr", ReceiveBuffer, "ptr", ReceiveBufferSize, "ptr*", ReceiveDataSize, "uint*", OperationStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a session, unit, or template property. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} PropertyType A <b>WINBIO_PROPERTY_TYPE</b> value that specifies the source of the property information. Currently this must be <b>WINBIO_PROPERTY_TYPE_UNIT</b> or <b>WINBIO_PROPERTY_TYPE_ACCOUNT</b>. For more information about property types, see <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-property-type-constants">WINBIO_PROPERTY_TYPE Constants</a>.
     * 
     * The <b>WINBIO_PROPERTY_TYPE_ACCOUNT</b> value is supported starting in Windows 10.
     * @param {Integer} PropertyId A <b>WINBIO_PROPERTY_ID</b> value that specifies the property that you want to query. The following values are possible.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PROPERTY_SAMPLE_HINT"></a><a id="winbio_property_sample_hint"></a><dl>
     * <dt><b><b>WINBIO_PROPERTY_SAMPLE_HINT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Estimates the maximum number of good biometric samples that are required to complete an enrollment template. The result of the property query is returned in the buffer to which to the <i>PropertyBuffer</i> parameter points as a <b>ULONG</b> value that contains the hint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PROPERTY_EXTENDED_SENSOR_INFO_"></a><a id="winbio_property_extended_sensor_info_"></a><dl>
     * <dt><b><b>WINBIO_PROPERTY_EXTENDED_SENSOR_INFO </b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contains extended information about the capabilities and attributes of the sensor component that is connected to a specific biometric unit. The result of the property query is returned in the buffer to which to the <i>PropertyBuffer</i> parameter points as a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-extended-sensor-info">WINBIO_EXTENDED_SENSOR_INFO</a> structure.
     *  This value is supported starting in Windows 10.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PROPERTY_EXTENDED_ENGINE_INFO__"></a><a id="winbio_property_extended_engine_info__"></a><dl>
     * <dt><b><b>WINBIO_PROPERTY_EXTENDED_ENGINE_INFO  </b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contains extended information about the capabilities and attributes of the engine component that is connected to a specific biometric unit. The result of the property query is returned in the buffer to which to the <i>PropertyBuffer</i> parameter points as a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-extended-engine-info">WINBIO_EXTENDED_ENGINE_INFO</a> structure.
     * This value is supported starting in Windows 10.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PROPERTY_EXTENDED_STORAGE_INFO_"></a><a id="winbio_property_extended_storage_info_"></a><dl>
     * <dt><b><b>WINBIO_PROPERTY_EXTENDED_STORAGE_INFO </b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contains extended information about the capabilities and attributes of the storage component that is connected to a specific biometric unit. The result of the property query is returned in the buffer to which to the <i>PropertyBuffer</i> parameter points as a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-extended-storage-info">WINBIO_EXTENDED_STORAGE_INFO</a> structure.
     * This value is supported starting in Windows 10.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PROPERTY_EXTENDED_ENROLLMENT_STATUS_"></a><a id="winbio_property_extended_enrollment_status_"></a><dl>
     * <dt><b><b>WINBIO_PROPERTY_EXTENDED_ENROLLMENT_STATUS </b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contains extended information about the status of an enrollment that is in progress on a specific biometric unit. The result of the property query is returned in the buffer to which to the <i>PropertyBuffer</i> parameter points as a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-extended-enrollment-status">WINBIO_EXTENDED_ENROLLMENT_STATUS</a> structure. If no enrollment is in progress on the biometric unit, the <b>TemplateStatus</b> member of the returned structure has a value of <b>WINBIO_E_INVALID_OPERATION</b>.
     * This value is supported starting in Windows 10.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PROPERTY_ANTI_SPOOF_POLICY___"></a><a id="winbio_property_anti_spoof_policy___"></a><dl>
     * <dt><b><b>WINBIO_PROPERTY_ANTI_SPOOF_POLICY   </b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contains the values of the antispoofing policy for a specific user account. The property operation is returned in the buffer to which to the <i>PropertyBuffer</i> parameter points as a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-anti-spoof-policy">WINBIO_ANTI_SPOOF_POLICY</a> structure.
     * This value is supported starting in Windows 10.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information about these properties, see <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-property-constants">WINBIO_PROPERTY Constants</a>.
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that identifies the biometric unit. You can find a  unit identifier by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenumbiometricunits">WinBioEnumBiometricUnits</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiolocatesensor">WinBioLocateSensor</a> functions.
     * 
     * If you specify <b>WINBIO_PROPERTY_ANTI_SPOOF_POLICY</b> as the value for the <i>PropertyId</i> parameter, specify 0 for the <i>UnitId</i> parameter. If you specify any other property with the <i>PropertyId</i> parameter, you cannot specify 0 for the <i>UnitId</i> parameter.
     * @param {Pointer<WINBIO_IDENTITY>} Identity A <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that provides the SID of the account for which you want to get the antispoofing policy, if you specify <b>WINBIO_PROPERTY_ANTI_SPOOF_POLICY</b> as the value of the  <i>PropertyId</i> parameter.
     * 
     * If you specify any other value for the <i>PropertyId</i> parameter,  the <i>Identity</i> parameter  must be <b>NULL</b>.
     * @param {Integer} SubFactor Reserved. This must be <b>WINBIO_SUBTYPE_NO_INFORMATION</b>.
     * @param {Pointer<Void>} PropertyBuffer Address of a pointer to a buffer that receives the property value. For information about the contents of this buffer for different properties, see the descriptions of the property values for the <i>PropertyId</i> parameter.
     * @param {Pointer<UIntPtr>} PropertyBufferSize Pointer to a variable that receives the size, in bytes, of the buffer pointed to by the <i>PropertyBuffer</i> parameter.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle specified by the <i>SessionHandle</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Identity</i>, <i>PropertyBuffer</i>, or <i>PropertyBufferSize</i> arguments cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UnitId</i>, <i>Identity</i>, or <i>SubFactor</i> arguments are incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INVALID_PROPERTY_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>PropertyType</i> argument is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INVALID_PROPERTY_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>PropertyId</i> argument is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_LOCK_VIOLATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller attempted to query a property that resides inside of a locked region.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_UNSUPPORTED_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object being queried does not support the specified property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the specified biometric unit is currently being used for an enrollment transaction (system pool only).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiogetproperty
     * @since windows6.1
     */
    static WinBioGetProperty(SessionHandle, PropertyType, PropertyId, UnitId, Identity, SubFactor, PropertyBuffer, PropertyBufferSize) {
        result := DllCall("winbio.dll\WinBioGetProperty", "uint", SessionHandle, "uint", PropertyType, "uint", PropertyId, "uint", UnitId, "ptr", Identity, "char", SubFactor, "ptr", PropertyBuffer, "ptr*", PropertyBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the value of a standard property associated with a biometric session, unit, template, or account. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies an open biometric session.  Open a synchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>. Open an asynchronous session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @param {Integer} PropertyType A <b>WINBIO_PROPERTY_TYPE</b> value that specifies the type of the property that you want to set. Currently this must be <b>WINBIO_PROPERTY_TYPE_ACCOUNT</b>.
     * @param {Integer} PropertyId A <b>WINBIO_PROPERTY_ID</b> value that specifies the property to set. Currently this must be <b>WINBIO_PROPERTY_ANTI_SPOOF_POLICY</b>. All other properties are read-only.
     * @param {Integer} UnitId A <b>WINBIO_UNIT_ID</b> value that identifies the biometric unit. For the <b>WINBIO_PROPERTY_ANTI_SPOOF_POLICY</b> property, this value must be 0.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Address of a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that specifies the account for which you want to set the property.
     * @param {Integer} SubFactor Reserved. This must be <b>WINBIO_SUBTYPE_NO_INFORMATION</b>.
     * @param {Pointer} PropertyBuffer A pointer to a structure that specifies the new value for the property. This value cannot be NULL. For setting the <b>WINBIO_PROPERTY_ANTI_SPOOF_POLICY</b> property, the structure must be a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-anti-spoof-policy">WINBIO_ANTI_SPOOF_POLICY</a> structure.
     * @param {Pointer} PropertyBufferSize The size, in bytes, of the structure to which the <i>PropertyBuffer</i> parameter points. This value cannot be 0.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle specified by the <i>SessionHandle</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Identity</i> and <i>PropertyBuffer</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>PropertyType</i>, <i>PropertyId</i>, or <i>PropertyBufferSize</i> parameter cannot be 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INVALID_PROPERTY_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>PropertyType</i> argument is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INVALID_PROPERTY_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>PropertyId</i> argument is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_LOCK_VIOLATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller attempted to set a property that resides inside of a locked region.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_UNSUPPORTED_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support the specified property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_ENROLLMENT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed because the specified biometric unit is currently being used for an enrollment transaction (system pool only).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiosetproperty
     * @since windows10.0.10240
     */
    static WinBioSetProperty(SessionHandle, PropertyType, PropertyId, UnitId, Identity, SubFactor, PropertyBuffer, PropertyBufferSize) {
        result := DllCall("winbio.dll\WinBioSetProperty", "uint", SessionHandle, "uint", PropertyType, "uint", PropertyId, "uint", UnitId, "ptr", Identity, "char", SubFactor, "ptr", PropertyBuffer, "ptr", PropertyBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases memory allocated for the client application by an earlier call to a Windows Biometric Framework API function. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Pointer<Void>} Address Address of the memory block to delete.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Address</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiofree
     * @since windows6.1
     */
    static WinBioFree(Address) {
        result := DllCall("winbio.dll\WinBioFree", "ptr", Address, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Saves a biometric logon credential for the current user. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Integer} Type A <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-credential-type">WINBIO_CREDENTIAL_TYPE</a> value that specifies the credential type. Currently, this can be WINBIO_CREDENTIAL_PASSWORD.
     * @param {Pointer} Credential A pointer to a variable length array of bytes that contains the credential. The format depends on the <i>Type</i> and <i>Format</i> parameters.
     * @param {Pointer} CredentialSize Size, in bytes, of the value specified by the <i>Credential</i> parameter.
     * @param {Integer} Format A <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-credential-format">WINBIO_CREDENTIAL_FORMAT</a> enumeration value that specifies the format of the credential. If the <i>Type</i> parameter is <b>WINBIO_CREDENTIAL_PASSWORD</b>, this  can be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PASSWORD_GENERIC"></a><a id="winbio_password_generic"></a><dl>
     * <dt><b>WINBIO_PASSWORD_GENERIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential is a plaintext <b>NULL</b>-terminated Unicode string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PASSWORD_PACKED"></a><a id="winbio_password_packed"></a><dl>
     * <dt><b>WINBIO_PASSWORD_PACKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential was wrapped by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credprotecta">CredProtect</a>  function and packed by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credpackauthenticationbuffera">CredPackAuthenticationBuffer</a> function. This is recommended.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINBIO_PASSWORD_PROTECTED"></a><a id="winbio_password_protected"></a><dl>
     * <dt><b>WINBIO_PASSWORD_PROTECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The password credential was wrapped with <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credprotecta">CredProtect</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to set the credential.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_UNKNOWN_ID</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has not enrolled a biometric sample.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>SEC_E_LOGON_DENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential was not valid for the current user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_CRED_PROV_DISABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current administrative policy prohibits use of the credential provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiosetcredential
     * @since windows8.1
     */
    static WinBioSetCredential(Type, Credential, CredentialSize, Format) {
        result := DllCall("winbio.dll\WinBioSetCredential", "int", Type, "ptr", Credential, "ptr", CredentialSize, "int", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes a biometric logon credential for a specified user. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Pointer} Identity A  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the SID of the user account for which the logon credential will be removed.
     * @param {Integer} Type 
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to delete the credential.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_CRED_PROV_NO_CREDENTIAL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified identity does not exist or does not have any related records in the credential store.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioremovecredential
     * @since windows6.1
     */
    static WinBioRemoveCredential(Identity, Type) {
        result := DllCall("winbio.dll\WinBioRemoveCredential", "ptr", Identity, "int", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes all credentials from the store. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioremoveallcredentials
     * @since windows6.1
     */
    static WinBioRemoveAllCredentials() {
        result := DllCall("winbio.dll\WinBioRemoveAllCredentials", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes all user credentials for the current domain from the store. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioremovealldomaincredentials
     * @since windows6.1
     */
    static WinBioRemoveAllDomainCredentials() {
        result := DllCall("winbio.dll\WinBioRemoveAllDomainCredentials", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a value that specifies whether credentials have been set for the specified user. Starting with Windows 10, build 1607, this function is available to use with a mobile image.
     * @param {Pointer} Identity A  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the SID of the user account for which the credential is being queried.
     * @param {Integer} Type 
     * @param {Pointer<Int32>} CredentialState 
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to retrieve the  credential state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_UNKNOWN_ID</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified identity does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_CRED_PROV_DISABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current administrative policy prohibits use of the credential provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiogetcredentialstate
     * @since windows6.1
     */
    static WinBioGetCredentialState(Identity, Type, CredentialState) {
        result := DllCall("winbio.dll\WinBioGetCredentialState", "ptr", Identity, "int", Type, "int*", CredentialState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Causes a fast user switch to the account associated with the last successful identification operation performed by the biometric session.
     * @param {Integer} SessionHandle A <b>WINBIO_SESSION_HANDLE</b> value that identifies the biometric session that has recently performed a successful identification operation. Open the session handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioopensession">WinBioOpenSession</a>.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to switch users or the biometric session is out of date.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_HANDLE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user identified by the <i>SessionHandle</i> parameter is the same as the current user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_LOGON_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user could not be logged on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_CRED_PROV_DISABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current administrative policy prohibits use of the credential provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_FAST_USER_SWITCH_DISABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Fast user switching is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_SAS_ENABLED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Fast user switching cannot be performed because secure logon (CTRL+ALT+DELETE) is currently enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiologonidentifieduser
     * @since windows6.1
     */
    static WinBioLogonIdentifiedUser(SessionHandle) {
        result := DllCall("winbio.dll\WinBioLogonIdentifiedUser", "uint", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets information about the biometric enrollments that the specified user has on the computer.
     * @param {Pointer<WINBIO_IDENTITY>} AccountOwner A <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure for the user whose biometric enrollments you want to get. For example:
     * 
     * <pre class="syntax" xml:space="preserve"><code>WINBIO_IDENTITY identity = {};
     * identity.Type = WINBIO_ID_TYPE_SID;
     * 
     * // Move an account SID into identity.Value.AccountSid.Data.
     * // For example, CopySid(...)</code></pre>
     * To see the enrollments for every user on the computer, specify the  <b>WINBIO_ID_TYPE_WILDCARD</b> identity type for the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that you specify for the <i>AccountOwner</i> parameter. For example:
     * 
     * <pre class="syntax" xml:space="preserve"><code>WINBIO_IDENTITY identity = {};
     * identity.Type = WINBIO_ID_TYPE_WILDCARD;
     * </code></pre>
     * @param {Pointer<UInt32>} EnrolledFactors A set of <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-biometric-type-constants">WINBIO_BIOMETRIC_TYPE</a> flags that indicate the biometric enrollments that the specified user has on the computer. A value of 0 indicates that the user has no biometric enrollments.
     * 
     * These enrollments represent system pool enrollments only, such as enrollments that you can use to authenticate a user for sign-in, unlock, and so on.          This value does not include private pool enrollments.
     * 
     * If you specify the wildcard identity type for the  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that you use for the <i>AccountOwner</i> parameter, this set of flags represents the combined set of enrollments for all users with accounts on the computer.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AccountOwner</i> and <i>EnrolledFactors</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Type</b> member of the <a href="/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that the  <i>AccountOnwer</i> parameter specified was not <b>WINBIO_ID_TYPE_SID</b> or <b>WINBIO_ID_TYPE_WILDCARD</b>, or the <b>AccountSid</b> member of the <b>WINBIO_IDENTITY</b> structure was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiogetenrolledfactors
     * @since windows10.0.10240
     */
    static WinBioGetEnrolledFactors(AccountOwner, EnrolledFactors) {
        result := DllCall("winbio.dll\WinBioGetEnrolledFactors", "ptr", AccountOwner, "uint*", EnrolledFactors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a value that specifies whether the Windows Biometric Framework is currently enabled.
     * @param {Pointer<Byte>} Value Pointer to a Boolean value that specifies whether the Windows Biometric Framework is currently enabled.
     * @param {Pointer<UInt32>} Source 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiogetenabledsetting
     * @since windows6.1
     */
    static WinBioGetEnabledSetting(Value, Source) {
        DllCall("winbio.dll\WinBioGetEnabledSetting", "char*", Value, "uint*", Source)
    }

    /**
     * Retrieves a value that indicates whether users can log on by using biometric information.
     * @param {Pointer<Byte>} Value Pointer to a Boolean value that specifies whether biometric logons are enabled.
     * @param {Pointer<UInt32>} Source 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiogetlogonsetting
     * @since windows6.1
     */
    static WinBioGetLogonSetting(Value, Source) {
        DllCall("winbio.dll\WinBioGetLogonSetting", "char*", Value, "uint*", Source)
    }

    /**
     * Retrieves a value that specifies whether users can log on to a domain by using biometric information.
     * @param {Pointer<Byte>} Value Pointer to a Boolean value that specifies whether biometric domain logons are enabled.
     * @param {Pointer<UInt32>} Source 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbiogetdomainlogonsetting
     * @since windows6.1
     */
    static WinBioGetDomainLogonSetting(Value, Source) {
        DllCall("winbio.dll\WinBioGetDomainLogonSetting", "char*", Value, "uint*", Source)
    }

    /**
     * 
     * @param {Pointer<Byte>} Value 
     * @returns {HRESULT} 
     */
    static WinBioIsESSCapable(Value) {
        result := DllCall("winbio.dll\WinBioIsESSCapable", "char*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Acquires window focus.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process must be running under the Local System account.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioacquirefocus
     * @since windows6.1
     */
    static WinBioAcquireFocus() {
        result := DllCall("winbio.dll\WinBioAcquireFocus", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases window focus.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process must be running under the Local System account.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbio/nf-winbio-winbioreleasefocus
     * @since windows6.1
     */
    static WinBioReleaseFocus() {
        result := DllCall("winbio.dll\WinBioReleaseFocus", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
