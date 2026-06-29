#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct ENG_EVENT {
    #StructPack 8

    pKEvent : IntPtr

    fFlags : UInt32

}
