#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct OBJECT_HANDLE_INFORMATION {
    #StructPack 4

    HandleAttributes : UInt32

    GrantedAccess : UInt32

}
