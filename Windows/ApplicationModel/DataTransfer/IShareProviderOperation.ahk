#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataPackageView.ahk
#Include .\ShareProvider.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IShareProviderOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareProviderOperation
     * @type {Guid}
     */
    static IID => Guid("{19cef937-d435-4179-b6af-14e0492b69f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data", "get_Provider", "ReportCompleted"]

    /**
     * @type {DataPackageView} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * @type {ShareProvider} 
     */
    Provider {
        get => this.get_Provider()
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_Data() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackageView(value)
    }

    /**
     * 
     * @returns {ShareProvider} 
     */
    get_Provider() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ShareProvider(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReportCompleted() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
