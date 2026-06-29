#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset Unicode
 */
export default struct JET_USERDEFINEDDEFAULT_W {
    #StructPack 8

    szCallback : IntPtr

    pbUserData : IntPtr

    cbUserData : UInt32

    szDependantColumns : IntPtr

}
