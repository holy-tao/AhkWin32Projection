#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct INITIAL_PRIVILEGE_SET {
    #StructPack 8

    PrivilegeCount : UInt32

    Control : UInt32

    Privilege : IntPtr[3]

}
