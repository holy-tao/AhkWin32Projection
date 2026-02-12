#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimPolicy extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimPolicy
     * @type {Guid}
     */
    static IID => Guid("{41e1b99d-cf7e-4315-882b-6f1e74b0d38f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShouldEnableManagingUi"]

    /**
     * @type {Boolean} 
     */
    ShouldEnableManagingUi {
        get => this.get_ShouldEnableManagingUi()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldEnableManagingUi() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
