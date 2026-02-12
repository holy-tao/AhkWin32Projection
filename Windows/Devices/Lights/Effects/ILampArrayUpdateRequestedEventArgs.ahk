#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class ILampArrayUpdateRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampArrayUpdateRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{73560d6a-576a-48af-8539-67ffa0ab3516}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SinceStarted", "SetColor", "SetColorForIndex", "SetSingleColorForIndices", "SetColorsForIndices"]

    /**
     * @type {TimeSpan} 
     */
    SinceStarted {
        get => this.get_SinceStarted()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SinceStarted() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The SetColorAdjustment function sets the color adjustment values for a device context (DC) using the specified values.
     * @remarks
     * The color adjustment values are used to adjust the input color of the source bitmap for calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchblt">StretchBlt</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> functions when HALFTONE mode is set.
     * @param {Color} desiredColor 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-setcoloradjustment
     */
    SetColor(desiredColor) {
        result := ComCall(7, this, "ptr", desiredColor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lampIndex 
     * @param {Color} desiredColor 
     * @returns {HRESULT} 
     */
    SetColorForIndex(lampIndex, desiredColor) {
        result := ComCall(8, this, "int", lampIndex, "ptr", desiredColor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Color} desiredColor 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {HRESULT} 
     */
    SetSingleColorForIndices(desiredColor, lampIndexes_length, lampIndexes) {
        lampIndexesMarshal := lampIndexes is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", desiredColor, "uint", lampIndexes_length, lampIndexesMarshal, lampIndexes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} desiredColors_length 
     * @param {Pointer<Color>} desiredColors 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {HRESULT} 
     */
    SetColorsForIndices(desiredColors_length, desiredColors, lampIndexes_length, lampIndexes) {
        lampIndexesMarshal := lampIndexes is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "uint", desiredColors_length, "ptr", desiredColors, "uint", lampIndexes_length, lampIndexesMarshal, lampIndexes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
