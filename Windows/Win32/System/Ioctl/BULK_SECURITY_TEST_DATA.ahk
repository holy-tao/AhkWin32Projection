#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct BULK_SECURITY_TEST_DATA {
    #StructPack 4

    DesiredAccess : UInt32

    SecurityIds : UInt32[1]

}
