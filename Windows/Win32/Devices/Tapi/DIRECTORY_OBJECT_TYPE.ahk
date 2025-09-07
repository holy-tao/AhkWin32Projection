#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DIRECTORY_OBJECT_TYPE enum is a descriptor of whether a directory object is a conference or a user.
 * @see https://learn.microsoft.com/windows/win32/api/rend/ne-rend-directory_object_type
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class DIRECTORY_OBJECT_TYPE{

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
