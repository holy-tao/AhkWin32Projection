#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags to validate the data of a placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_validate_data_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_VALIDATE_DATA_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No data validation flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_VALIDATE_DATA_FLAG_NONE => 0

    /**
     * >[!NOTE]
     * >This value is new for Windows 10, version 1803.
     * 
     * Set if the callback is invoked as a result of a call to [CfHydratePlaceholder](nf-cfapi-cfhydrateplaceholder.md).
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_VALIDATE_DATA_FLAG_EXPLICIT_HYDRATION => 2
}
