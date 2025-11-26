#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Exposes methods that allow a plug-in to manage third-party file name extensions in RemoteApp and Desktop Connection runtime.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceax/nn-workspaceax-iworkspacerestyperegistry
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceResTypeRegistry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceResTypeRegistry
     * @type {Guid}
     */
    static IID => Guid("{1d428c79-6e2e-4351-a361-c0401a03a0ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddResourceType", "DeleteResourceType", "GetRegisteredFileExtensions", "GetResourceTypeInfo", "ModifyResourceType"]

    /**
     * Registers a third-party file name extension with the RemoteApp and Desktop Connections runtime.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is to be registered per user or per machine.
     * @param {BSTR} bstrFileExtension A string that contains the file name extension to register. The period must be included in the extension, for example, ".txt".
     * @param {BSTR} bstrLauncher A string that contains the fully qualified path and file name of the application to use to launch files with the extension specified by the <i>bstrFileExtension</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceax/nf-workspaceax-iworkspacerestyperegistry-addresourcetype
     */
    AddResourceType(fMachineWide, bstrFileExtension, bstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension
        bstrLauncher := bstrLauncher is String ? BSTR.Alloc(bstrLauncher).Value : bstrLauncher

        result := ComCall(7, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", bstrLauncher, "HRESULT")
        return result
    }

    /**
     * Unregisters a third-party file name extension with the RemoteApp and Desktop Connections runtime.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is registered per user or per machine.
     * @param {BSTR} bstrFileExtension A string that contains the file name extension to unregister. The period must be included in the extension, 
     *    for example, ".txt".
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceax/nf-workspaceax-iworkspacerestyperegistry-deleteresourcetype
     */
    DeleteResourceType(fMachineWide, bstrFileExtension) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension

        result := ComCall(8, this, "short", fMachineWide, "ptr", bstrFileExtension, "HRESULT")
        return result
    }

    /**
     * Retrieves the third-party file name extensions that are registered with the RemoteApp and Desktop Connections runtime.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is registered per user or per machine.
     * @returns {Pointer<SAFEARRAY>} The address of a pointer to a <b>SAFEARRAY</b> variable that receives an array of <b>BSTR</b>s that contain the registered file name extensions.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceax/nf-workspaceax-iworkspacerestyperegistry-getregisteredfileextensions
     */
    GetRegisteredFileExtensions(fMachineWide) {
        result := ComCall(9, this, "short", fMachineWide, "ptr*", &psaFileExtensions := 0, "HRESULT")
        return psaFileExtensions
    }

    /**
     * Retrieves information about a third-party file name extension that is registered with the RemoteApp and Desktop Connections runtime.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is registered per user or per machine.
     * @param {BSTR} bstrFileExtension A string that contains the file name extension to retrieve the information for. The period must be included in the extension, for example, ".txt".
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable that receives the fully qualified path and file name of the application to use to launch files with the extension specified by the <i>bstrFileExtension</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceax/nf-workspaceax-iworkspacerestyperegistry-getresourcetypeinfo
     */
    GetResourceTypeInfo(fMachineWide, bstrFileExtension) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension

        pbstrLauncher := BSTR()
        result := ComCall(10, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", pbstrLauncher, "HRESULT")
        return pbstrLauncher
    }

    /**
     * Modifies a third-party file name extension that is registered with the RemoteApp and Desktop Connections runtime.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is registered per user or per machine.
     * @param {BSTR} bstrFileExtension A string that contains the file name extension to update. The period must be included in the extension, for example, ".txt".
     * @param {BSTR} bstrLauncher A string that contains the new fully qualified path and file name of the application to use to launch files with the extension specified by the <i>bstrFileExtension</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceax/nf-workspaceax-iworkspacerestyperegistry-modifyresourcetype
     */
    ModifyResourceType(fMachineWide, bstrFileExtension, bstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension
        bstrLauncher := bstrLauncher is String ? BSTR.Alloc(bstrLauncher).Value : bstrLauncher

        result := ComCall(11, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", bstrLauncher, "HRESULT")
        return result
    }
}
