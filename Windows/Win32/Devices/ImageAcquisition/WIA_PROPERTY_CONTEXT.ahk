#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_PROPERTY_CONTEXT {
    #StructPack 8

    cProps : UInt32

    pProps : IntPtr

    pChanged : BOOL.Ptr

}
