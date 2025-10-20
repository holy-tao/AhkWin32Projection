#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve information about a specific input or output connector pin.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectconnectorinfo
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectConnectorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectConnectorInfo
     * @type {Guid}
     */
    static IID => Guid("{f66d2e4b-b46b-42fc-859e-3da0ecdb3c43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIndex", "GetOptimalFormat", "GetNumberFormats", "GetFormat"]

    /**
     * 
     * @param {Pointer<Integer>} puiIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getindex
     */
    GetIndex(puiIndex) {
        result := ComCall(3, this, "uint*", puiIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getoptimalformat
     */
    GetOptimalFormat(pFormat) {
        result := ComCall(4, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulNumberFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getnumberformats
     */
    GetNumberFormats(pulNumberFormats) {
        result := ComCall(5, this, "uint*", pulNumberFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getformat
     */
    GetFormat(ulIndex, pFormat) {
        result := ComCall(6, this, "uint", ulIndex, "ptr", pFormat, "HRESULT")
        return result
    }
}
