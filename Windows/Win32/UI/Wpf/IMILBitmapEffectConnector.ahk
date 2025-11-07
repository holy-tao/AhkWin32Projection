#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffect.ahk
#Include .\IMILBitmapEffectConnectorInfo.ahk

/**
 * Exposes methods that define an effect output pin.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectconnector
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectConnector extends IMILBitmapEffectConnectorInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectConnector
     * @type {Guid}
     */
    static IID => Guid("{f59567b3-76c1-4d47-ba1e-79f955e350ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsConnected", "GetBitmapEffect"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnector-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, "short*", &pfConnected := 0, "HRESULT")
        return pfConnected
    }

    /**
     * 
     * @returns {IMILBitmapEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnector-getbitmapeffect
     */
    GetBitmapEffect() {
        result := ComCall(8, this, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffect(ppEffect)
    }
}
