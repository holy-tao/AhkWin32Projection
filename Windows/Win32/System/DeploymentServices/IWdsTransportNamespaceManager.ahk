#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWdsTransportNamespace.ahk
#Include .\IWdsTransportCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages namespaces on a WDS transport server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespacemanager
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportNamespaceManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportNamespaceManager
     * @type {Guid}
     */
    static IID => Guid("{3e22d9f6-3777-4d98-83e1-f98696717ba3}")

    /**
     * The class identifier for WdsTransportNamespaceManager
     * @type {Guid}
     */
    static CLSID => Guid("{f08cdb63-85de-4a28-a1a9-5ca3e7efda73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNamespace", "RetrieveNamespace", "RetrieveNamespaces"]

    /**
     * Creates an object of an IWdsTransportNamespace interface that can be registered on the current WDS transport server.
     * @param {Integer} NamespaceType The type of the new namespace object. This can be one of the namespace types listed by the <a href="https://docs.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_namespace_type">WDSTRANSPORT_NAMESPACE_TYPE</a> enumeration.
     * @param {BSTR} bszNamespaceName The name of the new namespace object. If an application attempts to register this namespace with a WDS transport server, WDS confirms that the name is unique.
     * @param {BSTR} bszContentProvider The name of  the content provider to be associated with the new namespace object.
     * @param {BSTR} bszConfiguration The configuration information used by the content provider. The format of this information is defined by the content provider. The value can be an empty string if no parameter is required.
     * @returns {IWdsTransportNamespace} A pointer to the object of an <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespace">IWdsTransportNamespace</a> interface created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacemanager-createnamespace
     */
    CreateNamespace(NamespaceType, bszNamespaceName, bszContentProvider, bszConfiguration) {
        bszNamespaceName := bszNamespaceName is String ? BSTR.Alloc(bszNamespaceName).Value : bszNamespaceName
        bszContentProvider := bszContentProvider is String ? BSTR.Alloc(bszContentProvider).Value : bszContentProvider
        bszConfiguration := bszConfiguration is String ? BSTR.Alloc(bszConfiguration).Value : bszConfiguration

        result := ComCall(7, this, "int", NamespaceType, "ptr", bszNamespaceName, "ptr", bszContentProvider, "ptr", bszConfiguration, "ptr*", &ppWdsTransportNamespace := 0, "HRESULT")
        return IWdsTransportNamespace(ppWdsTransportNamespace)
    }

    /**
     * Retrieves, by name, an object of an IWdsTransportNamespace interface. The name should be registered with the namespace on the WDS transport server.
     * @param {BSTR} bszNamespaceName The name of the namespace for which an object is being returned.  The namespace should be registered with the WDS transport server.
     * @returns {IWdsTransportNamespace} A pointer to the object of an <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespace">IWdsTransportNamespace</a> interface that matches the specified name.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacemanager-retrievenamespace
     */
    RetrieveNamespace(bszNamespaceName) {
        bszNamespaceName := bszNamespaceName is String ? BSTR.Alloc(bszNamespaceName).Value : bszNamespaceName

        result := ComCall(8, this, "ptr", bszNamespaceName, "ptr*", &ppWdsTransportNamespace := 0, "HRESULT")
        return IWdsTransportNamespace(ppWdsTransportNamespace)
    }

    /**
     * Returns a collection of objects of the IWdsTransportNamespace interface that represent namespaces on the server that match specified criteria.
     * @param {BSTR} bszContentProvider The name of the content provider for which namespaces are to be returned. If an empty string is specified, the method returns the namespaces for all content providers.
     * @param {BSTR} bszNamespaceName The name of the namespace for which instances are to be returned. If an empty string is specified, the method returns all namespaces for the selected content providers.
     * @param {VARIANT_BOOL} bIncludeTombstones A value of true specifies that the method should include in the results any namespaces that have been deregistered while still having active sessions on the server. This enables an application to register another namespace with the name.
     * @returns {IWdsTransportCollection} A pointer to the object of an <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcollection">IWdsTransportCollection</a> interface.  This represents  a collection  of objects of an <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespace">IWdsTransportNamespace</a> interface that match the specified criteria.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacemanager-retrievenamespaces
     */
    RetrieveNamespaces(bszContentProvider, bszNamespaceName, bIncludeTombstones) {
        bszContentProvider := bszContentProvider is String ? BSTR.Alloc(bszContentProvider).Value : bszContentProvider
        bszNamespaceName := bszNamespaceName is String ? BSTR.Alloc(bszNamespaceName).Value : bszNamespaceName

        result := ComCall(9, this, "ptr", bszContentProvider, "ptr", bszNamespaceName, "short", bIncludeTombstones, "ptr*", &ppWdsTransportNamespaces := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportNamespaces)
    }
}
