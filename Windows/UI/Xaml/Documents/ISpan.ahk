#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InlineCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ISpan extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpan
     * @type {Guid}
     */
    static IID => Guid("{9839d4a9-02af-4811-aa15-6bef3acac97a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Inlines", "put_Inlines"]

    /**
     * @type {InlineCollection} 
     */
    Inlines {
        get => this.get_Inlines()
        set => this.put_Inlines(value)
    }

    /**
     * 
     * @returns {InlineCollection} 
     */
    get_Inlines() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InlineCollection(value)
    }

    /**
     * 
     * @param {InlineCollection} value 
     * @returns {HRESULT} 
     */
    put_Inlines(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
