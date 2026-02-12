#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintPageRange extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintPageRange
     * @type {Guid}
     */
    static IID => Guid("{f8a06c54-6e7c-51c5-57fd-0660c2d71513}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FirstPageNumber", "get_LastPageNumber"]

    /**
     * @type {Integer} 
     */
    FirstPageNumber {
        get => this.get_FirstPageNumber()
    }

    /**
     * @type {Integer} 
     */
    LastPageNumber {
        get => this.get_LastPageNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstPageNumber() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastPageNumber() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
