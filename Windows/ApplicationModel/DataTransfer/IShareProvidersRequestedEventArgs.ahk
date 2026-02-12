#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\ShareProvider.ahk
#Include .\DataPackageView.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IShareProvidersRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareProvidersRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{f888f356-a3f8-4fce-85e4-8826e63be799}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Providers", "get_Data", "GetDeferral"]

    /**
     * @type {IVector<ShareProvider>} 
     */
    Providers {
        get => this.get_Providers()
    }

    /**
     * @type {DataPackageView} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * 
     * @returns {IVector<ShareProvider>} 
     */
    get_Providers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ShareProvider, value)
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_Data() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackageView(value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
