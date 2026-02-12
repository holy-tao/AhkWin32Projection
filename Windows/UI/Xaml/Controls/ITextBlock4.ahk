#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Composition\CompositionBrush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBlock4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBlock4
     * @type {Guid}
     */
    static IID => Guid("{b014f270-9808-4adc-b452-60cda54100c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAlphaMask"]

    /**
     * 
     * @returns {CompositionBrush} 
     */
    GetAlphaMask() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionBrush(result_)
    }
}
