#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class IPowerThermalChannelDataReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPowerThermalChannelDataReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d6b643e0-6ab6-5683-a8fc-5ed65ee20dc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData"]

    /**
     * GetDataProviderDSO Method
     * @remarks
     * This method does not addref the interface pointer. If the caller plans to hold the pointer, the caller must do the required addref and release.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getdataproviderdso-method
     */
    GetData(result_) {
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
