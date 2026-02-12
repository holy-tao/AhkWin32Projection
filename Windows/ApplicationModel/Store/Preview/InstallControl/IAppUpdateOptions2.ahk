#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppUpdateOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppUpdateOptions2
     * @type {Guid}
     */
    static IID => Guid("{f4646e08-ed26-4bf9-9679-48f628e53df8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutomaticallyDownloadAndInstallUpdateIfFound", "put_AutomaticallyDownloadAndInstallUpdateIfFound"]

    /**
     * @type {Boolean} 
     */
    AutomaticallyDownloadAndInstallUpdateIfFound {
        get => this.get_AutomaticallyDownloadAndInstallUpdateIfFound()
        set => this.put_AutomaticallyDownloadAndInstallUpdateIfFound(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticallyDownloadAndInstallUpdateIfFound() {
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
    put_AutomaticallyDownloadAndInstallUpdateIfFound(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
