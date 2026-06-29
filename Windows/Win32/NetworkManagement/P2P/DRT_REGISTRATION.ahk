#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRT_DATA.ahk" { DRT_DATA }

/**
 * The DRT_REGISTRATION structure contains key and application data that make up a registration.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_registration
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_REGISTRATION {
    #StructPack 8

    /**
     * Contains the key portion of the registration.
     */
    key : DRT_DATA

    /**
     * The application data associated with the key. The <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_data">DRT_DATA</a> structure containing this application data must point to a buffer less than 4KB in size.
     */
    appData : DRT_DATA

}
