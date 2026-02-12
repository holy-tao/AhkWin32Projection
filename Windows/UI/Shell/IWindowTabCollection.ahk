#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IWindowTabCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowTabCollection
     * @type {Guid}
     */
    static IID => Guid("{accd0d6c-ed07-519a-8c33-17e02e7e9b0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveTab"]

    /**
     * 
     * @param {WindowTab} tab 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    MoveTab(tab, index) {
        result := ComCall(6, this, "ptr", tab, "uint", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
