#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\VideoFrame.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IVideoFrameFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoFrameFactory
     * @type {Guid}
     */
    static IID => Guid("{014b6d69-2228-4c92-92ff-50c380d3e776}")

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
     * @returns {VideoFrame} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(format, width, height) {
        result := ComCall(6, this, "int", format, "int", width, "int", height, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} alpha 
     * @returns {VideoFrame} 
     */
    CreateWithAlpha(format, width, height, alpha) {
        result := ComCall(7, this, "int", format, "int", width, "int", height, "int", alpha, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }
}
