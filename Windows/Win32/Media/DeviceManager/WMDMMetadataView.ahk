#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WMDMMetadataView structure defines the metadata view. Content is organized based on this definition.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmmetadataview
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDMMetadataView {
    #StructPack 8

    /**
     * Pointer to a wide-character null-terminated string containing the name of the view. This is used as the name of the root node under which this view is presented.
     */
    pwszViewName : PWSTR

    /**
     * Integer containing the depth of the view, which indicates how many nested metadata tags are used for the view.
     */
    nDepth : UInt32

    /**
     * Array of metadata tag strings for the nested tags.
     */
    ppwszTags : IntPtr

}
