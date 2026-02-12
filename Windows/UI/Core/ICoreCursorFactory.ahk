#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreCursor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreCursorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreCursorFactory
     * @type {Guid}
     */
    static IID => Guid("{f6359621-a79d-4ed3-8c32-a9ef9d6b76a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCursor"]

    /**
     * Creates a cursor having the specified size, bit patterns, and hot spot.
     * @remarks
     * The <i>nWidth</i> and <i>nHeight</i> parameters must specify a width and height that are supported by the current display driver, because the system cannot create cursors of other sizes. To determine the width and height supported by the display driver, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> function, specifying the <b>SM_CXCURSOR</b> or <b>SM_CYCURSOR</b> value. 
     * 
     * Before closing, an application must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroycursor">DestroyCursor</a> function to free any system resources associated with the cursor.
     * 
     * <h3><a id="DPI_Virtualization"></a><a id="dpi_virtualization"></a><a id="DPI_VIRTUALIZATION"></a>DPI Virtualization</h3>
     * This API does not participate in DPI virtualization. The output returned is in terms of physical coordinates, and  is not affected by the DPI of the calling thread. Note that the cursor created may still be scaled to match the DPI of any given window it is drawn into.
     * @param {Integer} type 
     * @param {Integer} id 
     * @returns {CoreCursor} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-createcursor
     */
    CreateCursor(type, id) {
        result := ComCall(6, this, "int", type, "uint", id, "ptr*", &cursor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreCursor(cursor)
    }
}
