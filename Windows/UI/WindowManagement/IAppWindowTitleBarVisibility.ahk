#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowTitleBarVisibility extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowTitleBarVisibility
     * @type {Guid}
     */
    static IID => Guid("{a215a4e3-6e7e-5651-8c3b-624819528154}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreferredVisibility", "SetPreferredVisibility"]

    /**
     * 
     * @returns {Integer} 
     */
    GetPreferredVisibility() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} visibilityMode 
     * @returns {HRESULT} 
     */
    SetPreferredVisibility(visibilityMode) {
        result := ComCall(7, this, "int", visibilityMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
