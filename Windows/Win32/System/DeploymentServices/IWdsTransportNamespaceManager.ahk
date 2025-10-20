#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Integer} NamespaceType 
     * @param {BSTR} bszNamespaceName 
     * @param {BSTR} bszContentProvider 
     * @param {BSTR} bszConfiguration 
     * @param {Pointer<IWdsTransportNamespace>} ppWdsTransportNamespace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacemanager-createnamespace
     */
    CreateNamespace(NamespaceType, bszNamespaceName, bszContentProvider, bszConfiguration, ppWdsTransportNamespace) {
        bszNamespaceName := bszNamespaceName is String ? BSTR.Alloc(bszNamespaceName).Value : bszNamespaceName
        bszContentProvider := bszContentProvider is String ? BSTR.Alloc(bszContentProvider).Value : bszContentProvider
        bszConfiguration := bszConfiguration is String ? BSTR.Alloc(bszConfiguration).Value : bszConfiguration

        result := ComCall(7, this, "int", NamespaceType, "ptr", bszNamespaceName, "ptr", bszContentProvider, "ptr", bszConfiguration, "ptr*", ppWdsTransportNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszNamespaceName 
     * @param {Pointer<IWdsTransportNamespace>} ppWdsTransportNamespace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacemanager-retrievenamespace
     */
    RetrieveNamespace(bszNamespaceName, ppWdsTransportNamespace) {
        bszNamespaceName := bszNamespaceName is String ? BSTR.Alloc(bszNamespaceName).Value : bszNamespaceName

        result := ComCall(8, this, "ptr", bszNamespaceName, "ptr*", ppWdsTransportNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszContentProvider 
     * @param {BSTR} bszNamespaceName 
     * @param {VARIANT_BOOL} bIncludeTombstones 
     * @param {Pointer<IWdsTransportCollection>} ppWdsTransportNamespaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacemanager-retrievenamespaces
     */
    RetrieveNamespaces(bszContentProvider, bszNamespaceName, bIncludeTombstones, ppWdsTransportNamespaces) {
        bszContentProvider := bszContentProvider is String ? BSTR.Alloc(bszContentProvider).Value : bszContentProvider
        bszNamespaceName := bszNamespaceName is String ? BSTR.Alloc(bszNamespaceName).Value : bszNamespaceName

        result := ComCall(9, this, "ptr", bszContentProvider, "ptr", bszNamespaceName, "short", bIncludeTombstones, "ptr*", ppWdsTransportNamespaces, "HRESULT")
        return result
    }
}
