#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags affecting the behavior of the ModifyVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-modify_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MODIFY_VHDSET_FLAG{

    /**
     * No flag specified.
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_FLAG_NONE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_FLAG_WRITEABLE_SNAPSHOT => 1
}
