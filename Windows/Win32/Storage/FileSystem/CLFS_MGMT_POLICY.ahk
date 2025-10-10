#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CLFS_MGMT_POLICY structure specifies a Common Log File System (CLFS) management policy. The PolicyType member specifies the members used for a policy.
 * @see https://docs.microsoft.com/windows/win32/api//clfsmgmt/ns-clfsmgmt-clfs_mgmt_policy
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_MGMT_POLICY extends Win32Struct
{
    static sizeof => 32

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

    class _GrowthRate extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        AbsoluteGrowthInContainers {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        RelativeGrowthPercentage {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _LogTail extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        MinimumAvailablePercentage {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MinimumAvailableContainers {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _NewContainerPrefix extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        PrefixLengthInBytes {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {String}
         */
        PrefixString {
            get => StrGet(this.ptr + 2, 0, "UTF-16")
            set => StrPut(value, this.ptr + 2, 0, "UTF-16")
        }
    
    }

    class _NewContainerExtension extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ExtensionLengthInBytes {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {String}
         */
        ExtensionString {
            get => StrGet(this.ptr + 2, 0, "UTF-16")
            set => StrPut(value, this.ptr + 2, 0, "UTF-16")
        }
    
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
     * @type {_GrowthRate}
     */
    GrowthRate{
        get {
            if(!this.HasProp("__GrowthRate"))
                this.__GrowthRate := %this.__Class%._GrowthRate(this.ptr + 16)
            return this.__GrowthRate
        }
    }

    /**
     * @type {_LogTail}
     */
    LogTail{
        get {
            if(!this.HasProp("__LogTail"))
                this.__LogTail := %this.__Class%._LogTail(this.ptr + 16)
            return this.__LogTail
        }
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
     * @type {_NewContainerPrefix}
     */
    NewContainerPrefix{
        get {
            if(!this.HasProp("__NewContainerPrefix"))
                this.__NewContainerPrefix := %this.__Class%._NewContainerPrefix(this.ptr + 16)
            return this.__NewContainerPrefix
        }
    }

    /**
     * @type {Integer}
     */
    NewContainerSuffix {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {_NewContainerExtension}
     */
    NewContainerExtension{
        get {
            if(!this.HasProp("__NewContainerExtension"))
                this.__NewContainerExtension := %this.__Class%._NewContainerExtension(this.ptr + 16)
            return this.__NewContainerExtension
        }
    }
}
