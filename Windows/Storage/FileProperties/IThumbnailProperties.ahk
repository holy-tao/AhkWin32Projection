#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class IThumbnailProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailProperties
     * @type {Guid}
     */
    static IID => Guid("{693dd42f-dbe7-49b5-b3b3-2893ac5d3423}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OriginalWidth", "get_OriginalHeight", "get_ReturnedSmallerCachedSize", "get_Type"]

    /**
     * @type {Integer} 
     */
    OriginalWidth {
        get => this.get_OriginalWidth()
    }

    /**
     * @type {Integer} 
     */
    OriginalHeight {
        get => this.get_OriginalHeight()
    }

    /**
     * @type {Boolean} 
     */
    ReturnedSmallerCachedSize {
        get => this.get_ReturnedSmallerCachedSize()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginalWidth() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginalHeight() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReturnedSmallerCachedSize() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
