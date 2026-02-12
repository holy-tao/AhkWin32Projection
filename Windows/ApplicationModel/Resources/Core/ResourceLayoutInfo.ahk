#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Structure that determines version and counts of resources returned for the app package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcelayoutinfo
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceLayoutInfo extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Major version of resources to be returned.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Minor version of resources to be returned.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of resource subtrees to be returned.
     * @type {Integer}
     */
    ResourceSubtreeCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of named resources to be returned.
     * @type {Integer}
     */
    NamedResourceCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Framework-generated checksum.
     * @type {Integer}
     */
    Checksum {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
