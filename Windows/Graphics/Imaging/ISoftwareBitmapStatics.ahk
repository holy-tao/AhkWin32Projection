#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SoftwareBitmap.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class ISoftwareBitmapStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISoftwareBitmapStatics
     * @type {Guid}
     */
    static IID => Guid("{df0385db-672f-4a9d-806e-c2442f343e86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Copy", "Convert", "ConvertWithAlpha", "CreateCopyFromBuffer", "CreateCopyWithAlphaFromBuffer", "CreateCopyFromSurfaceAsync", "CreateCopyWithAlphaFromSurfaceAsync"]

    /**
     * Describes the four steps to take to copy and paste a formula from one cell into another using CTRL+C and CTRL+V.
     * @param {SoftwareBitmap} source 
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/copy-and-paste-a-formula-from-one-cell-into-another
     */
    Copy(source) {
        result := ComCall(6, this, "ptr", source, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }

    /**
     * Report Builder prompts you to convert some custom report items, which have unsupported features, to the new report definition format.
     * @param {SoftwareBitmap} source 
     * @param {Integer} format 
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/sql/ocs/docs/reporting-services/report-builder/convert-cri-dialog-box-report-builder
     */
    Convert(source, format) {
        result := ComCall(7, this, "ptr", source, "int", format, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }

    /**
     * Report Builder prompts you to convert some custom report items, which have unsupported features, to the new report definition format.
     * @param {SoftwareBitmap} source 
     * @param {Integer} format 
     * @param {Integer} alpha 
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/sql/ocs/docs/reporting-services/report-builder/convert-cri-dialog-box-report-builder
     */
    ConvertWithAlpha(source, format, alpha) {
        result := ComCall(8, this, "ptr", source, "int", format, "int", alpha, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }

    /**
     * 
     * @param {IBuffer} source 
     * @param {Integer} format 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {SoftwareBitmap} 
     */
    CreateCopyFromBuffer(source, format, width, height) {
        result := ComCall(9, this, "ptr", source, "int", format, "int", width, "int", height, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }

    /**
     * 
     * @param {IBuffer} source 
     * @param {Integer} format 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} alpha 
     * @returns {SoftwareBitmap} 
     */
    CreateCopyWithAlphaFromBuffer(source, format, width, height, alpha) {
        result := ComCall(10, this, "ptr", source, "int", format, "int", width, "int", height, "int", alpha, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }

    /**
     * 
     * @param {IDirect3DSurface} surface 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     */
    CreateCopyFromSurfaceAsync(surface) {
        result := ComCall(11, this, "ptr", surface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SoftwareBitmap, value)
    }

    /**
     * 
     * @param {IDirect3DSurface} surface 
     * @param {Integer} alpha 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     */
    CreateCopyWithAlphaFromSurfaceAsync(surface, alpha) {
        result := ComCall(12, this, "ptr", surface, "int", alpha, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SoftwareBitmap, value)
    }
}
