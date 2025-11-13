#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertyBag2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICD3DTextureSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICD3DTextureSource
     * @type {Guid}
     */
    static IID => Guid("{caf65cc4-8ebe-4718-a21f-8dbf40bb7e25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTexture", "GetTransformedTexture", "DoesSupportD3DDeviceType", "GetD3DTextureOptions"]

    /**
     * 
     * @param {IUnknown} pD3DDevice 
     * @param {IPropertyBag2} pID3DTextureOptions 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetTexture(pD3DDevice, pID3DTextureOptions, riid) {
        result := ComCall(3, this, "ptr", pD3DDevice, "ptr", pID3DTextureOptions, "ptr", riid, "ptr*", &ppTexture := 0, "HRESULT")
        return ppTexture
    }

    /**
     * 
     * @param {Pointer<WICRect>} prc 
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Pointer<Guid>} pguidDstFormat 
     * @param {Integer} dstTransform 
     * @param {IUnknown} pD3DDevice 
     * @param {IPropertyBag2} pID3DTextureOptions 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetTransformedTexture(prc, uiWidth, uiHeight, pguidDstFormat, dstTransform, pD3DDevice, pID3DTextureOptions, riid) {
        result := ComCall(4, this, "ptr", prc, "uint", uiWidth, "uint", uiHeight, "ptr", pguidDstFormat, "int", dstTransform, "ptr", pD3DDevice, "ptr", pID3DTextureOptions, "ptr", riid, "ptr*", &ppTexture := 0, "HRESULT")
        return ppTexture
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {BOOL} 
     */
    DoesSupportD3DDeviceType(riid) {
        result := ComCall(5, this, "ptr", riid, "int*", &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }

    /**
     * 
     * @returns {IPropertyBag2} 
     */
    GetD3DTextureOptions() {
        result := ComCall(6, this, "ptr*", &ppID3DTextureOptions := 0, "HRESULT")
        return IPropertyBag2(ppID3DTextureOptions)
    }
}
