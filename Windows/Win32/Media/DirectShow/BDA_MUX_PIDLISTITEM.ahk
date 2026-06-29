#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MUX_PID_TYPE.ahk" { MUX_PID_TYPE }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_MUX_PIDLISTITEM {
    #StructPack 4

    usPIDNumber : UInt16

    usProgramNumber : UInt16

    ePIDType : MUX_PID_TYPE

}
