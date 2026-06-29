#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct OB_POST_DUPLICATE_HANDLE_INFORMATION {
    #StructPack 4

    GrantedAccess : UInt32

}
