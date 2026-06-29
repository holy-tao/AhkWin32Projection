#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\M128A.ahk" { M128A }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64, Arm64
 */
export default struct XSAVE_FORMAT {
    #StructPack 8

    ControlWord : UInt16

    StatusWord : UInt16

    TagWord : Int8

    Reserved1 : Int8

    ErrorOpcode : UInt16

    ErrorOffset : UInt32

    ErrorSelector : UInt16

    Reserved2 : UInt16

    DataOffset : UInt32

    DataSelector : UInt16

    Reserved3 : UInt16

    MxCsr : UInt32

    MxCsr_Mask : UInt32

    FloatRegisters : M128A[8]

    XmmRegisters : M128A[16]

    Reserved4 : Int8[96]

}
