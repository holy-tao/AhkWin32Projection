#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IPenAndInkSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPenAndInkSettings2
     * @type {Guid}
     */
    static IID => Guid("{3262da53-1f44-55e2-9929-ebf77e5481b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPenHandedness"]

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPenHandedness(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
