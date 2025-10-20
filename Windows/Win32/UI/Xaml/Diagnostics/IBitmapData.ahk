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
     * 
     * @param {Integer} sourceOffsetInBytes 
     * @param {Integer} maxBytesToCopy 
     * @param {Pointer<Byte>} pvBytes 
     * @param {Pointer<UInt32>} numberOfBytesCopied 
     * @returns {HRESULT} 
     */
    CopyBytesTo(sourceOffsetInBytes, maxBytesToCopy, pvBytes, numberOfBytesCopied) {
        result := ComCall(3, this, "uint", sourceOffsetInBytes, "uint", maxBytesToCopy, "char*", pvBytes, "uint*", numberOfBytesCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pStride 
     * @returns {HRESULT} 
     */
    GetStride(pStride) {
        result := ComCall(4, this, "uint*", pStride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BitmapDescription>} pBitmapDescription 
     * @returns {HRESULT} 
     */
    GetBitmapDescription(pBitmapDescription) {
        result := ComCall(5, this, "ptr", pBitmapDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BitmapDescription>} pBitmapDescription 
     * @returns {HRESULT} 
     */
    GetSourceBitmapDescription(pBitmapDescription) {
        result := ComCall(6, this, "ptr", pBitmapDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
