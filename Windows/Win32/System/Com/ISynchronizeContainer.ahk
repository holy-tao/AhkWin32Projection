#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISynchronize.ahk
#Include .\IUnknown.ahk

/**
 * Manages a group of unsignaled synchronization objects.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronizecontainer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronizeContainer
     * @type {Guid}
     */
    static IID => Guid("{00000033-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddSynchronize", "WaitMultiple"]

    /**
     * Adds a synchronization object to the container.
     * @param {ISynchronize} pSync A pointer to the synchronization object to be added to the container. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-isynchronize">ISynchronize</a>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_OUT_OF_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The synchronization object container is full.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isynchronizecontainer-addsynchronize
     */
    AddSynchronize(pSync) {
        result := ComCall(3, this, "ptr", pSync, "HRESULT")
        return result
    }

    /**
     * Waits for any synchronization object in the container to be signaled or for a specified timeout period to elapse, whichever comes first.
     * @param {Integer} dwFlags The wait options. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_FLAGS</a> enumeration. COWAIT_WAITALL is not a valid setting for this method.
     * @param {Integer} dwTimeOut The time this call will wait before returning, in milliseconds. If this parameter is INFINITE, the caller will wait until a synchronization object is signaled, no matter how long it takes. If this parameter is 0, the method returns immediately.
     * @returns {ISynchronize} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-isynchronize">ISynchronize</a> interface pointer on the synchronization object that was signaled. This parameter cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isynchronizecontainer-waitmultiple
     */
    WaitMultiple(dwFlags, dwTimeOut) {
        result := ComCall(4, this, "uint", dwFlags, "uint", dwTimeOut, "ptr*", &ppSync := 0, "HRESULT")
        return ISynchronize(ppSync)
    }
}
