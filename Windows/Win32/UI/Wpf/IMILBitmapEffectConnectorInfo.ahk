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
     * Retrieves the zero based index value for the pin.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this method returns, contains the zero based index value for the pin.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getindex
     */
    GetIndex() {
        result := ComCall(3, this, "uint*", &puiIndex := 0, "HRESULT")
        return puiIndex
    }

    /**
     * Retrieves the optimal pixel format for the pin.
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * When this method returns, contains the optimal pixel format for the pin.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getoptimalformat
     */
    GetOptimalFormat() {
        pFormat := Guid()
        result := ComCall(4, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * Retrieves the number of pixel formats supported by the pin.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this method returns, contains the number of pixel formats supported by the pin.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getnumberformats
     */
    GetNumberFormats() {
        result := ComCall(5, this, "uint*", &pulNumberFormats := 0, "HRESULT")
        return pulNumberFormats
    }

    /**
     * Retrieves the pixel format for the given pin.
     * @param {Integer} ulIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the pin to retrieve the pixel format.
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * When this method returns, contains the pixel format of the given pin.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getformat
     */
    GetFormat(ulIndex) {
        pFormat := Guid()
        result := ComCall(6, this, "uint", ulIndex, "ptr", pFormat, "HRESULT")
        return pFormat
    }
}
