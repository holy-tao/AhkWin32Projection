#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IADsServiceOperations.ahk" { IADsServiceOperations }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADsCollection.ahk" { IADsCollection }

/**
 * The IADsFileServiceOperations interface is a dual interface that inherits from IADsServiceOperations.
 * @remarks
 * To bind to a file service operations object, use the ADsPath string that identifies the "LanmanServer" service on the host computer, as shown in the following code example.
 * 
 * 
 * ```vb
 * Dim fso As IADsFileServiceOperations
 * On Error Resume Next
 * 
 * ' Replace aDomain with the domain that the computer is located on.
 * ' Replace aComputer with the name of the computer.
 * Set fso = GetObject("WinNT://aDomain/aComputer/LanmanServer")
 * ```
 * 
 * 
 * From this point, you can handle the file service object as just a service object, applying any of the methods of <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsserviceoperations">IADsServiceOperations</a> to the file service object. For example, you can examine the operational status of the file service, start or stop the file service, or change its password.
 * 
 * However, the <b>IADsFileServiceOperations</b> interface allows you to work with open resources and active sessions of the file service. See the following example.
 * 
 * 
 * ```vb
 * For Each r in fso.Resources
 * MsgBox r.User
 * MsgBox r.Path
 * MsgBox r.LockCount
 * Next
 * ```
 * 
 * 
 * For more information about active sessions and open resources, see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssession">IADsSession</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsresource">IADsResource</a>.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsfileserviceoperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsFileServiceOperations extends IADsServiceOperations {
    /**
     * The interface identifier for IADsFileServiceOperations
     * @type {Guid}
     */
    static IID := Guid("{a02ded10-31ca-11cf-a98a-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsFileServiceOperations interfaces
    */
    struct Vtbl extends IADsServiceOperations.Vtbl {
        Sessions  : IntPtr
        Resources : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsFileServiceOperations.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IADsFileServiceOperations::Sessions method gets a pointer to a pointer to the IADsCollection interface on a collection of the session objects that represent the current open sessions for this file service.
     * @remarks
     * Traditional directory services supply data only about directory service elements represented in the underlying data store. Data about sessions for file services may not be available from the underlying store.
     * @returns {IADsCollection} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscollection">IADsCollection</a> interface used to enumerate objects that implement the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssession">IADsSession</a> interface and represent the current open sessions for this file service.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsfileserviceoperations-sessions
     */
    Sessions() {
        result := ComCall(26, this, "ptr*", &ppSessions := 0, "HRESULT")
        return IADsCollection(ppSessions)
    }

    /**
     * The IADsFileServiceOperations::Resources method gets a pointer to a pointer to the IADsCollection interface on a collection of the resource objects representing the current open resources on this file service.
     * @remarks
     * Traditional directory services supply data only about directory service elements  represented in the underlying data store. Data about resources for file services may not be available from the underlying directory store.
     * @returns {IADsCollection} Pointer to a  pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscollection">IADsCollection</a> interface that can then be used to enumerate objects implementing the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsresource">IADsResource</a> interface and representing the current open resources for this file service.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsfileserviceoperations-resources
     */
    Resources() {
        result := ComCall(27, this, "ptr*", &ppResources := 0, "HRESULT")
        return IADsCollection(ppResources)
    }

    Query(iid) {
        if (IADsFileServiceOperations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Sessions := CallbackCreate(GetMethod(implObj, "Sessions"), flags, 2)
        this.vtbl.Resources := CallbackCreate(GetMethod(implObj, "Resources"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Sessions)
        CallbackFree(this.vtbl.Resources)
    }
}
