#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUDIT_IP_ADDRESS {
    #StructPack 1

    pIpAddress : Int8[128]

}
