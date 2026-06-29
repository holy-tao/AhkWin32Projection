#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PFA_MEMORY_POLICY {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    RegistryKeysPresent : UInt32

    DisableOffline : BOOLEAN

    PersistOffline : BOOLEAN

    PfaDisabled : BOOLEAN

    PageCount : UInt32

    ErrorThreshold : UInt32

    TimeOut : UInt32

}
