#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_INTERLEAVED_PD_INFO.ahk" { SCM_INTERLEAVED_PD_INFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_LD_INTERLEAVE_SET_INFO {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    InterleaveSetSize : UInt32

    InterleaveSet : SCM_INTERLEAVED_PD_INFO[1]

}
