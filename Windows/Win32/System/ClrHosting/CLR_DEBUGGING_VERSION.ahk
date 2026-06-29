#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct CLR_DEBUGGING_VERSION {
    #StructPack 2

    wStructVersion : UInt16

    wMajor : UInt16

    wMinor : UInt16

    wBuild : UInt16

    wRevision : UInt16

}
