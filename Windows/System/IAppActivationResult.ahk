#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\AppResourceGroupInfo.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppActivationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppActivationResult
     * @type {Guid}
     */
    static IID => Guid("{6b528900-f46e-4eb0-aa6c-38af557cf9ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedError", "get_AppResourceGroupInfo"]

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * @type {AppResourceGroupInfo} 
     */
    AppResourceGroupInfo {
        get => this.get_AppResourceGroupInfo()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppResourceGroupInfo} 
     */
    get_AppResourceGroupInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppResourceGroupInfo(value)
    }
}
