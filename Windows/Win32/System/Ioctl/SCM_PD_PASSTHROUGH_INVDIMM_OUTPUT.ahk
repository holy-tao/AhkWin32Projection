#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_PASSTHROUGH_INVDIMM_OUTPUT {
    #StructPack 4

    GeneralStatus : UInt16

    ExtendedStatus : UInt16

    OutputDataLength : UInt32

    OutputData : Int8[1]

}
