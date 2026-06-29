#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags affecting the behavior of the ModifyVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-modify_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct MODIFY_VHDSET_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No flag specified.
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_FLAG_WRITEABLE_SNAPSHOT => 1
}
