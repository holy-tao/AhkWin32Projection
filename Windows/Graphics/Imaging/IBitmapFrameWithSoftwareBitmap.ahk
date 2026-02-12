#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SoftwareBitmap.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods for obtaining a [SoftwareBitmap](softwarebitmap.md) representation of an [BitmapFrame](bitmapframe.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframewithsoftwarebitmap
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapFrameWithSoftwareBitmap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapFrameWithSoftwareBitmap
     * @type {Guid}
     */
    static IID => Guid("{fe287c9a-420c-4963-87ad-691436e08383}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSoftwareBitmapAsync", "GetSoftwareBitmapConvertedAsync", "GetSoftwareBitmapTransformedAsync"]

    /**
     * Asynchronously retrieves a SoftwareBitmap representation of an [BitmapFrame](bitmapframe.md).
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframewithsoftwarebitmap.getsoftwarebitmapasync
     */
    GetSoftwareBitmapAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SoftwareBitmap, value)
    }

    /**
     * Asynchronously retrieves a SoftwareBitmap representation of an [BitmapFrame](bitmapframe.md).
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframewithsoftwarebitmap.getsoftwarebitmapasync
     */
    GetSoftwareBitmapConvertedAsync(pixelFormat, alphaMode) {
        result := ComCall(7, this, "int", pixelFormat, "int", alphaMode, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SoftwareBitmap, value)
    }

    /**
     * Asynchronously retrieves a SoftwareBitmap representation of an [BitmapFrame](bitmapframe.md).
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {BitmapTransform} transform_ 
     * @param {Integer} exifOrientationMode_ 
     * @param {Integer} colorManagementMode_ 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframewithsoftwarebitmap.getsoftwarebitmapasync
     */
    GetSoftwareBitmapTransformedAsync(pixelFormat, alphaMode, transform_, exifOrientationMode_, colorManagementMode_) {
        result := ComCall(8, this, "int", pixelFormat, "int", alphaMode, "ptr", transform_, "int", exifOrientationMode_, "int", colorManagementMode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SoftwareBitmap, value)
    }
}
