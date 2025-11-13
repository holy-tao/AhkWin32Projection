#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IWICBitmapToneMapper.ahk
#Include .\IWICImagingFactory2.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging.D2D
 * @version v4.0.30319
 */
class IWICImagingFactory3 extends IWICImagingFactory2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICImagingFactory3
     * @type {Guid}
     */
    static IID => Guid("{489b3d8b-624a-4258-b678-7eece70f299d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBitmapToneMapper"]

    /**
     * 
     * @returns {IWICBitmapToneMapper} 
     */
    CreateBitmapToneMapper() {
        result := ComCall(29, this, "ptr*", &ppToneMapper := 0, "HRESULT")
        return IWICBitmapToneMapper(ppToneMapper)
    }
}
