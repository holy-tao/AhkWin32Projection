#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\BitmapDescription.ahk
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
     * Copies up to the specified maximum number of bytes from the given offset in the bitmap data into the caller’s buffer (pvBytes), and returns the number of bytes copied.
     * @param {Integer} sourceOffsetInBytes The place in the bitmap data to start copying from, in bytes.
     * @param {Integer} maxBytesToCopy The maximum number of bytes to copy.
     * @param {Pointer<Integer>} pvBytes The buffer into which the bytes are copied.
     * @param {Pointer<Integer>} numberOfBytesCopied The number of bytes copied.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ibitmapdata-copybytesto
     */
    CopyBytesTo(sourceOffsetInBytes, maxBytesToCopy, pvBytes, numberOfBytesCopied) {
        pvBytesMarshal := pvBytes is VarRef ? "char*" : "ptr"
        numberOfBytesCopiedMarshal := numberOfBytesCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", sourceOffsetInBytes, "uint", maxBytesToCopy, pvBytesMarshal, pvBytes, numberOfBytesCopiedMarshal, numberOfBytesCopied, "HRESULT")
        return result
    }

    /**
     * Gets the stride of the data. This is the length in bytes of each row of the bitmap.
     * @returns {Integer} The length in bytes of each row of the bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ibitmapdata-getstride
     */
    GetStride() {
        result := ComCall(4, this, "uint*", &pStride := 0, "HRESULT")
        return pStride
    }

    /**
     * Gets a BitmapDescription that describes the bitmap data stored in the IBitmapData.
     * @returns {BitmapDescription} Information about the bitmap stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ibitmapdata">IBitmapData</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ibitmapdata-getbitmapdescription
     */
    GetBitmapDescription() {
        pBitmapDescription := BitmapDescription()
        result := ComCall(5, this, "ptr", pBitmapDescription, "HRESULT")
        return pBitmapDescription
    }

    /**
     * Gets a BitmapDescription that describes the original format of the bitmap data stored in the IBitmapData.
     * @returns {BitmapDescription} Information about the original format of the  bitmap stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ibitmapdata">IBitmapData</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ibitmapdata-getsourcebitmapdescription
     */
    GetSourceBitmapDescription() {
        pBitmapDescription := BitmapDescription()
        result := ComCall(6, this, "ptr", pBitmapDescription, "HRESULT")
        return pBitmapDescription
    }
}
