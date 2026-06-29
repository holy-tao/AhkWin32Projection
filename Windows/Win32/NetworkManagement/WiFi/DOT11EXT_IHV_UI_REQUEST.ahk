#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_UI_REQUEST {
    #StructPack 8

    dwSessionId : UInt32

    guidUIRequest : Guid

    UIPageClsid : Guid

    dwByteCount : UInt32

    pvUIRequest : IntPtr

}
