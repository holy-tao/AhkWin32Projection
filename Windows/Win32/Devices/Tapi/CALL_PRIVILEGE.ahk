#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A CALL_PRIVILEGE member is returned by the ITCallInfo::get_Privilege method, and indicates when the current application owns or is monitoring the current call.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-call_privilege
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct CALL_PRIVILEGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The application is the owner of the call.
     * @type {Integer (Int32)}
     */
    static CP_OWNER => 0

    /**
     * The application is a monitor of the call.
     * @type {Integer (Int32)}
     */
    static CP_MONITOR => 1
}
