#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportSession2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportSession2
     * @type {Guid}
     */
    static IID => Guid("{2a526710-3ec6-469d-a375-2b9f4785391e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_SubfolderDateFormat", "get_SubfolderDateFormat", "put_RememberDeselectedItems", "get_RememberDeselectedItems"]

    /**
     * @type {Integer} 
     */
    SubfolderDateFormat {
        get => this.get_SubfolderDateFormat()
        set => this.put_SubfolderDateFormat(value)
    }

    /**
     * @type {Boolean} 
     */
    RememberDeselectedItems {
        get => this.get_RememberDeselectedItems()
        set => this.put_RememberDeselectedItems(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SubfolderDateFormat(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubfolderDateFormat() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RememberDeselectedItems(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RememberDeselectedItems() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
