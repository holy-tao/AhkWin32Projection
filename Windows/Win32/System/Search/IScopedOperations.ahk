#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IBindResource.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IScopedOperations extends IBindResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScopedOperations
     * @type {Guid}
     */
    static IID => Guid("{0c733ab0-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Copy", "Move", "Delete", "OpenRowset"]

    /**
     * Copies the specified accelerator table. This function is used to obtain the accelerator-table data that corresponds to an accelerator-table handle, or to determine the size of the accelerator-table data. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winuser.h header defines CopyAcceleratorTable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszSourceURLs 
     * @param {Pointer<PWSTR>} rgpwszDestURLs 
     * @param {Integer} dwCopyFlags 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<Integer>} rgdwStatus 
     * @param {Pointer<PWSTR>} rgpwszNewURLs 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * If 
     *       <i>lpAccelDst</i> is <b>NULL</b>, the return value specifies the number of accelerator-table entries in the original table. Otherwise, it specifies the number of accelerator-table entries that were copied.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-copyacceleratortablew
     */
    Copy(cRows, rgpwszSourceURLs, rgpwszDestURLs, dwCopyFlags, pAuthenticate, rgdwStatus, rgpwszNewURLs, ppStringsBuffer) {
        rgpwszSourceURLsMarshal := rgpwszSourceURLs is VarRef ? "ptr*" : "ptr"
        rgpwszDestURLsMarshal := rgpwszDestURLs is VarRef ? "ptr*" : "ptr"
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"
        rgpwszNewURLsMarshal := rgpwszNewURLs is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", cRows, rgpwszSourceURLsMarshal, rgpwszSourceURLs, rgpwszDestURLsMarshal, rgpwszDestURLs, "uint", dwCopyFlags, "ptr", pAuthenticate, rgdwStatusMarshal, rgdwStatus, rgpwszNewURLsMarshal, rgpwszNewURLs, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
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
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszSourceURLs 
     * @param {Pointer<PWSTR>} rgpwszDestURLs 
     * @param {Integer} dwMoveFlags 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<Integer>} rgdwStatus 
     * @param {Pointer<PWSTR>} rgpwszNewURLs 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
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
    Move(cRows, rgpwszSourceURLs, rgpwszDestURLs, dwMoveFlags, pAuthenticate, rgdwStatus, rgpwszNewURLs, ppStringsBuffer) {
        rgpwszSourceURLsMarshal := rgpwszSourceURLs is VarRef ? "ptr*" : "ptr"
        rgpwszDestURLsMarshal := rgpwszDestURLs is VarRef ? "ptr*" : "ptr"
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"
        rgpwszNewURLsMarshal := rgpwszNewURLs is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", cRows, rgpwszSourceURLsMarshal, rgpwszSourceURLs, rgpwszDestURLsMarshal, rgpwszDestURLs, "uint", dwMoveFlags, "ptr", pAuthenticate, rgdwStatusMarshal, rgdwStatus, rgpwszNewURLsMarshal, rgpwszNewURLs, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
    }

    /**
     * Deletes an access control entry (ACE) from an access control list (ACL).
     * @remarks
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_size_information">ACL_SIZE_INFORMATION</a> structure retrieved by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getaclinformation">GetAclInformation</a> function to discover the size of the ACL and the number of ACEs it contains. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getace">GetAce</a> function retrieves information about an individual ACE.
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszURLs 
     * @param {Integer} dwDeleteFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-deleteace
     */
    Delete(cRows, rgpwszURLs, dwDeleteFlags) {
        rgpwszURLsMarshal := rgpwszURLs is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", cRows, rgpwszURLsMarshal, rgpwszURLs, "uint", dwDeleteFlags, "uint*", &rgdwStatus := 0, "HRESULT")
        return rgdwStatus
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pIndexID 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    OpenRowset(pUnkOuter, pTableID, pIndexID, riid, cPropertySets, rgPropertySets) {
        result := ComCall(7, this, "ptr", pUnkOuter, "ptr", pTableID, "ptr", pIndexID, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }
}
