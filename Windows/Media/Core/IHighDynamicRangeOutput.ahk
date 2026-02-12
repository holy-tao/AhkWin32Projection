#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\Devices\Core\FrameController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IHighDynamicRangeOutput extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHighDynamicRangeOutput
     * @type {Guid}
     */
    static IID => Guid("{0f57806b-253b-4119-bb40-3a90e51384f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Certainty", "get_FrameControllers"]

    /**
     * @type {Float} 
     */
    Certainty {
        get => this.get_Certainty()
    }

    /**
     * @type {IVectorView<FrameController>} 
     */
    FrameControllers {
        get => this.get_FrameControllers()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Certainty() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<FrameController>} 
     */
    get_FrameControllers() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(FrameController, value)
    }
}
