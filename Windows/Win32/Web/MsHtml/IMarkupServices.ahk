#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMarkupPointer.ahk
#Include .\IMarkupContainer.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarkupServices
     * @type {Guid}
     */
    static IID => Guid("{3050f4a0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMarkupPointer", "CreateMarkupContainer", "CreateElement", "CloneElement", "InsertElement", "RemoveElement", "Remove", "Copy", "Move", "InsertText", "ParseString", "ParseGlobal", "IsScopedElement", "GetElementTagId", "GetTagIDForName", "GetNameForTagID", "MovePointersToRange", "MoveRangeToPointers", "BeginUndoUnit", "EndUndoUnit"]

    /**
     * 
     * @returns {IMarkupPointer} 
     */
    CreateMarkupPointer() {
        result := ComCall(3, this, "ptr*", &ppPointer := 0, "HRESULT")
        return IMarkupPointer(ppPointer)
    }

    /**
     * 
     * @returns {IMarkupContainer} 
     */
    CreateMarkupContainer() {
        result := ComCall(4, this, "ptr*", &ppMarkupContainer := 0, "HRESULT")
        return IMarkupContainer(ppMarkupContainer)
    }

    /**
     * 
     * @param {Integer} tagID 
     * @param {PWSTR} pchAttributes 
     * @returns {IHTMLElement} 
     */
    CreateElement(tagID, pchAttributes) {
        pchAttributes := pchAttributes is String ? StrPtr(pchAttributes) : pchAttributes

        result := ComCall(5, this, "int", tagID, "ptr", pchAttributes, "ptr*", &ppElement := 0, "HRESULT")
        return IHTMLElement(ppElement)
    }

    /**
     * 
     * @param {IHTMLElement} pElemCloneThis 
     * @returns {IHTMLElement} 
     */
    CloneElement(pElemCloneThis) {
        result := ComCall(6, this, "ptr", pElemCloneThis, "ptr*", &ppElementTheClone := 0, "HRESULT")
        return IHTMLElement(ppElementTheClone)
    }

    /**
     * 
     * @param {IHTMLElement} pElementInsert 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    InsertElement(pElementInsert, pPointerStart, pPointerFinish) {
        result := ComCall(7, this, "ptr", pElementInsert, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pElementRemove 
     * @returns {HRESULT} 
     */
    RemoveElement(pElementRemove) {
        result := ComCall(8, this, "ptr", pElementRemove, "HRESULT")
        return result
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/removeblockedcommand-win32-tpm
     */
    Remove(pPointerStart, pPointerFinish) {
        result := ComCall(9, this, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return result
    }

    /**
     * Copies the specified accelerator table. This function is used to obtain the accelerator-table data that corresponds to an accelerator-table handle, or to determine the size of the accelerator-table data. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winuser.h header defines CopyAcceleratorTable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {IMarkupPointer} pPointerSourceStart 
     * @param {IMarkupPointer} pPointerSourceFinish 
     * @param {IMarkupPointer} pPointerTarget 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * If 
     *       <i>lpAccelDst</i> is <b>NULL</b>, the return value specifies the number of accelerator-table entries in the original table. Otherwise, it specifies the number of accelerator-table entries that were copied.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-copyacceleratortablew
     */
    Copy(pPointerSourceStart, pPointerSourceFinish, pPointerTarget) {
        result := ComCall(10, this, "ptr", pPointerSourceStart, "ptr", pPointerSourceFinish, "ptr", pPointerTarget, "HRESULT")
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
     * @param {IMarkupPointer} pPointerSourceStart 
     * @param {IMarkupPointer} pPointerSourceFinish 
     * @param {IMarkupPointer} pPointerTarget 
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
    Move(pPointerSourceStart, pPointerSourceFinish, pPointerTarget) {
        result := ComCall(11, this, "ptr", pPointerSourceStart, "ptr", pPointerSourceFinish, "ptr", pPointerTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @param {IMarkupPointer} pPointerTarget 
     * @returns {HRESULT} 
     */
    InsertText(pchText, cch, pPointerTarget) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(12, this, "ptr", pchText, "int", cch, "ptr", pPointerTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchHTML 
     * @param {Integer} dwFlags 
     * @param {IMarkupPointer} ppPointerStart 
     * @param {IMarkupPointer} ppPointerFinish 
     * @returns {IMarkupContainer} 
     */
    ParseString(pchHTML, dwFlags, ppPointerStart, ppPointerFinish) {
        pchHTML := pchHTML is String ? StrPtr(pchHTML) : pchHTML

        result := ComCall(13, this, "ptr", pchHTML, "uint", dwFlags, "ptr*", &ppContainerResult := 0, "ptr", ppPointerStart, "ptr", ppPointerFinish, "HRESULT")
        return IMarkupContainer(ppContainerResult)
    }

    /**
     * 
     * @param {HGLOBAL} hglobalHTML 
     * @param {Integer} dwFlags 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {IMarkupContainer} 
     */
    ParseGlobal(hglobalHTML, dwFlags, pPointerStart, pPointerFinish) {
        hglobalHTML := hglobalHTML is Win32Handle ? NumGet(hglobalHTML, "ptr") : hglobalHTML

        result := ComCall(14, this, "ptr", hglobalHTML, "uint", dwFlags, "ptr*", &ppContainerResult := 0, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return IMarkupContainer(ppContainerResult)
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @returns {BOOL} 
     */
    IsScopedElement(pElement) {
        result := ComCall(15, this, "ptr", pElement, "int*", &pfScoped := 0, "HRESULT")
        return pfScoped
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @returns {Integer} 
     */
    GetElementTagId(pElement) {
        result := ComCall(16, this, "ptr", pElement, "int*", &ptagId := 0, "HRESULT")
        return ptagId
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {Integer} 
     */
    GetTagIDForName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(17, this, "ptr", bstrName, "int*", &ptagId := 0, "HRESULT")
        return ptagId
    }

    /**
     * 
     * @param {Integer} tagId 
     * @returns {BSTR} 
     */
    GetNameForTagID(tagId) {
        pbstrName := BSTR()
        result := ComCall(18, this, "int", tagId, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {IHTMLTxtRange} pIRange 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    MovePointersToRange(pIRange, pPointerStart, pPointerFinish) {
        result := ComCall(19, this, "ptr", pIRange, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @param {IHTMLTxtRange} pIRange 
     * @returns {HRESULT} 
     */
    MoveRangeToPointers(pPointerStart, pPointerFinish, pIRange) {
        result := ComCall(20, this, "ptr", pPointerStart, "ptr", pPointerFinish, "ptr", pIRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchTitle 
     * @returns {HRESULT} 
     */
    BeginUndoUnit(pchTitle) {
        pchTitle := pchTitle is String ? StrPtr(pchTitle) : pchTitle

        result := ComCall(21, this, "ptr", pchTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndUndoUnit() {
        result := ComCall(22, this, "HRESULT")
        return result
    }
}
