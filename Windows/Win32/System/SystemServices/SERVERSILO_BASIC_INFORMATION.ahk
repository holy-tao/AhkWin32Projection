#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SERVERSILO_STATE.ahk" { SERVERSILO_STATE }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SERVERSILO_BASIC_INFORMATION {
    #StructPack 8

    ServiceSessionId : UInt32

    State : SERVERSILO_STATE

    ExitStatus : UInt32

    Reserved : BOOLEAN

    ApiSetSchema : IntPtr

    HostApiSetSchema : IntPtr

    ContainerBuildNumber : UInt32

    HostBuildNumber : UInt32

}
