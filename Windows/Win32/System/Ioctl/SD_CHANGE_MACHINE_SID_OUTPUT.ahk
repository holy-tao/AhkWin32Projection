#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SD_CHANGE_MACHINE_SID_OUTPUT {
    #StructPack 8

    NumSDChangedSuccess : Int64

    NumSDChangedFail : Int64

    NumSDUnused : Int64

    NumSDTotal : Int64

    NumMftSDChangedSuccess : Int64

    NumMftSDChangedFail : Int64

    NumMftSDTotal : Int64

}
