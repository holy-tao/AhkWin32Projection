#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallItem4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallItem4
     * @type {Guid}
     */
    static IID => Guid("{c2d1ce12-71ff-4fc8-b540-453d4b37e1d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LaunchAfterInstall", "put_LaunchAfterInstall"]

    /**
     * @type {Boolean} 
     */
    LaunchAfterInstall {
        get => this.get_LaunchAfterInstall()
        set => this.put_LaunchAfterInstall(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LaunchAfterInstall() {
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
    put_LaunchAfterInstall(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
