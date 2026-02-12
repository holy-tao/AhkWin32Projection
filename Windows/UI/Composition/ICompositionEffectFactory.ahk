#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionEffectBrush.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionEffectFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionEffectFactory
     * @type {Guid}
     */
    static IID => Guid("{be5624af-ba7e-4510-9850-41c0b4ff74df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBrush", "get_ExtendedError", "get_LoadStatus"]

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * @type {Integer} 
     */
    LoadStatus {
        get => this.get_LoadStatus()
    }

    /**
     * The CreateBrushIndirect function creates a logical brush that has the specified style, color, and pattern.
     * @remarks
     * A brush is a bitmap that the system uses to paint the interiors of filled shapes.
     * 
     * After an application creates a brush by calling <b>CreateBrushIndirect</b>, it can select it into any device context by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-selectobject">SelectObject</a> function.
     * 
     * A brush created by using a monochrome bitmap (one color plane, one bit per pixel) is drawn using the current text and background colors. Pixels represented by a bit set to 0 are drawn with the current text color; pixels represented by a bit set to 1 are drawn with the current background color.
     * 
     * When you no longer need the brush, call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function to delete it.
     * 
     * <b>ICM:</b> No color is done at brush creation. However, color management is performed when the brush is selected into an ICM-enabled device context.
     * @returns {CompositionEffectBrush} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-createbrushindirect
     */
    CreateBrush() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionEffectBrush(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LoadStatus() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
