#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IELAUNCHURLINFO {
    #StructPack 4

    cbSize : UInt32 := this.Size

    dwCreationFlags : UInt32

    dwLaunchOptionFlags : UInt32

}
