#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindow2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindow2
     * @type {Guid}
     */
    static IID => Guid("{7c2b1b85-6917-4361-9c02-0d9e3a420b95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PointerPosition"]

    /**
     * @type {HRESULT} 
     */
    PointerPosition {
        set => this.put_PointerPosition(value)
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_PointerPosition(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
