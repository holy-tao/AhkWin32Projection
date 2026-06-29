#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLFS_MGMT_POLICY_TYPE.ahk" { CLFS_MGMT_POLICY_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The CLFS_MGMT_POLICY structure specifies a Common Log File System (CLFS) management policy. The PolicyType member specifies the members used for a policy.
 * @see https://learn.microsoft.com/windows/win32/api/clfsmgmt/ns-clfsmgmt-clfs_mgmt_policy
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_MGMT_POLICY {
    #StructPack 8


    struct _PolicyParameters {

        struct _MaximumSize {
            Containers : UInt32

        }

        struct _MinimumSize {
            Containers : UInt32

        }

        struct _NewContainerSize {
            SizeInBytes : UInt32

        }

        struct _GrowthRate {
            AbsoluteGrowthInContainers : UInt32

            RelativeGrowthPercentage : UInt32

        }

        struct _LogTail {
            MinimumAvailablePercentage : UInt32

            MinimumAvailableContainers : UInt32

        }

        struct _AutoShrink {
            Percentage : UInt32

        }

        struct _AutoGrow {
            Enabled : UInt32

        }

        struct _NewContainerPrefix {
            PrefixLengthInBytes : UInt16

            PrefixString : WCHAR[1]

        }

        struct _NewContainerSuffix {
            NextContainerSuffix : Int64

        }

        struct _NewContainerExtension {
            ExtensionLengthInBytes : UInt16

            ExtensionString : WCHAR[1]

        }

        MaximumSize : CLFS_MGMT_POLICY._PolicyParameters._MaximumSize

        static __New() {
            DefineProp(this.Prototype, 'MinimumSize', { type: CLFS_MGMT_POLICY._PolicyParameters._MinimumSize, offset: 0 })
            DefineProp(this.Prototype, 'NewContainerSize', { type: CLFS_MGMT_POLICY._PolicyParameters._NewContainerSize, offset: 0 })
            DefineProp(this.Prototype, 'GrowthRate', { type: CLFS_MGMT_POLICY._PolicyParameters._GrowthRate, offset: 0 })
            DefineProp(this.Prototype, 'LogTail', { type: CLFS_MGMT_POLICY._PolicyParameters._LogTail, offset: 0 })
            DefineProp(this.Prototype, 'AutoShrink', { type: CLFS_MGMT_POLICY._PolicyParameters._AutoShrink, offset: 0 })
            DefineProp(this.Prototype, 'AutoGrow', { type: CLFS_MGMT_POLICY._PolicyParameters._AutoGrow, offset: 0 })
            DefineProp(this.Prototype, 'NewContainerPrefix', { type: CLFS_MGMT_POLICY._PolicyParameters._NewContainerPrefix, offset: 0 })
            DefineProp(this.Prototype, 'NewContainerSuffix', { type: CLFS_MGMT_POLICY._PolicyParameters._NewContainerSuffix, offset: 0 })
            DefineProp(this.Prototype, 'NewContainerExtension', { type: CLFS_MGMT_POLICY._PolicyParameters._NewContainerExtension, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Specifies the version of the log manager headers that the application is compiled with.
     * 
     * Set this to CLFS_MGMT_POLICY_VERSION.
     */
    Version : UInt32

    /**
     * Specifies the length of the entire structure.
     */
    LengthInBytes : UInt32

    /**
     * Reserved. Specify zero.
     */
    PolicyFlags : UInt32

    /**
     * Specifies the members used for a specific policy. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmt/ne-clfsmgmt-clfs_mgmt_policy_type">CLFS_MGMT_POLICY_TYPE</a>.
     */
    PolicyType : CLFS_MGMT_POLICY_TYPE

    /**
     * Specifies the specific policy this structure describes.
     */
    PolicyParameters : CLFS_MGMT_POLICY._PolicyParameters

}
