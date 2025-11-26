#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffectOutputConnector.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an interior output connector.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectinterioroutputconnector
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectInteriorOutputConnector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectInteriorOutputConnector
     * @type {Guid}
     */
    static IID => Guid("{00bbb6dc-acc9-4bfc-b344-8bee383dfefa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutputConnector"]

    /**
     * Gets the IMILBitmapEffectOutputConnector associated with the interior output connector.
     * @returns {IMILBitmapEffectOutputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>**</b>
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectinterioroutputconnector-getoutputconnector
     */
    GetOutputConnector() {
        result := ComCall(3, this, "ptr*", &pOutputConnector := 0, "HRESULT")
        return IMILBitmapEffectOutputConnector(pOutputConnector)
    }
}
