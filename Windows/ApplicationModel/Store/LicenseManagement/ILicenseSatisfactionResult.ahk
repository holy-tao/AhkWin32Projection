#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\LicenseSatisfactionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.LicenseManagement
 * @version WindowsRuntime 1.4
 */
class ILicenseSatisfactionResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILicenseSatisfactionResult
     * @type {Guid}
     */
    static IID => Guid("{3c674f73-3c87-4ee1-8201-f428359bd3af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LicenseSatisfactionInfos", "get_ExtendedError"]

    /**
     * @type {IMapView<HSTRING, LicenseSatisfactionInfo>} 
     */
    LicenseSatisfactionInfos {
        get => this.get_LicenseSatisfactionInfos()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, LicenseSatisfactionInfo>} 
     */
    get_LicenseSatisfactionInfos() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), LicenseSatisfactionInfo, value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
