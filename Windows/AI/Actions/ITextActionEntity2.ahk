#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ITextActionEntity2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextActionEntity2
     * @type {Guid}
     */
    static IID => Guid("{7c500889-cf08-51e7-beca-f0bbc7a7486c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextFormat"]

    /**
     * @type {Integer} 
     */
    TextFormat {
        get => this.get_TextFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextFormat() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
