#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironmentOwnerRegistrationData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironmentOwnerRegistrationData
     * @type {Guid}
     */
    static IID => Guid("{f888ec22-e8cf-56c0-b1df-90af4ad80e84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShareableFolders", "get_ProcessesRunnableAsSystem", "get_ProcessesRunnableAsUser", "get_ActivationFileExtensions"]

    /**
     * @type {IVector<HSTRING>} 
     */
    ShareableFolders {
        get => this.get_ShareableFolders()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    ProcessesRunnableAsSystem {
        get => this.get_ProcessesRunnableAsSystem()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    ProcessesRunnableAsUser {
        get => this.get_ProcessesRunnableAsUser()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    ActivationFileExtensions {
        get => this.get_ActivationFileExtensions()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ShareableFolders() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ProcessesRunnableAsSystem() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ProcessesRunnableAsUser() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ActivationFileExtensions() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
