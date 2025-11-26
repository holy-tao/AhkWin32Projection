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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "IsVolatile"]

    /**
     * Determines whether the effect needs to be updated.
     * @param {Integer} uiOutputIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin to query.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * When this method returns, contains a value indicating whether the effect needs to be updated.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectprimitiveimpl-isdirty
     */
    IsDirty(uiOutputIndex) {
        result := ComCall(3, this, "uint", uiOutputIndex, "short*", &pfDirty := 0, "int")
        return pfDirty
    }

    /**
     * Determines whether the current effect is considered volatile. If an effect is volatile, the effects framework will not attempt to cache the effect's output.
     * @param {Integer} uiOutputIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin to query.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * When this method returns, contains a value indicating whether the effect is considered volatile.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectprimitiveimpl-isvolatile
     */
    IsVolatile(uiOutputIndex) {
        result := ComCall(4, this, "uint", uiOutputIndex, "short*", &pfVolatile := 0, "HRESULT")
        return pfVolatile
    }
}
