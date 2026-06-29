#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CREATE_USER_PROCESS_ECP_CONTEXT {
    #StructPack 8

    Size : UInt16

    Reserved : UInt16

    AccessToken : IntPtr

}
