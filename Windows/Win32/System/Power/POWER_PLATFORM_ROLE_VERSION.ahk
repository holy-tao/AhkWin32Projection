#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The version of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-power_platform_role">POWER_PLATFORM_ROLE</a> enumeration for the current build target.
 * @see https://learn.microsoft.com/windows/win32/api/powerbase/nf-powerbase-powerdetermineplatformroleex
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_PLATFORM_ROLE_VERSION {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_PLATFORM_ROLE_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_PLATFORM_ROLE_V2 => 2
}
