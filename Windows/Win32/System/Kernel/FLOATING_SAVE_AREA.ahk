#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 * @architecture X64, Arm64
 */
export default struct FLOATING_SAVE_AREA {
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
