#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SymbolIcon.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISymbolIconFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISymbolIconFactory
     * @type {Guid}
     */
    static IID => Guid("{c7252b88-e76c-4b44-8a05-046b9dc772b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithSymbol"]

    /**
     * 
     * @param {Integer} symbol_ 
     * @returns {SymbolIcon} 
     */
    CreateInstanceWithSymbol(symbol_) {
        result := ComCall(6, this, "int", symbol_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SymbolIcon(value)
    }
}
