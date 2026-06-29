#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SERVICE_TYPE_VALUE {
    #StructPack 4

    dwNameSpace : UInt32

    dwValueType : UInt32

    dwValueSize : UInt32

    dwValueNameOffset : UInt32

    dwValueOffset : UInt32

}
