#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SharedVirtualDiskSupportType.ahk" { SharedVirtualDiskSupportType }
#Import ".\SharedVirtualDiskHandleState.ahk" { SharedVirtualDiskHandleState }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SHARED_VIRTUAL_DISK_SUPPORT {
    #StructPack 4

    SharedVirtualDiskSupport : SharedVirtualDiskSupportType

    HandleState : SharedVirtualDiskHandleState

}
