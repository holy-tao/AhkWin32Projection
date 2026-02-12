#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.UIAutomation
 * @version WindowsRuntime 1.4
 */
class IAutomationConnection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationConnection
     * @type {Guid}
     */
    static IID => Guid("{aad262ed-0ef4-5d43-97be-a834e27b65b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRemoteSystem", "get_AppUserModelId", "get_ExecutableFileName"]

    /**
     * @type {Boolean} 
     */
    IsRemoteSystem {
        get => this.get_IsRemoteSystem()
    }

    /**
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * @type {HSTRING} 
     */
    ExecutableFileName {
        get => this.get_ExecutableFileName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRemoteSystem() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExecutableFileName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
