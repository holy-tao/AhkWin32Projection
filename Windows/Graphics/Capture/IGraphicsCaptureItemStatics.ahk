#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GraphicsCaptureItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IGraphicsCaptureItemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCaptureItemStatics
     * @type {Guid}
     */
    static IID => Guid("{a87ebea5-457c-5788-ab47-0cf1d3637e74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromVisual"]

    /**
     * 
     * @param {Visual} visual_ 
     * @returns {GraphicsCaptureItem} 
     */
    CreateFromVisual(visual_) {
        result := ComCall(6, this, "ptr", visual_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GraphicsCaptureItem(result_)
    }
}
