#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_ESS_STATE_FLAGS extends Win32Enum {

    /**
     * Native name: WINBIO_ESS_REQUIRES_TPM2
     * @type {Integer (Int32)}
     */
    static REQUIRES_TPM2 => 1

    /**
     * Native name: WINBIO_ESS_REQUIRES_VBS_CAPABLE
     * @type {Integer (Int32)}
     */
    static REQUIRES_VBS_CAPABLE => 2

    /**
     * Native name: WINBIO_ESS_REQUIRES_NON_VBS_WINDOWS_HELLO_ABSENCE
     * @type {Integer (Int32)}
     */
    static REQUIRES_NON_VBS_WINDOWS_HELLO_ABSENCE => 4

    /**
     * Native name: WINBIO_ESS_REQUIRES_VBS_WINDOWS_HELLO
     * @type {Integer (Int32)}
     */
    static REQUIRES_VBS_WINDOWS_HELLO => 8

    /**
     * Native name: WINBIO_ESS_REQUIRES_VBS_RUNNING
     * @type {Integer (Int32)}
     */
    static REQUIRES_VBS_RUNNING => 16

    /**
     * Native name: WINBIO_ESS_REQUIRES_VBS_ENCRYPTION_KEY
     * @type {Integer (Int32)}
     */
    static REQUIRES_VBS_ENCRYPTION_KEY => 32

    /**
     * Native name: WINBIO_ESS_REQUIRES_ENABLEMENT
     * @type {Integer (Int32)}
     */
    static REQUIRES_ENABLEMENT => 64

    /**
     * Native name: WINBIO_ESS_MANAGED_BY_POLICY
     * @type {Integer (Int32)}
     */
    static MANAGED_BY_POLICY => 128

    /**
     * Native name: WINBIO_ESS_REQUIRES_NON_VBS_BIOMETRIC_ENROLLMENT_ABSENCE
     * @type {Integer (Int32)}
     */
    static REQUIRES_NON_VBS_BIOMETRIC_ENROLLMENT_ABSENCE => 256

    /**
     * Native name: WINBIO_ESS_REQUIRES_VBS_BIOMETRIC_ENROLLMENT
     * @type {Integer (Int32)}
     */
    static REQUIRES_VBS_BIOMETRIC_ENROLLMENT => 512

    /**
     * Native name: WINBIO_ESS_REQUIRES_FACE_SENSOR
     * @type {Integer (Int32)}
     */
    static REQUIRES_FACE_SENSOR => 1024

    /**
     * Native name: WINBIO_ESS_REQUIRES_FPR_SENSOR
     * @type {Integer (Int32)}
     */
    static REQUIRES_FPR_SENSOR => 2048

    /**
     * Native name: WINBIO_ESS_REQUIRES_ISOLATED_PROCESS
     * @type {Integer (Int32)}
     */
    static REQUIRES_ISOLATED_PROCESS => 4096

    /**
     * Native name: WINBIO_ESS_BLOCKED_NON_ESS_FPR
     * @type {Integer (Int32)}
     */
    static BLOCKED_NON_ESS_FPR => 8192

    /**
     * Native name: WINBIO_ESS_BLOCKED_NON_ESS_CAMERA
     * @type {Integer (Int32)}
     */
    static BLOCKED_NON_ESS_CAMERA => 16384

    /**
     * Native name: WINBIO_ESS_SOURCE_DEFAULT
     * @type {Integer (Int32)}
     */
    static SOURCE_DEFAULT => 32768
}
