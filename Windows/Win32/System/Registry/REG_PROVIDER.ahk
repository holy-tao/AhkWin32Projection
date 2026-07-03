#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PQUERYHANDLER.ahk" { PQUERYHANDLER }

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct REG_PROVIDER {
    #StructPack 8

    pi_R0_1val : PQUERYHANDLER

    pi_R0_allvals : PQUERYHANDLER

    pi_R3_1val : PQUERYHANDLER

    pi_R3_allvals : PQUERYHANDLER

    pi_flags : UInt32

    pi_key_context : IntPtr

}
