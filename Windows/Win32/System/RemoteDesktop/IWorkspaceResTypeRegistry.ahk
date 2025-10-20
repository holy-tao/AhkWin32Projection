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
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {BSTR} bstrFileExtension 
     * @param {BSTR} bstrLauncher 
     * @returns {HRESULT} 
     */
    AddResourceType(fMachineWide, bstrFileExtension, bstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension
        bstrLauncher := bstrLauncher is String ? BSTR.Alloc(bstrLauncher).Value : bstrLauncher

        result := ComCall(7, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", bstrLauncher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {BSTR} bstrFileExtension 
     * @returns {HRESULT} 
     */
    DeleteResourceType(fMachineWide, bstrFileExtension) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension

        result := ComCall(8, this, "short", fMachineWide, "ptr", bstrFileExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {Pointer<SAFEARRAY>} psaFileExtensions 
     * @returns {HRESULT} 
     */
    GetRegisteredFileExtensions(fMachineWide, psaFileExtensions) {
        result := ComCall(9, this, "short", fMachineWide, "ptr", psaFileExtensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {BSTR} bstrFileExtension 
     * @param {Pointer<BSTR>} pbstrLauncher 
     * @returns {HRESULT} 
     */
    GetResourceTypeInfo(fMachineWide, bstrFileExtension, pbstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension

        result := ComCall(10, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", pbstrLauncher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMachineWide 
     * @param {BSTR} bstrFileExtension 
     * @param {BSTR} bstrLauncher 
     * @returns {HRESULT} 
     */
    ModifyResourceType(fMachineWide, bstrFileExtension, bstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension
        bstrLauncher := bstrLauncher is String ? BSTR.Alloc(bstrLauncher).Value : bstrLauncher

        result := ComCall(11, this, "short", fMachineWide, "ptr", bstrFileExtension, "ptr", bstrLauncher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
