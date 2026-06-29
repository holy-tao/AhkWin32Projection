#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct xa_switch_t {
    #StructPack 8

    name : CHAR[32]

    flags : Int32

    version : Int32

    xa_open_entry : IntPtr

    xa_close_entry : IntPtr

    xa_start_entry : IntPtr

    xa_end_entry : IntPtr

    xa_rollback_entry : IntPtr

    xa_prepare_entry : IntPtr

    xa_commit_entry : IntPtr

    xa_recover_entry : IntPtr

    xa_forget_entry : IntPtr

    xa_complete_entry : IntPtr

}
