#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTexture extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionTexture
     * @type {Guid}
     */
    static IID => Guid("{929bb1aa-725f-433b-abd7-273075a835f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSourceRect", "SetColorSpace", "SetAlphaMode", "GetAvailableFence"]

    /**
     * 
     * @param {Pointer<D2D_RECT_U>} sourceRect 
     * @returns {HRESULT} 
     */
    SetSourceRect(sourceRect) {
        result := ComCall(3, this, "ptr", sourceRect, "HRESULT")
        return result
    }

    /**
     * The SetColorSpace function defines the input color space for a given device context.
     * @param {Integer} colorSpace 
     * @returns {HRESULT} If this function succeeds, the return value is a handle to the <i>hColorSpace</i> being replaced.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setcolorspace
     */
    SetColorSpace(colorSpace) {
        result := ComCall(4, this, "int", colorSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} alphaMode 
     * @returns {HRESULT} 
     */
    SetAlphaMode(alphaMode) {
        result := ComCall(5, this, "int", alphaMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} fenceValue 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} availableFence 
     * @returns {HRESULT} 
     */
    GetAvailableFence(fenceValue, iid, availableFence) {
        result := ComCall(6, this, "uint*", fenceValue, "ptr", iid, "ptr*", availableFence, "HRESULT")
        return result
    }
}
