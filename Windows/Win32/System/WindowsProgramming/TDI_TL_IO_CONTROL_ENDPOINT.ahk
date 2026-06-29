#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TDI_TL_IO_CONTROL_TYPE.ahk" { TDI_TL_IO_CONTROL_TYPE }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct TDI_TL_IO_CONTROL_ENDPOINT {
    #StructPack 8

    Type : TDI_TL_IO_CONTROL_TYPE

    Level : UInt32

    IoControlCode : UInt32

    InputBuffer : IntPtr

    InputBufferLength : UInt32

    OutputBuffer : IntPtr

    OutputBufferLength : UInt32

    static __New() {
        DefineProp(this.Prototype, 'OptionName', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
