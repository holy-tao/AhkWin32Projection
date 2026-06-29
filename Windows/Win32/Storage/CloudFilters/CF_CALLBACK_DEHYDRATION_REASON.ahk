#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the reason why a cloud file was dehydrated.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_dehydration_reason
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_DEHYDRATION_REASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The cloud file has never been dehydrated after its creation.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATION_REASON_NONE => 0

    /**
     * User explicitly dehydrated the cloud file.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATION_REASON_USER_MANUAL => 1

    /**
     * The platform dehydrated the cloud file when experiencing low disk space on the volume where this file resides.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_LOW_SPACE => 2

    /**
     * The platform aged out the cloud file based on user defined policies.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_INACTIVITY => 3

    /**
     * The platform dehydrated this file when reclaiming disk space in order to upgrade the OS.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_OS_UPGRADE => 4
}
