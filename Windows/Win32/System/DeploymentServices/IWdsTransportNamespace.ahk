#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a namespace on a WDS transport server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespace
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportNamespace extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportNamespace
     * @type {Guid}
     */
    static IID => Guid("{fa561f57-fbef-4ed3-b056-127cb1b33b84}")

    /**
     * The class identifier for WdsTransportNamespace
     * @type {Guid}
     */
    static CLSID => Guid("{d8385768-0732-4ec1-95ea-16da581908a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Id", "get_Name", "put_Name", "get_FriendlyName", "put_FriendlyName", "get_Description", "put_Description", "get_ContentProvider", "put_ContentProvider", "get_Configuration", "put_Configuration", "get_Registered", "get_Tombstoned", "get_TombstoneTime", "get_TransmissionStarted", "Register", "Deregister", "Clone", "Refresh", "RetrieveContents"]

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_type
     */
    get_Type(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_id
     */
    get_Id(pulId) {
        pulIdMarshal := pulId is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulIdMarshal, pulId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_name
     */
    get_Name(pbszName) {
        result := ComCall(9, this, "ptr", pbszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_name
     */
    put_Name(bszName) {
        bszName := bszName is String ? BSTR.Alloc(bszName).Value : bszName

        result := ComCall(10, this, "ptr", bszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_friendlyname
     */
    get_FriendlyName(pbszFriendlyName) {
        result := ComCall(11, this, "ptr", pbszFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_friendlyname
     */
    put_FriendlyName(bszFriendlyName) {
        bszFriendlyName := bszFriendlyName is String ? BSTR.Alloc(bszFriendlyName).Value : bszFriendlyName

        result := ComCall(12, this, "ptr", bszFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_description
     */
    get_Description(pbszDescription) {
        result := ComCall(13, this, "ptr", pbszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_description
     */
    put_Description(bszDescription) {
        bszDescription := bszDescription is String ? BSTR.Alloc(bszDescription).Value : bszDescription

        result := ComCall(14, this, "ptr", bszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszContentProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_contentprovider
     */
    get_ContentProvider(pbszContentProvider) {
        result := ComCall(15, this, "ptr", pbszContentProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszContentProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_contentprovider
     */
    put_ContentProvider(bszContentProvider) {
        bszContentProvider := bszContentProvider is String ? BSTR.Alloc(bszContentProvider).Value : bszContentProvider

        result := ComCall(16, this, "ptr", bszContentProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszConfiguration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_configuration
     */
    get_Configuration(pbszConfiguration) {
        result := ComCall(17, this, "ptr", pbszConfiguration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszConfiguration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_configuration
     */
    put_Configuration(bszConfiguration) {
        bszConfiguration := bszConfiguration is String ? BSTR.Alloc(bszConfiguration).Value : bszConfiguration

        result := ComCall(18, this, "ptr", bszConfiguration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRegistered 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_registered
     */
    get_Registered(pbRegistered) {
        result := ComCall(19, this, "ptr", pbRegistered, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbTombstoned 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_tombstoned
     */
    get_Tombstoned(pbTombstoned) {
        result := ComCall(20, this, "ptr", pbTombstoned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pTombstoneTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_tombstonetime
     */
    get_TombstoneTime(pTombstoneTime) {
        pTombstoneTimeMarshal := pTombstoneTime is VarRef ? "double*" : "ptr"

        result := ComCall(21, this, pTombstoneTimeMarshal, pTombstoneTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbTransmissionStarted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_transmissionstarted
     */
    get_TransmissionStarted(pbTransmissionStarted) {
        result := ComCall(22, this, "ptr", pbTransmissionStarted, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-register
     */
    Register() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bTerminateSessions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-deregister
     */
    Deregister(bTerminateSessions) {
        result := ComCall(24, this, "short", bTerminateSessions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportNamespace>} ppWdsTransportNamespaceClone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-clone
     */
    Clone(ppWdsTransportNamespaceClone) {
        result := ComCall(25, this, "ptr*", ppWdsTransportNamespaceClone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-refresh
     */
    Refresh() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportCollection>} ppWdsTransportContents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-retrievecontents
     */
    RetrieveContents(ppWdsTransportContents) {
        result := ComCall(27, this, "ptr*", ppWdsTransportContents, "HRESULT")
        return result
    }
}
