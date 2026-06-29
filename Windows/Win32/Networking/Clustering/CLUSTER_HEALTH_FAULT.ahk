#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_HEALTH_FAULT {
    #StructPack 8

    Id : PWSTR

    ErrorType : UInt32

    ErrorCode : UInt32

    Description : PWSTR

    Provider : PWSTR

    Flags : UInt32

    Reserved : UInt32

}
