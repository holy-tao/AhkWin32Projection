#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\AppInstallerInfo.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\PackageUpdateAvailabilityResult.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackage6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackage6
     * @type {Guid}
     */
    static IID => Guid("{8b1ad942-12d7-4754-ae4e-638cbc0e3a2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppInstallerInfo", "CheckUpdateAvailabilityAsync"]

    /**
     * 
     * @returns {AppInstallerInfo} 
     */
    GetAppInstallerInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInstallerInfo(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<PackageUpdateAvailabilityResult>} 
     */
    CheckUpdateAvailabilityAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PackageUpdateAvailabilityResult, operation)
    }
}
