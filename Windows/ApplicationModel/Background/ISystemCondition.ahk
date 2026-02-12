#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ISystemCondition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemCondition
     * @type {Guid}
     */
    static IID => Guid("{c15fb476-89c5-420b-abd3-fb3030472128}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConditionType"]

    /**
     * @type {Integer} 
     */
    ConditionType {
        get => this.get_ConditionType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConditionType() {
        result := ComCall(6, this, "int*", &conditionType_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return conditionType_
    }
}
