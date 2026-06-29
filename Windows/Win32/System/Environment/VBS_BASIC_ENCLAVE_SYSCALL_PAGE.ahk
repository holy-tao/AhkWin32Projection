#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_SYSCALL_PAGE {
    #StructPack 8

    ReturnFromEnclave : IntPtr

    ReturnFromException : IntPtr

    TerminateThread : IntPtr

    InterruptThread : IntPtr

    CommitPages : IntPtr

    DecommitPages : IntPtr

    ProtectPages : IntPtr

    CreateThread : IntPtr

    GetEnclaveInformation : IntPtr

    GenerateKey : IntPtr

    GenerateReport : IntPtr

    VerifyReport : IntPtr

    GenerateRandomData : IntPtr

}
