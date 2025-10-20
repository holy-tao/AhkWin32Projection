#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that report the state of a bitmap effect. This interface must be implemented to create third party Windows Presentation Foundation (WPF) bitmap effects.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectprimitiveimpl
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectPrimitiveImpl extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffectPrimitiveImpl
     * @type {Guid}
     */
    static IID => Guid("{ce41e00b-efa6-44e7-b007-dd042e3ae126}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} uiOutputIndex 
     * @param {Pointer<VARIANT_BOOL>} pfDirty 
     * @returns {HRESULT} 
     */
    IsDirty(uiOutputIndex, pfDirty) {
        result := ComCall(3, this, "uint", uiOutputIndex, "ptr", pfDirty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiOutputIndex 
     * @param {Pointer<VARIANT_BOOL>} pfVolatile 
     * @returns {HRESULT} 
     */
    IsVolatile(uiOutputIndex, pfVolatile) {
        result := ComCall(4, this, "uint", uiOutputIndex, "ptr", pfVolatile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
