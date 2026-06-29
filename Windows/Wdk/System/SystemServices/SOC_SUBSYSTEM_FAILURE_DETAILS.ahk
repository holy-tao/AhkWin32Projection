#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOC_SUBSYSTEM_TYPE.ahk" { SOC_SUBSYSTEM_TYPE }
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SOC_SUBSYSTEM_FAILURE_DETAILS {
    #StructPack 8

    SubsysType : SOC_SUBSYSTEM_TYPE

    FirmwareVersion : Int64

    HardwareVersion : Int64

    UnifiedFailureRegionSize : UInt32

    UnifiedFailureRegion : CHAR[1]

}
