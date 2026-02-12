#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WindowsSoftwareUpdateProvider.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WindowsSoftwareUpdate.ahk
#Include .\WindowsSoftwareUpdateScanResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateManager2
     * @type {Guid}
     */
    static IID => Guid("{564e7683-bd21-57a4-b17f-7bf6350f4c75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProvider", "get_ProviderIds", "GetApplicableSoftwareUpdates", "PerformScan"]

    /**
     */
    ProviderIds {
        get => this.get_ProviderIds()
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {WindowsSoftwareUpdateProvider} 
     */
    GetProvider(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(6, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateProvider(result_)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_ProviderIds(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<WindowsSoftwareUpdate>} 
     */
    GetApplicableSoftwareUpdates() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WindowsSoftwareUpdate, result_)
    }

    /**
     * 
     * @param {WindowsUpdateManagerScanOptions} options 
     * @returns {WindowsSoftwareUpdateScanResult} 
     */
    PerformScan(options) {
        result := ComCall(9, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateScanResult(result_)
    }
}
