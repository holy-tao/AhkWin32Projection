#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\InputPane.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IInputPaneStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPaneStatics2
     * @type {Guid}
     */
    static IID => Guid("{1b63529b-d9ec-4531-8445-71bab9fb828e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForUIContext"]

    /**
     * 
     * @param {UIContext} context_ 
     * @returns {InputPane} 
     */
    GetForUIContext(context_) {
        result := ComCall(6, this, "ptr", context_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InputPane(result_)
    }
}
