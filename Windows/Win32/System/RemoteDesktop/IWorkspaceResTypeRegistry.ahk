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
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {BSTR} bstrFileExtension 
     * @param {BSTR} bstrLauncher 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-addresourcetype
     */
    AddResourceType(fMachineWide, bstrFileExtension, bstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension
        bstrLauncher := bstrLauncher is String ? BSTR.Alloc(bstrLauncher).Value : bstrLauncher

        result := ComCall(7, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", bstrLauncher, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {BSTR} bstrFileExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-deleteresourcetype
     */
    DeleteResourceType(fMachineWide, bstrFileExtension) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension

        result := ComCall(8, this, "short", fMachineWide, "ptr", bstrFileExtension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-getregisteredfileextensions
     */
    GetRegisteredFileExtensions(fMachineWide) {
        result := ComCall(9, this, "short", fMachineWide, "ptr*", &psaFileExtensions := 0, "HRESULT")
        return psaFileExtensions
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {BSTR} bstrFileExtension 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-getresourcetypeinfo
     */
    GetResourceTypeInfo(fMachineWide, bstrFileExtension) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension

        pbstrLauncher := BSTR()
        result := ComCall(10, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", pbstrLauncher, "HRESULT")
        return pbstrLauncher
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {BSTR} bstrFileExtension 
     * @param {BSTR} bstrLauncher 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-modifyresourcetype
     */
    ModifyResourceType(fMachineWide, bstrFileExtension, bstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension
        bstrLauncher := bstrLauncher is String ? BSTR.Alloc(bstrLauncher).Value : bstrLauncher

        result := ComCall(11, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", bstrLauncher, "HRESULT")
        return result
    }
}
