#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCRUB_PARITY_EXTENT.ahk" { SCRUB_PARITY_EXTENT }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SCRUB_PARITY_EXTENT_DATA {
    #StructPack 8

    Size : UInt16

    Flags : UInt16

    NumberOfParityExtents : UInt16

    MaximumNumberOfParityExtents : UInt16

    ParityExtents : SCRUB_PARITY_EXTENT[1]

}
