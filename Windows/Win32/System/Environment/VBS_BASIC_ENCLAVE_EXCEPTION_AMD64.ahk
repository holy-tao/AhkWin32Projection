#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_EXCEPTION_AMD64 {
    #StructPack 8

    ExceptionCode : UInt32

    NumberParameters : UInt32

    ExceptionInformation : IntPtr[3]

    ExceptionRAX : IntPtr

    ExceptionRCX : IntPtr

    ExceptionRIP : IntPtr

    ExceptionRFLAGS : IntPtr

    ExceptionRSP : IntPtr

}
