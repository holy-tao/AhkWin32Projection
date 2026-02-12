#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SolidColorBrush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ISolidColorBrushFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISolidColorBrushFactory
     * @type {Guid}
     */
    static IID => Guid("{d935ce0c-86f5-4da6-8a27-b1619ef7f92b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithColor"]

    /**
     * 
     * @param {Color} color_ 
     * @returns {SolidColorBrush} 
     */
    CreateInstanceWithColor(color_) {
        result := ComCall(6, this, "ptr", color_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SolidColorBrush(value)
    }
}
