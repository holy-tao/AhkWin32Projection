#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the 80387 save area on WOW64.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-wow64_floating_save_area
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WOW64_FLOATING_SAVE_AREA {
    #StructPack 4

    ControlWord : UInt32

    StatusWord : UInt32

    TagWord : UInt32

    ErrorOffset : UInt32

    ErrorSelector : UInt32

    DataOffset : UInt32

    DataSelector : UInt32

    RegisterArea : Int8[80]

    Cr0NpxState : UInt32

}
