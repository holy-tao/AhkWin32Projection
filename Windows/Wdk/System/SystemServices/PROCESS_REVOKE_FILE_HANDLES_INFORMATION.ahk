#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_REVOKE_FILE_HANDLES_INFORMATION {
    #StructPack 8

    TargetDevicePath : IntPtr

}
