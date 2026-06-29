#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A pointer to the IGPMAsyncCancel interface is returned to the client by the Group Policy Management Console (GPMC) method that the client calls asynchronously.
 * @remarks
 * GPMC operations such as backup, restore, import, copy, and report generation can execute asynchronously. For more information about how to use this interface with asynchronous operations, see the "Remarks" section of 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress Interface</a>. The server calls 
 * the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmasyncprogress-status">IGPMAsyncProgress::Status</a> method to notify the client about the progress of the operation. The 
 * <b>Status</b> method also returns an interface pointer to the resultant object, for example, to a <b>GPMGPO</b> or to a <b>GPMBackup</b> object. The caller can then cancel the operation by calling the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmasynccancel-cancel">IGPMAsyncCancel::Cancel</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmasynccancel
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPMAsyncCancel {
    #StructPack 1

}
