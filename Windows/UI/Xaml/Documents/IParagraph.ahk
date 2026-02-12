#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InlineCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IParagraph extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParagraph
     * @type {Guid}
     */
    static IID => Guid("{f83ef59a-fa61-4bef-ae33-0b0ad756a84d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Inlines", "get_TextIndent", "put_TextIndent"]

    /**
     * @type {InlineCollection} 
     */
    Inlines {
        get => this.get_Inlines()
    }

    /**
     * @type {Float} 
     */
    TextIndent {
        get => this.get_TextIndent()
        set => this.put_TextIndent(value)
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
     * @returns {Float} 
     */
    get_TextIndent() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TextIndent(value) {
        result := ComCall(8, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
