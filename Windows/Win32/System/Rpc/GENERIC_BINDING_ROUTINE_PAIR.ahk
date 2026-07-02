#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GENERIC_UNBIND_ROUTINE.ahk" { GENERIC_UNBIND_ROUTINE }
#Import ".\GENERIC_BINDING_ROUTINE.ahk" { GENERIC_BINDING_ROUTINE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct GENERIC_BINDING_ROUTINE_PAIR {
    #StructPack 8

    pfnBind : GENERIC_BINDING_ROUTINE

    pfnUnbind : GENERIC_UNBIND_ROUTINE

}
