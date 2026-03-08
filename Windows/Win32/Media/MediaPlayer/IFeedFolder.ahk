#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedFolder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedFolder
     * @type {Guid}
     */
    static IID => Guid("{81f04ad1-4194-4d7d-86d6-11813cec163c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Feeds", "get_Subfolders", "CreateFeed", "CreateSubfolder", "ExistsFeed", "GetFeed", "ExistsSubfolder", "GetSubfolder", "Delete", "get_Name", "Rename", "get_Path", "Move", "get_Parent", "get_IsRoot", "get_TotalUnreadItemCount", "get_TotalItemCount", "GetWatcher"]

    /**
     * @type {IDispatch} 
     */
    Feeds {
        get => this.get_Feeds()
    }

    /**
     * @type {IDispatch} 
     */
    Subfolders {
        get => this.get_Subfolders()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsRoot {
        get => this.get_IsRoot()
    }

    /**
     * @type {Integer} 
     */
    TotalUnreadItemCount {
        get => this.get_TotalUnreadItemCount()
    }

    /**
     * @type {Integer} 
     */
    TotalItemCount {
        get => this.get_TotalItemCount()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Feeds() {
        result := ComCall(7, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Subfolders() {
        result := ComCall(8, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @param {BSTR} feedUrl 
     * @returns {IDispatch} 
     */
    CreateFeed(feedName, feedUrl) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(9, this, "ptr", feedName, "ptr", feedUrl, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {IDispatch} 
     */
    CreateSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(10, this, "ptr", folderName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFeed(feedName) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName

        result := ComCall(11, this, "ptr", feedName, "short*", &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @returns {IDispatch} 
     */
    GetFeed(feedName) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName

        result := ComCall(12, this, "ptr", feedName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {VARIANT_BOOL} 
     */
    ExistsSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(13, this, "ptr", folderName, "short*", &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {IDispatch} 
     */
    GetSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(14, this, "ptr", folderName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * Deletes an access control entry (ACE) from an access control list (ACL).
     * @remarks
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_size_information">ACL_SIZE_INFORMATION</a> structure retrieved by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getaclinformation">GetAclInformation</a> function to discover the size of the ACL and the number of ACEs it contains. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getace">GetAce</a> function retrieves information about an individual ACE.
     * @returns {HRESULT} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-deleteace
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        folderName := BSTR()
        result := ComCall(16, this, "ptr", folderName, "HRESULT")
        return folderName
    }

    /**
     * Learn more about: RenameColumnGrbit enumeration
     * @param {BSTR} folderName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/renamecolumngrbit-enumeration
     */
    Rename(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(17, this, "ptr", folderName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        folderPath := BSTR()
        result := ComCall(18, this, "ptr", folderPath, "HRESULT")
        return folderPath
    }

    /**
     * Moves a group and all of its resources from one node to another.
     * @remarks
     * The return value from the  <b>MoveClusterGroup</b> function does not imply anything about the state of the group or any of its resources. The return value only indicates whether the change of ownership was successful. After returning from  <b>MoveClusterGroup</b>, the cluster always attempts to return the group to the state it was before the move.
     * 
     * If you want your application to ensure a particular state for a resource or a group after a move:
     * 
     * <ol>
     * <li>Check the state prior to the move. The cluster will attempt to restore that state after the move.</li>
     * <li>Poll for the state after the move and adjust as necessary. Or create a notification port (see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/receiving-cluster-events">Receiving Cluster Events</a>) and wait for a <b>CLUSTER_CHANGE_GROUP_STATE</b> event.</li>
     * </ol>
     * When <i>hDestinationNode</i> is set to <b>NULL</b>,  <b>MoveClusterGroup</b> attempts to move the group to the best possible node. If there is no node available that can accept the group, the function fails.  <b>MoveClusterGroup</b> also fails if  <b>MoveClusterGroup</b> determines that the group cannot be brought online on the node identified by the <i>hDestinationNode</i> parameter.
     * 
     * Do not call  <b>MoveClusterGroup</b> from a resource DLL. For more information, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/function-calls-to-avoid-in-resource-dlls">Function Calls to Avoid in Resource DLLs</a>.
     * 
     * Do not pass LPC and RPC handles to the same function call. Otherwise, the call will raise an RPC exception and can have additional destructive effects. For information on how LPC and RPC handles are created, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/using-object-handles">Using Object Handles</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a>.
     * @param {BSTR} newParentPath 
     * @returns {HRESULT} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. The following is one of the possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reassignment of ownership of the group is in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/clusapi/nf-clusapi-moveclustergroup
     */
    Move(newParentPath) {
        newParentPath := newParentPath is String ? BSTR.Alloc(newParentPath).Value : newParentPath

        result := ComCall(19, this, "ptr", newParentPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(20, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsRoot() {
        result := ComCall(21, this, "short*", &isRoot := 0, "HRESULT")
        return isRoot
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalUnreadItemCount() {
        result := ComCall(22, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalItemCount() {
        result := ComCall(23, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @returns {IDispatch} 
     */
    GetWatcher(scope, mask) {
        result := ComCall(24, this, "int", scope, "int", mask, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }
}
