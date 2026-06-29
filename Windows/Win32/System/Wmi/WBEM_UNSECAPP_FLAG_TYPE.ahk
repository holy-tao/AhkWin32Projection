#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to control access checks on callbacks when using the IWbemUnsecuredApartment::CreateSinkStub method.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_unsecapp_flag_type
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_UNSECAPP_FLAG_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Unsecapp.exe reads the registry key UnsecAppAccessControlDefault to determine if it should authenticate callbacks.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_UNSECAPP_DEFAULT_CHECK_ACCESS => 0

    /**
     * Unsecapp.exe authenticates callbacks regardless of the setting of the registry key UnsecAppAccessControlDefault.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_UNSECAPP_CHECK_ACCESS => 1

    /**
     * Unsecapp.exe does not authenticate callbacks regardless of the setting of the registry key UnsecAppAccessControlDefault.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_UNSECAPP_DONT_CHECK_ACCESS => 2
}
