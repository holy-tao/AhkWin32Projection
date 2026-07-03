#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_MCA_INTERFACE {
    #StructPack 8

    Lock : IntPtr

    Unlock : IntPtr

    ReadRegister : IntPtr

}
