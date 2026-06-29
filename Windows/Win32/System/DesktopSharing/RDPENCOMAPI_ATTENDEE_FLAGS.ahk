#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the type of attendee.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpencomapi_attendee_flags
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct RDPENCOMAPI_ATTENDEE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the attendee is a local attendee.
     * @type {Integer (Int32)}
     */
    static ATTENDEE_FLAGS_LOCAL => 1
}
