#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents an image associated with a node in the visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/nn-xamlom-ibitmapdata
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class IBitmapData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapData
     * @type {Guid}
     */
    static IID => Guid("{d1a34ef2-cad8-4635-a3d2-fcda8d3f3caf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopyBytesTo", "GetStride", "GetBitmapDescription", "GetSourceBitmapDescription"]

    /**
     * 
     * @param {Integer} sourceOffsetInBytes 
     * @param {Integer} maxBytesToCopy 
     * @param {Pointer<Integer>} pvBytes 
     * @param {Pointer<Integer>} numberOfBytesCopied 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ibitmapdata-copybytesto
     */
    CopyBytesTo(sourceOffsetInBytes, maxBytesToCopy, pvBytes, numberOfBytesCopied) {
        pvBytesMarshal := pvBytes is VarRef ? "char*" : "ptr"
        numberOfBytesCopiedMarshal := numberOfBytesCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", sourceOffsetInBytes, "uint", maxBytesToCopy, pvBytesMarshal, pvBytes, numberOfBytesCopiedMarshal, numberOfBytesCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ibitmapdata-getstride
     */
    GetStride(pStride) {
        pStrideMarshal := pStride is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pStrideMarshal, pStride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BitmapDescription>} pBitmapDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ibitmapdata-getbitmapdescription
     */
    GetBitmapDescription(pBitmapDescription) {
        result := ComCall(5, this, "ptr", pBitmapDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BitmapDescription>} pBitmapDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ibitmapdata-getsourcebitmapdescription
     */
    GetSourceBitmapDescription(pBitmapDescription) {
        result := ComCall(6, this, "ptr", pBitmapDescription, "HRESULT")
        return result
    }
}
