#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCARD_IO_REQUEST.ahk" { SCARD_IO_REQUEST }
#Import ".\SCARD_T0_COMMAND.ahk" { SCARD_T0_COMMAND }

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SCARD_T0_REQUEST {
    #StructPack 4

    ioRequest : SCARD_IO_REQUEST

    bSw1 : Int8

    bSw2 : Int8

    CmdBytes : SCARD_T0_COMMAND

    static __New() {
        DefineProp(this.Prototype, 'rgbHeader', { type: Int8[5], offset: 10 })
        this.DeleteProp("__New")
    }
}
