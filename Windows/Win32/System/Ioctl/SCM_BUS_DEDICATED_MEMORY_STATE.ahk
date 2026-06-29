#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_BUS_DEDICATED_MEMORY_STATE {
    #StructPack 1

    ActivateState : BOOLEAN

}
