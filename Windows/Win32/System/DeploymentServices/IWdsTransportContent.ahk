#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportNamespace.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWdsTransportCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents content being transmitted under a namespace over one or more sessions.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportcontent
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportContent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportContent
     * @type {Guid}
     */
    static IID => Guid("{d405d711-0296-4ab4-a860-ac7d32e65798}")

    /**
     * The class identifier for WdsTransportContent
     * @type {Guid}
     */
    static CLSID => Guid("{0a891fe7-4a3f-4c65-b6f2-1467619679ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Namespace", "get_Id", "get_Name", "RetrieveSessions", "Terminate"]

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
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-get_namespace
     */
    get_Namespace() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportNamespace := 0, "HRESULT")
        return IWdsTransportNamespace(ppWdsTransportNamespace)
    }

    /**
     * Receives a unique content ID that identifies this content object on the server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * Receives a pointer to a string value that contains the name of the data object represented by this content object.
     * @remarks
     * 
     * The format of the object name returned is defined by the content provider and its associated management applications.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-get_name
     */
    get_Name() {
        pbszName := BSTR()
        result := ComCall(9, this, "ptr", pbszName, "HRESULT")
        return pbszName
    }

    /**
     * Retrieves a collection of active transport sessions associated with this content.
     * @returns {IWdsTransportCollection} A pointer to a collection of objects of the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportsession">IWdsTransportSession</a> interface that represent active sessions under this content.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-retrievesessions
     */
    RetrieveSessions() {
        result := ComCall(10, this, "ptr*", &ppWdsTransportSessions := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportSessions)
    }

    /**
     * Terminates the transmission of this content by terminating all active sessions under the content and disconnecting any clients that are joined to them.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportcontent-terminate
     */
    Terminate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
