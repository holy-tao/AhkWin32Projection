#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFilter.ahk

/**
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class IPixelFilter extends IFilter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPixelFilter
     * @type {Guid}
     */
    static IID => Guid("{3d7df9a7-8da6-4fbf-a45b-7592f06d93a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImageInfo", "GetPixelsForImage"]

    /**
     * 
     * @param {Pointer<IMAGE_INFO>} imageInfo 
     * @returns {HRESULT} 
     */
    GetImageInfo(imageInfo) {
        result := ComCall(8, this, "ptr", imageInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pixelBufferLength 
     * @param {Pointer<Pointer<Integer>>} pixelBuffer 
     * @returns {HRESULT} 
     */
    GetPixelsForImage(pixelBufferLength, pixelBuffer) {
        result := ComCall(9, this, "uint*", pixelBufferLength, "ptr*", pixelBuffer, "HRESULT")
        return result
    }
}
