#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CoreFrameworkInputView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class ICoreFrameworkInputViewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreFrameworkInputViewStatics
     * @type {Guid}
     */
    static IID => Guid("{6eebd9b6-eac2-5f8b-975f-772ee3e42eeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForUIContext", "GetForCurrentView"]

    /**
     * 
     * @param {UIContext} context_ 
     * @returns {CoreFrameworkInputView} 
     */
    GetForUIContext(context_) {
        result := ComCall(6, this, "ptr", context_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreFrameworkInputView(result_)
    }

    /**
     * 
     * @returns {CoreFrameworkInputView} 
     */
    GetForCurrentView() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreFrameworkInputView(result_)
    }
}
