#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IEnumUnknown.ahk
#Include .\IParseDisplayName.ahk

/**
 * Enumerates objects in a compound document or lock a container in the running state. Container and object applications both implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolecontainer
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleContainer extends IParseDisplayName{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleContainer
     * @type {Guid}
     */
    static IID => Guid("{0000011b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumObjects", "LockContainer"]

    /**
     * Enumerates the objects in the current container.
     * @param {Integer} grfFlags Specifies which objects in a container are to be enumerated, as defined in the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olecontf">OLECONTF</a>.
     * @returns {IEnumUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a> pointer variable that receives the interface pointer to the enumerator object. Each time a container receives a successful call to <b>EnumObjects</b>, it must increase the reference count on the <i>ppenum</i> pointer the method returns. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when it is done with the pointer. If an error is returned, the implementation must set <i>ppenum</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecontainer-enumobjects
     */
    EnumObjects(grfFlags) {
        result := ComCall(4, this, "uint", grfFlags, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumUnknown(ppenum)
    }

    /**
     * Keeps the container for embedded objects running until explicitly released.
     * @param {BOOL} fLock Indicates whether to lock (<b>TRUE</b>) or unlock (<b>FALSE</b>) a container.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory available for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecontainer-lockcontainer
     */
    LockContainer(fLock) {
        result := ComCall(5, this, "int", fLock, "HRESULT")
        return result
    }
}
