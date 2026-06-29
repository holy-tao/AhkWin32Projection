#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_REGION.ahk" { SCM_REGION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_REGIONS {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    RegionCount : UInt32

    Regions : SCM_REGION[1]

}
