#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SD_CHANGE_MACHINE_SID_INPUT {
    #StructPack 2

    CurrentMachineSIDOffset : UInt16

    CurrentMachineSIDLength : UInt16

    NewMachineSIDOffset : UInt16

    NewMachineSIDLength : UInt16

}
