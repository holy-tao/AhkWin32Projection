#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct NAVIGATEDATA {
    #StructPack 4

    ulTarget : UInt32

    ulURL : UInt32

    ulRefURL : UInt32

    ulPostData : UInt32

    dwFlags : UInt32

}
