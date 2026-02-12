#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CoreInputView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInputViewStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInputViewStatics2
     * @type {Guid}
     */
    static IID => Guid("{7ebc0862-d049-4e52-87b0-1e90e98c49ed}")

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
     * @returns {CoreInputView} 
     */
    GetForUIContext(context_) {
        result := ComCall(6, this, "ptr", context_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreInputView(result_)
    }
}
