#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWdsTransportNamespace.ahk" { IWdsTransportNamespace }
#Import ".\IWdsTransportCollection.ahk" { IWdsTransportCollection }

/**
 * Represents content being transmitted under a namespace over one or more sessions.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcontent
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportContent extends IDispatch {
    /**
     * The interface identifier for IWdsTransportContent
     * @type {Guid}
     */
    static IID := Guid("{d405d711-0296-4ab4-a860-ac7d32e65798}")

    /**
     * The class identifier for WdsTransportContent
     * @type {Guid}
     */
    static CLSID := Guid("{0a891fe7-4a3f-4c65-b6f2-1467619679ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportContent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Namespace    : IntPtr
        get_Id           : IntPtr
        get_Name         : IntPtr
        RetrieveSessions : IntPtr
        Terminate        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportContent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWdsTransportNamespace} 
     */
    Namespace {
        get => this.get_Namespace()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Receives a pointer to an object of an IWdsTransportNamespace interface that represents the namespace associated with this content.
     * @returns {IWdsTransportNamespace} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-get_namespace
     */
    get_Namespace() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportNamespace := 0, "HRESULT")
        return IWdsTransportNamespace(ppWdsTransportNamespace)
    }

    /**
     * Receives a unique content ID that identifies this content object on the server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * Receives a pointer to a string value that contains the name of the data object represented by this content object.
     * @remarks
     * The format of the object name returned is defined by the content provider and its associated management applications.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-get_name
     */
    get_Name() {
        pbszName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbszName, "HRESULT")
        return pbszName
    }

    /**
     * Retrieves a collection of active transport sessions associated with this content.
     * @returns {IWdsTransportCollection} A pointer to a collection of objects of the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportsession">IWdsTransportSession</a> interface that represent active sessions under this content.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-retrievesessions
     */
    RetrieveSessions() {
        result := ComCall(10, this, "ptr*", &ppWdsTransportSessions := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportSessions)
    }

    /**
     * Terminates the transmission of this content by terminating all active sessions under the content and disconnecting any clients that are joined to them.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-terminate
     */
    Terminate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportContent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Namespace := CallbackCreate(GetMethod(implObj, "get_Namespace"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.RetrieveSessions := CallbackCreate(GetMethod(implObj, "RetrieveSessions"), flags, 2)
        this.vtbl.Terminate := CallbackCreate(GetMethod(implObj, "Terminate"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Namespace)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.RetrieveSessions)
        CallbackFree(this.vtbl.Terminate)
    }
}
