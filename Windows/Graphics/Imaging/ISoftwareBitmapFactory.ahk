#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SoftwareBitmap.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class ISoftwareBitmapFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISoftwareBitmapFactory
     * @type {Guid}
     */
    static IID => Guid("{c99feb69-2d62-4d47-a6b3-4fdb6a07fdf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithAlpha"]

    /**
     * Create Extended Stored Procedures
     * @param {Integer} format 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(format, width, height) {
        result := ComCall(6, this, "int", format, "int", width, "int", height, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} alpha 
     * @returns {SoftwareBitmap} 
     */
    CreateWithAlpha(format, width, height, alpha) {
        result := ComCall(7, this, "int", format, "int", width, "int", height, "int", alpha, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }
}
