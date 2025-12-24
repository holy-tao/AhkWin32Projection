#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\IEnumMoniker.ahk

/**
 * Manages access to the running object table (ROT), a globally accessible look-up table on each workstation.
 * @remarks
 * 
 * The ROT contains entries of the following form: (<i>pmkObjectName</i>, <i>pUnkObject</i>).
 * 
 * The <i>pmkObjectName</i> element is a pointer to the moniker that identifies the running object. The <i>pUnkObject</i> element is a pointer to the running object itself. During the binding process, monikers consult the <i>pmkObjectName</i> entries in the ROT to see whether an object is already running.
 * 
 * Objects that can be named by monikers must be registered with the ROT when they are loaded and their registration must be revoked when they are no longer running.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irunningobjecttable
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRunningObjectTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRunningObjectTable
     * @type {Guid}
     */
    static IID => Guid("{00000010-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Revoke", "IsRunning", "GetObject", "NoteChangeTime", "GetTimeOfLastChange", "EnumRunning"]

    /**
     * Registers an object and its identifying moniker in the running object table (ROT).
     * @param {Integer} grfFlags Specifies whether the ROT's reference to punkObject is weak or strong and controls access to the object through its entry in the ROT. For details, see the Remarks section.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ROTFLAGS_REGISTRATIONKEEPSALIVE"></a><a id="rotflags_registrationkeepsalive"></a><dl>
     * <dt><b>ROTFLAGS_REGISTRATIONKEEPSALIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, indicates a strong registration for the object. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ROTFLAGS_ALLOWANYCLIENT"></a><a id="rotflags_allowanyclient"></a><dl>
     * <dt><b>ROTFLAGS_ALLOWANYCLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, any client can connect to the running object through its entry in the ROT. When not set, only clients in the window station that registered the object can connect to it.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IUnknown} punkObject A pointer to the object that is being registered as running.
     * @param {IMoniker} pmkObjectName A pointer to the moniker that identifies <i>punkObject</i>.
     * @returns {Integer} An identifier for this ROT entry that can be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-revoke">IRunningObjectTable::Revoke</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-notechangetime">IRunningObjectTable::NoteChangeTime</a>. The caller cannot specify <b>NULL</b> for this parameter. If an error occurs, *<i>pdwRegister</i> is set to zero.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunningobjecttable-register
     */
    Register(grfFlags, punkObject, pmkObjectName) {
        result := ComCall(3, this, "uint", grfFlags, "ptr", punkObject, "ptr", pmkObjectName, "uint*", &pdwRegister := 0, "HRESULT")
        return pdwRegister
    }

    /**
     * Removes an entry from the running object table (ROT) that was previously registered by a call to IRunningObjectTable::Register.
     * @param {Integer} dwRegister The identifier of the ROT entry to be revoked.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunningobjecttable-revoke
     */
    Revoke(dwRegister) {
        result := ComCall(4, this, "uint", dwRegister, "HRESULT")
        return result
    }

    /**
     * Determines whether the object identified by the specified moniker is currently running.
     * @param {IMoniker} pmkObjectName A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker.
     * @returns {HRESULT} If the object is in the running state, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunningobjecttable-isrunning
     */
    IsRunning(pmkObjectName) {
        result := ComCall(5, this, "ptr", pmkObjectName, "HRESULT")
        return result
    }

    /**
     * Determines whether the object identified by the specified moniker is running, and if it is, retrieves a pointer to that object.
     * @param {IMoniker} pmkObjectName A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker.
     * @returns {IUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer variable that receives the interface pointer to the running object. When successful, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the object; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If the object is not running or if an error occurs, the implementation sets *<i>ppunkObject</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunningobjecttable-getobject
     */
    GetObject(pmkObjectName) {
        result := ComCall(6, this, "ptr", pmkObjectName, "ptr*", &ppunkObject := 0, "HRESULT")
        return IUnknown(ppunkObject)
    }

    /**
     * Records the time that a running object was last modified. The object must have previously been registered with the running object table (ROT). This method stores the time of last change in the ROT.
     * @param {Integer} dwRegister The identifier of the ROT entry of the changed object. This value was previously returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a>.
     * @param {Pointer<FILETIME>} pfiletime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the object's last change time.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunningobjecttable-notechangetime
     */
    NoteChangeTime(dwRegister, pfiletime) {
        result := ComCall(7, this, "uint", dwRegister, "ptr", pfiletime, "HRESULT")
        return result
    }

    /**
     * Retrieves the time that an object was last modified.
     * @param {IMoniker} pmkObjectName A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker.
     * @returns {FILETIME} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the object's last change time.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunningobjecttable-gettimeoflastchange
     */
    GetTimeOfLastChange(pmkObjectName) {
        pfiletime := FILETIME()
        result := ComCall(8, this, "ptr", pmkObjectName, "ptr", pfiletime, "HRESULT")
        return pfiletime
    }

    /**
     * Creates and returns a pointer to an enumerator that can list the monikers of all the objects currently registered in the running object table (ROT).
     * @returns {IEnumMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienummoniker">IEnumMoniker</a> pointer variable that receives the interface pointer to the new enumerator for the ROT. When successful, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the enumerator; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs; the implementation sets *<i>ppenumMoniker</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunningobjecttable-enumrunning
     */
    EnumRunning() {
        result := ComCall(9, this, "ptr*", &ppenumMoniker := 0, "HRESULT")
        return IEnumMoniker(ppenumMoniker)
    }
}
