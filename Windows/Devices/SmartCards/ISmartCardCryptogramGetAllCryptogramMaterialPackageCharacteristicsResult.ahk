#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\SmartCardCryptogramMaterialPackageCharacteristics.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult
     * @type {Guid}
     */
    static IID => Guid("{4e6a8a5c-9773-46c4-a32f-b1e543159e04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OperationStatus", "get_Characteristics"]

    /**
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * @type {IVectorView<SmartCardCryptogramMaterialPackageCharacteristics>} 
     */
    Characteristics {
        get => this.get_Characteristics()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OperationStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<SmartCardCryptogramMaterialPackageCharacteristics>} 
     */
    get_Characteristics() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SmartCardCryptogramMaterialPackageCharacteristics, value)
    }
}
