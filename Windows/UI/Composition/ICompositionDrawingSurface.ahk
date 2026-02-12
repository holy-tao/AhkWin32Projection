#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Native interoperation interface that allows drawing on a surface object using a RECT to define the area to draw into. This interface is available in C++ only.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionDrawingSurface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionDrawingSurface
     * @type {Guid}
     */
    static IID => Guid("{a166c300-fad0-4d11-9e67-e433162ff49e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlphaMode", "get_PixelFormat", "get_Size"]

    /**
     * @type {Integer} 
     */
    AlphaMode {
        get => this.get_AlphaMode()
    }

    /**
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
    }

    /**
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlphaMode() {
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
    get_PixelFormat() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        value := SIZE()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
