#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.UI
 * @version v4.0.30319
 */
class IThumbnailExtractor extends IUnknown{
    /**
     * The interface identifier for IThumbnailExtractor
     * @type {Guid}
     */
    static IID => Guid("{969dc708-5c76-11d1-8d86-0000f804b057}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IStorage>} pStg 
     * @param {Integer} ulLength 
     * @param {Integer} ulHeight 
     * @param {Pointer<UInt32>} pulOutputLength 
     * @param {Pointer<UInt32>} pulOutputHeight 
     * @param {Pointer<HBITMAP>} phOutputBitmap 
     * @returns {HRESULT} 
     */
    ExtractThumbnail(pStg, ulLength, ulHeight, pulOutputLength, pulOutputHeight, phOutputBitmap) {
        result := ComCall(3, this, "ptr", pStg, "uint", ulLength, "uint", ulHeight, "uint*", pulOutputLength, "uint*", pulOutputHeight, "ptr", phOutputBitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStorage>} pStg 
     * @returns {HRESULT} 
     */
    OnFileUpdated(pStg) {
        result := ComCall(4, this, "ptr", pStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
