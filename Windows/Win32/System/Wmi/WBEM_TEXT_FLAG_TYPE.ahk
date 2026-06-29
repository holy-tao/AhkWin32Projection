#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags to control the execution of the IWbemClassObject::GetObjectText method.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_text_flag_type
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_TEXT_FLAG_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Present qualifiers without propagation or flavor information.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_NO_FLAVORS => 1
}
