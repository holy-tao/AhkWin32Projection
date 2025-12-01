#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMDMMetadataView structure defines the metadata view. Content is organized based on this definition.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmmetadataview
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDMMetadataView extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a wide-character null-terminated string containing the name of the view. This is used as the name of the root node under which this view is presented.
     * @type {PWSTR}
     */
    pwszViewName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Integer containing the depth of the view, which indicates how many nested metadata tags are used for the view.
     * @type {Integer}
     */
    nDepth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Array of metadata tag strings for the nested tags.
     * @type {Pointer<Pointer<Integer>>}
     */
    ppwszTags {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
