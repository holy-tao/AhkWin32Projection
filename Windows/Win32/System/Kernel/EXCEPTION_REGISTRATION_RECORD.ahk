#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct EXCEPTION_REGISTRATION_RECORD {
    #StructPack 8

    Next : EXCEPTION_REGISTRATION_RECORD.Ptr

    Handler : IntPtr

}
