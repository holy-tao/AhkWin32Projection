#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffect.ahk
#Include .\IMILBitmapEffectRenderContext.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used to create Windows Presentation Foundation (WPF) Microsoft Win32 bitmap effect objects.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectfactory
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectFactory
     * @type {Guid}
     */
    static IID => Guid("{33a9df34-a403-4ec7-b07e-bc0682370845}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEffect", "CreateContext", "CreateEffectOuter"]

    /**
     * 
     * @param {Pointer<Guid>} pguidEffect 
     * @returns {IMILBitmapEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectfactory-createeffect
     */
    CreateEffect(pguidEffect) {
        result := ComCall(3, this, "ptr", pguidEffect, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffect(ppEffect)
    }

    /**
     * Creates a recognizer context.
     * @returns {IMILBitmapEffectRenderContext} 
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-createcontext
     */
    CreateContext() {
        result := ComCall(4, this, "ptr*", &ppContext := 0, "HRESULT")
        return IMILBitmapEffectRenderContext(ppContext)
    }

    /**
     * 
     * @returns {IMILBitmapEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectfactory-createeffectouter
     */
    CreateEffectOuter() {
        result := ComCall(5, this, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffect(ppEffect)
    }
}
