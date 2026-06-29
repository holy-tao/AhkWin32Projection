#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct RECYCLE_INFO {
    #StructPack 8

    guidCombaseProcessIdentifier : Guid

    ProcessStartTime : Int64

    dwRecycleLifetimeLimit : UInt32

    dwRecycleMemoryLimit : UInt32

    dwRecycleExpirationTimeout : UInt32

}
