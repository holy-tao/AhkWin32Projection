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
    static sizeof => 32

    static packingSize => 8

    class _PolicyParameters_e__Union extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        class _MaximumSize extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Containers {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class _MinimumSize extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Containers {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class _NewContainerSize extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            SizeInBytes {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class _GrowthRate extends Win32Struct {
            static sizeof => 8
            static packingSize => 4
    
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
            static sizeof => 8
            static packingSize => 4
    
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
    
        class _AutoShrink extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Percentage {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class _AutoGrow extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Enabled {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class _NewContainerPrefix extends Win32Struct {
            static sizeof => 4
            static packingSize => 2
    
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
    
        class _NewContainerSuffix extends Win32Struct {
            static sizeof => 8
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            NextContainerSuffix {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class _NewContainerExtension extends Win32Struct {
            static sizeof => 4
            static packingSize => 2
    
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
         * @type {_MaximumSize}
         */
        MaximumSize{
            get {
                if(!this.HasProp("__MaximumSize"))
                    this.__MaximumSize := %this.__Class%._MaximumSize(0, this)
                return this.__MaximumSize
            }
        }
    
        /**
         * @type {_MinimumSize}
         */
        MinimumSize{
            get {
                if(!this.HasProp("__MinimumSize"))
                    this.__MinimumSize := %this.__Class%._MinimumSize(0, this)
                return this.__MinimumSize
            }
        }
    
        /**
         * @type {_NewContainerSize}
         */
        NewContainerSize{
            get {
                if(!this.HasProp("__NewContainerSize"))
                    this.__NewContainerSize := %this.__Class%._NewContainerSize(0, this)
                return this.__NewContainerSize
            }
        }
    
        /**
         * @type {_GrowthRate}
         */
        GrowthRate{
            get {
                if(!this.HasProp("__GrowthRate"))
                    this.__GrowthRate := %this.__Class%._GrowthRate(0, this)
                return this.__GrowthRate
            }
        }
    
        /**
         * @type {_LogTail}
         */
        LogTail{
            get {
                if(!this.HasProp("__LogTail"))
                    this.__LogTail := %this.__Class%._LogTail(0, this)
                return this.__LogTail
            }
        }
    
        /**
         * @type {_AutoShrink}
         */
        AutoShrink{
            get {
                if(!this.HasProp("__AutoShrink"))
                    this.__AutoShrink := %this.__Class%._AutoShrink(0, this)
                return this.__AutoShrink
            }
        }
    
        /**
         * @type {_AutoGrow}
         */
        AutoGrow{
            get {
                if(!this.HasProp("__AutoGrow"))
                    this.__AutoGrow := %this.__Class%._AutoGrow(0, this)
                return this.__AutoGrow
            }
        }
    
        /**
         * @type {_NewContainerPrefix}
         */
        NewContainerPrefix{
            get {
                if(!this.HasProp("__NewContainerPrefix"))
                    this.__NewContainerPrefix := %this.__Class%._NewContainerPrefix(0, this)
                return this.__NewContainerPrefix
            }
        }
    
        /**
         * @type {_NewContainerSuffix}
         */
        NewContainerSuffix{
            get {
                if(!this.HasProp("__NewContainerSuffix"))
                    this.__NewContainerSuffix := %this.__Class%._NewContainerSuffix(0, this)
                return this.__NewContainerSuffix
            }
        }
    
        /**
         * @type {_NewContainerExtension}
         */
        NewContainerExtension{
            get {
                if(!this.HasProp("__NewContainerExtension"))
                    this.__NewContainerExtension := %this.__Class%._NewContainerExtension(0, this)
                return this.__NewContainerExtension
            }
        }
    
    }

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
     * Specifies the specific policy this structure describes.
     * @type {_PolicyParameters_e__Union}
     */
    PolicyParameters{
        get {
            if(!this.HasProp("__PolicyParameters"))
                this.__PolicyParameters := %this.__Class%._PolicyParameters_e__Union(16, this)
            return this.__PolicyParameters
        }
    }
}
