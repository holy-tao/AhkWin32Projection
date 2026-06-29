#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NET_IF_ALIAS_LH {
    #StructPack 2

    ifAliasLength : UInt16

    ifAliasOffset : UInt16

}
