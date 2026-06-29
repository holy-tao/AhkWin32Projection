#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an operating system platform and processor architecture.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-csplatform
 * @namespace Windows.Win32.System.Com
 */
export default struct CSPLATFORM {
    #StructPack 4

    /**
     * The operating system platform. See the <b>dwPlatformId</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoa">OSVERSIONINFO</a>.
     */
    dwPlatformId : UInt32

    /**
     * The major version of the operating system.
     */
    dwVersionHi : UInt32

    /**
     * The minor version of the operating system.
     */
    dwVersionLo : UInt32

    /**
     * The processor architecture.
     * See the <b>wProcessorArchitecture</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-system_info">SYSTEM_INFO</a>.
     */
    dwProcessorArch : UInt32

}
