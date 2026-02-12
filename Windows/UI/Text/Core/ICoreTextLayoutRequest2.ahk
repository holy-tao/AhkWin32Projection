#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CoreTextLayoutBounds.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class ICoreTextLayoutRequest2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreTextLayoutRequest2
     * @type {Guid}
     */
    static IID => Guid("{676de624-cd3d-4bcd-bf01-7f7110954511}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LayoutBoundsVisualPixels"]

    /**
     * @type {CoreTextLayoutBounds} 
     */
    LayoutBoundsVisualPixels {
        get => this.get_LayoutBoundsVisualPixels()
    }

    /**
     * 
     * @returns {CoreTextLayoutBounds} 
     */
    get_LayoutBoundsVisualPixels() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreTextLayoutBounds(value)
    }
}
