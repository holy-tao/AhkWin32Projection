#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowFrameStyle extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowFrameStyle
     * @type {Guid}
     */
    static IID => Guid("{ac412946-e1ac-5230-944a-c60873dcf4a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrameStyle", "SetFrameStyle"]

    /**
     * 
     * @returns {Integer} 
     */
    GetFrameStyle() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} frameStyle 
     * @returns {HRESULT} 
     */
    SetFrameStyle(frameStyle) {
        result := ComCall(7, this, "int", frameStyle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
