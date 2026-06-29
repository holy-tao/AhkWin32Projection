#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags that apply to type libraries.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-libflags
 * @namespace Windows.Win32.System.Ole
 */
export default struct LIBFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The type library is restricted, and should not be displayed to users.
     * @type {Integer (Int32)}
     */
    static LIBFLAG_FRESTRICTED => 1

    /**
     * The type library describes controls, and should not be displayed in type browsers intended for nonvisual objects.
     * @type {Integer (Int32)}
     */
    static LIBFLAG_FCONTROL => 2

    /**
     * The type library should not be displayed to users, although its use is not restricted. Should be used by controls. Hosts should create a new type library that wraps the control with extended properties.
     * @type {Integer (Int32)}
     */
    static LIBFLAG_FHIDDEN => 4

    /**
     * The type library has a disk image.
     * @type {Integer (Int32)}
     */
    static LIBFLAG_FHASDISKIMAGE => 8
}
