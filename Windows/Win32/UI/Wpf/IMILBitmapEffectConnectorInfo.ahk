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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getindex
     */
    GetIndex() {
        result := ComCall(3, this, "uint*", &puiIndex := 0, "HRESULT")
        return puiIndex
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getoptimalformat
     */
    GetOptimalFormat() {
        pFormat := Guid()
        result := ComCall(4, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getnumberformats
     */
    GetNumberFormats() {
        result := ComCall(5, this, "uint*", &pulNumberFormats := 0, "HRESULT")
        return pulNumberFormats
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getformat
     */
    GetFormat(ulIndex) {
        pFormat := Guid()
        result := ComCall(6, this, "uint", ulIndex, "ptr", pFormat, "HRESULT")
        return pFormat
    }
}
