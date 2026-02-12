#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameSourceInfo3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameSourceInfo3
     * @type {Guid}
     */
    static IID => Guid("{ca824ab6-66ea-5885-a2b6-26c0eeec3c7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRelativePanel"]

    /**
     * 
     * @param {DisplayRegion} displayRegion_ 
     * @returns {Integer} 
     */
    GetRelativePanel(displayRegion_) {
        result := ComCall(6, this, "ptr", displayRegion_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
