#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_RANGE.ahk" { CLUSTER_RANGE }
#Import ".\QUERY_FILE_LAYOUT_FILTER_TYPE.ahk" { QUERY_FILE_LAYOUT_FILTER_TYPE }
#Import ".\FILE_REFERENCE_RANGE.ahk" { FILE_REFERENCE_RANGE }
#Import ".\STORAGE_RESERVE_ID.ahk" { STORAGE_RESERVE_ID }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct QUERY_FILE_LAYOUT_INPUT {
    #StructPack 8


    struct _Filter {
        ClusterRanges : CLUSTER_RANGE[1]

        static __New() {
            DefineProp(this.Prototype, 'FileReferenceRanges', { type: FILE_REFERENCE_RANGE[1], offset: 0 })
            DefineProp(this.Prototype, 'StorageReserveIds', { type: STORAGE_RESERVE_ID[1], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    FilterEntryCount : UInt32

    Flags : UInt32

    FilterType : QUERY_FILE_LAYOUT_FILTER_TYPE

    Reserved : UInt32

    Filter : QUERY_FILE_LAYOUT_INPUT._Filter

    static __New() {
        DefineProp(this.Prototype, 'NumberOfPairs', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
