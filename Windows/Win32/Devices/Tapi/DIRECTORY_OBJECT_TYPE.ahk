#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIRECTORY_OBJECT_TYPE enum is a descriptor of whether a directory object is a conference or a user.
 * @see https://learn.microsoft.com/windows/win32/api/rend/ne-rend-directory_object_type
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct DIRECTORY_OBJECT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Conference.
     * @type {Integer (Int32)}
     */
    static OT_CONFERENCE => 1

    /**
     * User.
     * @type {Integer (Int32)}
     */
    static OT_USER => 2
}
