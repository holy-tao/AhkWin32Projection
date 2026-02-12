#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStorePackageInstallOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePackageInstallOptions
     * @type {Guid}
     */
    static IID => Guid("{1d3d630c-0ccd-44dd-8c59-80810a729973}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowForcedAppRestart", "put_AllowForcedAppRestart"]

    /**
     * @type {Boolean} 
     */
    AllowForcedAppRestart {
        get => this.get_AllowForcedAppRestart()
        set => this.put_AllowForcedAppRestart(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowForcedAppRestart() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowForcedAppRestart(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
