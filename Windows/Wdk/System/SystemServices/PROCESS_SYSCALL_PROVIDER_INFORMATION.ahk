#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_SYSCALL_PROVIDER_INFORMATION {
    #StructPack 4

    ProviderId : Guid

    Level : Int8

}
