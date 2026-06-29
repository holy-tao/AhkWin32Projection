#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_REGISTRY_QUOTA_INFORMATION {
    #StructPack 8

    RegistryQuotaAllowed : UInt32

    RegistryQuotaUsed : UInt32

    Reserved1 : IntPtr

}
