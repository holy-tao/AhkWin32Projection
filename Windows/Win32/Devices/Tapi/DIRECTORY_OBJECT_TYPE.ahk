#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DIRECTORY_OBJECT_TYPE enum is a descriptor of whether a directory object is a conference or a user.
 * @see https://docs.microsoft.com/windows/win32/api//rend/ne-rend-directory_object_type
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class DIRECTORY_OBJECT_TYPE extends Win32Enum{

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
