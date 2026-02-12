#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Core\CoreCursor.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInkIndependentInputSource2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInkIndependentInputSource2
     * @type {Guid}
     */
    static IID => Guid("{2846b012-0b59-5bb9-a3c5-becb7cf03a33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerCursor", "put_PointerCursor"]

    /**
     * @type {CoreCursor} 
     */
    PointerCursor {
        get => this.get_PointerCursor()
        set => this.put_PointerCursor(value)
    }

    /**
     * 
     * @returns {CoreCursor} 
     */
    get_PointerCursor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreCursor(value)
    }

    /**
     * 
     * @param {CoreCursor} value 
     * @returns {HRESULT} 
     */
    put_PointerCursor(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
