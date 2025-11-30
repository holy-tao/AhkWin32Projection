#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class EXPERIMENTAL_WINBIO_ESS_STATE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_TPM2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_VBS_CAPABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_NON_VBS_WINDOWS_HELLO_ABSENCE => 4

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_VBS_WINDOWS_HELLO => 8

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_VBS_RUNNING => 16

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_VBS_ENCRYPTION_KEY => 32

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_ENABLEMENT => 64

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_MANAGED_BY_POLICY => 128

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_NON_VBS_BIOMETRIC_ENROLLMENT_ABSENCE => 256

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_VBS_BIOMETRIC_ENROLLMENT => 512

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_FACE_SENSOR => 1024

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_FPR_SENSOR => 2048

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_REQUIRES_ISOLATED_PROCESS => 4096

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_BLOCKED_NON_ESS_FPR => 8192

    /**
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL_WINBIO_ESS_BLOCKED_NON_ESS_CAMERA => 16384
}
