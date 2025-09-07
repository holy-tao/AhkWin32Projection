#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CLFS_MGMT_POLICY structure specifies a Common Log File System (CLFS) management policy. The PolicyType member specifies the members used for a policy.
 * @see https://learn.microsoft.com/windows/win32/api/clfsmgmt/ns-clfsmgmt-clfs_mgmt_policy
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_MGMT_POLICY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the version of the log manager headers that the application is compiled with.
     * 
     * Set this to CLFS_MGMT_POLICY_VERSION.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the length of the entire structure.
     * @type {Integer}
     */
    LengthInBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved. Specify zero.
     * @type {Integer}
     */
    PolicyFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the members used for a specific policy. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmt/ne-clfsmgmt-clfs_mgmt_policy_type">CLFS_MGMT_POLICY_TYPE</a>.
     * @type {Integer}
     */
    PolicyType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MaximumSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MinimumSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NewContainerSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    AbsoluteGrowthInContainers {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    RelativeGrowthPercentage {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    MinimumAvailablePercentage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MinimumAvailableContainers {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    AutoShrink {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    AutoGrow {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PrefixLengthInBytes {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {String}
     */
    PrefixString {
        get => StrGet(this.ptr + 18, 0, "UTF-16")
        set => StrPut(value, this.ptr + 18, 0, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    NewContainerSuffix {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ExtensionLengthInBytes {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {String}
     */
    ExtensionString {
        get => StrGet(this.ptr + 18, 0, "UTF-16")
        set => StrPut(value, this.ptr + 18, 0, "UTF-16")
    }
}
