#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct SCF_NAVIGATION_EVENT {
    #StructPack 4

    PreviousPage : UInt32

    TargetPage : UInt32

    Button : UInt32

}
