#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BANNER_NOTIFICATION_EVENT.ahk" { BANNER_NOTIFICATION_EVENT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct BANNER_NOTIFICATION {
    #StructPack 8

    event : BANNER_NOTIFICATION_EVENT

    providerIdentity : PWSTR

    contentId : PWSTR

}
