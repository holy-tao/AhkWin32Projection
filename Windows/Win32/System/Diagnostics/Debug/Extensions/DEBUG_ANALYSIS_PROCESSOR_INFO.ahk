#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_ANALYSIS_PROCESSOR_INFO {
    #StructPack 4

    SizeOfStruct : UInt32

    Model : UInt32

    Family : UInt32

    Stepping : UInt32

    Architecture : UInt32

    Revision : UInt32

    CurrentClockSpeed : UInt32

    CurrentVoltage : UInt32

    MaxClockSpeed : UInt32

    ProcessorType : UInt32

    DeviceID : CHAR[32]

    Manufacturer : CHAR[64]

    Name : CHAR[64]

    Version : CHAR[64]

    Description : CHAR[64]

}
