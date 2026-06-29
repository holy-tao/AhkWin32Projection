#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_JOB_TYPE_ENUM enumeration defines the fax job type.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_job_type_enum
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_JOB_TYPE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The job is an outbound job.
     * @type {Integer (Int32)}
     */
    static fjtSEND => 0

    /**
     * The job is an incoming job (being received through a modem).
     * @type {Integer (Int32)}
     */
    static fjtRECEIVE => 1

    /**
     * The incoming job has been received, and is now in routing mode (modem is not used).
     * @type {Integer (Int32)}
     */
    static fjtROUTING => 2
}
