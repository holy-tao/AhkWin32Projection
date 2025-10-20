#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Installs or uninstalls updates from or onto a computer.
 * @remarks
 * 
  * This interface can be instantiated by using the UpdateInstaller coclass. Use the Microsoft.Update.Installer program identifier to create the object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateinstaller
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateInstaller extends IDispatch{
    /**
     * The interface identifier for IUpdateInstaller
     * @type {Guid}
     */
    static IID => Guid("{7b929c68-ccdc-4226-96b1-8724600b54c2}")

    /**
     * The class identifier for UpdateInstaller
     * @type {Guid}
     */
    static CLSID => Guid("{d2e0fe7f-d23e-48e1-93c0-6fa8cc346474}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ClientApplicationID(retval) {
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IsForced(retval) {
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_IsForced(value) {
        result := ComCall(10, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} retval 
     * @returns {HRESULT} 
     */
    get_ParentHwnd(retval) {
        result := ComCall(11, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} value 
     * @returns {HRESULT} 
     */
    put_ParentHwnd(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    put_ParentWindow(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get_ParentWindow(retval) {
        result := ComCall(14, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateCollection>} retval 
     * @returns {HRESULT} 
     */
    get_Updates(retval) {
        result := ComCall(15, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateCollection>} value 
     * @returns {HRESULT} 
     */
    put_Updates(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} onProgressChanged 
     * @param {Pointer<IUnknown>} onCompleted 
     * @param {VARIANT} state 
     * @param {Pointer<IInstallationJob>} retval 
     * @returns {HRESULT} 
     */
    BeginInstall(onProgressChanged, onCompleted, state, retval) {
        result := ComCall(17, this, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} onProgressChanged 
     * @param {Pointer<IUnknown>} onCompleted 
     * @param {VARIANT} state 
     * @param {Pointer<IInstallationJob>} retval 
     * @returns {HRESULT} 
     */
    BeginUninstall(onProgressChanged, onCompleted, state, retval) {
        result := ComCall(18, this, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInstallationJob>} value 
     * @param {Pointer<IInstallationResult>} retval 
     * @returns {HRESULT} 
     */
    EndInstall(value, retval) {
        result := ComCall(19, this, "ptr", value, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInstallationJob>} value 
     * @param {Pointer<IInstallationResult>} retval 
     * @returns {HRESULT} 
     */
    EndUninstall(value, retval) {
        result := ComCall(20, this, "ptr", value, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInstallationResult>} retval 
     * @returns {HRESULT} 
     */
    Install(retval) {
        result := ComCall(21, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} dialogTitle 
     * @param {Pointer<IInstallationResult>} retval 
     * @returns {HRESULT} 
     */
    RunWizard(dialogTitle, retval) {
        dialogTitle := dialogTitle is String ? BSTR.Alloc(dialogTitle).Value : dialogTitle

        result := ComCall(22, this, "ptr", dialogTitle, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IsBusy(retval) {
        result := ComCall(23, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInstallationResult>} retval 
     * @returns {HRESULT} 
     */
    Uninstall(retval) {
        result := ComCall(24, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_AllowSourcePrompts(retval) {
        result := ComCall(25, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_AllowSourcePrompts(value) {
        result := ComCall(26, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_RebootRequiredBeforeInstallation(retval) {
        result := ComCall(27, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
