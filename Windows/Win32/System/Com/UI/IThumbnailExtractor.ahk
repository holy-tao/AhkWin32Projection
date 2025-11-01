#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.UI
 * @version v4.0.30319
 */
class IThumbnailExtractor extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ExtractThumbnail", "OnFileUpdated"]

    /**
     * 
     * @param {IStorage} pStg 
     * @param {Integer} ulLength 
     * @param {Integer} ulHeight 
     * @param {Pointer<Integer>} pulOutputLength 
     * @param {Pointer<Integer>} pulOutputHeight 
     * @param {Pointer<HBITMAP>} phOutputBitmap 
     * @returns {HRESULT} 
     */
    ExtractThumbnail(pStg, ulLength, ulHeight, pulOutputLength, pulOutputHeight, phOutputBitmap) {
        pulOutputLengthMarshal := pulOutputLength is VarRef ? "uint*" : "ptr"
        pulOutputHeightMarshal := pulOutputHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pStg, "uint", ulLength, "uint", ulHeight, pulOutputLengthMarshal, pulOutputLength, pulOutputHeightMarshal, pulOutputHeight, "ptr", phOutputBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStorage} pStg 
     * @returns {HRESULT} 
     */
    OnFileUpdated(pStg) {
        result := ComCall(4, this, "ptr", pStg, "HRESULT")
        return result
    }
}
