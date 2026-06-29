#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_RUNTIME_FW_ACTIVATION_ARM_STATE {
    #StructPack 1

    ArmState : BOOLEAN

}
