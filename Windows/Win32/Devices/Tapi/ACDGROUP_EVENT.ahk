#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ACDGROUP_EVENT enumeration (tapi3cc.h) describes ACD group events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/ne-tapi3cc-acdgroup_event
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ACDGROUP_EVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A new ACD group has been added.
     * @type {Integer (Int32)}
     */
    static ACDGE_NEW_GROUP => 0

    /**
     * An ACD group has been removed.
     * @type {Integer (Int32)}
     */
    static ACDGE_GROUP_REMOVED => 1
}
