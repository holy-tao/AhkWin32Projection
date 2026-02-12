#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayScanout.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayDevice2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayDevice2
     * @type {Guid}
     */
    static IID => Guid("{3fefe50c-0940-54bd-a02f-f9c7a536ad60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSimpleScanoutWithDirtyRectsAndOptions"]

    /**
     * 
     * @param {DisplaySource} source 
     * @param {DisplaySurface} surface 
     * @param {Integer} subresourceIndex 
     * @param {Integer} syncInterval 
     * @param {IIterable<RectInt32>} dirtyRects 
     * @param {Integer} options 
     * @returns {DisplayScanout} 
     */
    CreateSimpleScanoutWithDirtyRectsAndOptions(source, surface, subresourceIndex, syncInterval, dirtyRects, options) {
        result := ComCall(6, this, "ptr", source, "ptr", surface, "uint", subresourceIndex, "uint", syncInterval, "ptr", dirtyRects, "uint", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayScanout(result_)
    }
}
