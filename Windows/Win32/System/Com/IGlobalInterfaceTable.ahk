#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables any apartment in a process to get access to an interface implemented on an object in any other apartment in the process.
 * @remarks
 * The <b>IGlobalInterfaceTable</b> interface is an efficient way for a process to store an interface pointer in a memory location that can be accessed from multiple apartments within the process, such as processwide variables and agile (free-threaded marshaled) objects containing interface pointers to other objects. 
 * 
 * 
 * 
 * An agile object is unaware of the underlying COM infrastructure in which it runs - in other words, what apartment, context, and thread it is executing on. The object may be holding on to interfaces that are specific to an apartment or context. For this reason, calling these interfaces from wherever the agile component is executing may not always work properly. The global interface table avoids this problem by guaranteeing that a valid proxy (or direct pointer) to the object is used, based on where the agile object is executing.
 * 
 * The global interface table is not portable across process or machine boundaries, so it cannot be used in place of the normal parameter-passing mechanism.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iglobalinterfacetable
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IGlobalInterfaceTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlobalInterfaceTable
     * @type {Guid}
     */
    static IID => Guid("{00000146-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterInterfaceInGlobal", "RevokeInterfaceFromGlobal", "GetInterfaceFromGlobal"]

    /**
     * Registers the specified interface on an object residing in one apartment of a process as a global interface, enabling other apartments access to that interface.
     * @remarks
     * Called in the apartment in which an object resides to register one of the object's interfaces as a global interface. This method supplies a pointer to a cookie that other apartments can use in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iglobalinterfacetable-getinterfacefromglobal">GetInterfaceFromGlobal</a> method to get a pointer to that interface.
     * 
     * The interface pointer may be a pointer to an in-process object, or it may be a pointer to a proxy for an object residing in another apartment, in another process, or on another computer.
     * 
     * The apartment that calls this method must remain alive until the corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iglobalinterfacetable-revokeinterfacefromglobal">RevokeInterfaceFromGlobal</a>.
     * @param {IUnknown} pUnk An interface pointer of type <i>riid</i> on the object on which the interface to be registered as global is implemented.
     * @param {Pointer<Guid>} riid The IID of the interface to be registered as global.
     * @returns {Integer} An identifier that can be used by another apartment to get access to a pointer to the interface being registered. The value of an invalid cookie is 0.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iglobalinterfacetable-registerinterfaceinglobal
     */
    RegisterInterfaceInGlobal(pUnk, riid) {
        result := ComCall(3, this, "ptr", pUnk, "ptr", riid, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Revokes the registration of an interface in the global interface table.
     * @remarks
     * Call this method when an interface registered in the global interface table object no longer needs to be accessed by other apartments in the same process. This method can be called by any apartment in the process, including apartments other than the one that registered the interface in the global interface table.
     * @param {Integer} dwCookie Identifies the interface whose global registration is to be revoked.
     * @returns {HRESULT} This method can return the following values.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iglobalinterfacetable-revokeinterfacefromglobal
     */
    RevokeInterfaceFromGlobal(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to an interface on an object that is usable by the calling apartment. This interface must be currently registered in the global interface table.
     * @remarks
     * After an interface has been registered in the global interface table, an apartment can get a pointer to this interface by calling the <b>GetInterfaceFromGlobal</b> method with the supplied cookie. This pointer to the interface can be used in the calling apartment but not by other apartments in the process.
     * 
     * The application is responsible for coordinating access to the global variable during calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iglobalinterfacetable-revokeinterfacefromglobal">IGlobalInterfaceTable::RevokeInterfaceFromGlobal</a>. That is, the application should ensure that one thread does not call <b>RevokeInterfaceFromGlobal</b> while another thread is calling <b>GetInterfaceFromGlobal</b> with the same cookie. Multiple calls to <b>GetInterfaceFromGlobal</b> for the same cookie are permitted.
     * 
     * The <b>GetInterfaceFromGlobal</b> method calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the pointer obtained in the <i>ppv</i> parameter. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on this pointer.
     * @param {Integer} dwCookie Identifies the interface (and its object), and is retrieved through a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iglobalinterfacetable-registerinterfaceinglobal">IGlobalInterfaceTable::RegisterInterfaceInGlobal</a>.
     * @param {Pointer<Guid>} riid The IID of the interface.
     * @returns {Pointer<Void>} A pointer to the pointer for the requested interface.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iglobalinterfacetable-getinterfacefromglobal
     */
    GetInterfaceFromGlobal(dwCookie, riid) {
        result := ComCall(5, this, "uint", dwCookie, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
