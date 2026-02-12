#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IGraphicsCaptureSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCaptureSession
     * @type {Guid}
     */
    static IID => Guid("{814e42a9-f70f-4ad7-939b-fddcc6eb880d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartCapture"]

    /**
     * 
     * @returns {HRESULT} 
     */
    StartCapture() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
