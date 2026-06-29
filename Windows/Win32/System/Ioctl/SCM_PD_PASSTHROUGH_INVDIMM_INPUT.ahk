#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_PASSTHROUGH_INVDIMM_INPUT {
    #StructPack 4

    Opcode : UInt32

    OpcodeParametersLength : UInt32

    OpcodeParameters : Int8[1]

}
