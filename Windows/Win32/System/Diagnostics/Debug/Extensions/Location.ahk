#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The Location attribute is the geographic location of the radio station or \ 0034;Net only \ 0034;.
 * @remarks
 * This attribute is stored only in the library.
 * 
 * To determine whether you can change the value of this attribute, use the [Media.isReadOnlyItem](media-isreadonlyitem.md) method.
 * @see https://learn.microsoft.com/windows/win32/WMP/location-attribute
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct Location {
    #StructPack 8

    HostDefined : Int64

    Offset : Int64

}
