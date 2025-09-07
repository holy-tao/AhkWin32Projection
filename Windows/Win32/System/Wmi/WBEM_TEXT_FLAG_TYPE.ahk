#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags to control the execution of the IWbemClassObject::GetObjectText method.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_text_flag_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_TEXT_FLAG_TYPE{

    /**
     * Present qualifiers without propagation or flavor information.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_NO_FLAVORS => 1
}
