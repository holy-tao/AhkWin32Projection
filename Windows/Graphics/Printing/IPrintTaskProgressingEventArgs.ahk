#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTaskProgressingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskProgressingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{810cd3cb-b410-4282-a073-5ac378234174}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DocumentPageCount"]

    /**
     * @type {Integer} 
     */
    DocumentPageCount {
        get => this.get_DocumentPageCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DocumentPageCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
