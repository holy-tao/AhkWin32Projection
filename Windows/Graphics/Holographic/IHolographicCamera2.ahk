#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicCameraViewportParameters.ahk
#Include .\HolographicDisplay.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCamera2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCamera2
     * @type {Guid}
     */
    static IID => Guid("{b55b9f1a-ba8c-4f84-ad79-2e7e1e2450f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LeftViewportParameters", "get_RightViewportParameters", "get_Display"]

    /**
     * @type {HolographicCameraViewportParameters} 
     */
    LeftViewportParameters {
        get => this.get_LeftViewportParameters()
    }

    /**
     * @type {HolographicCameraViewportParameters} 
     */
    RightViewportParameters {
        get => this.get_RightViewportParameters()
    }

    /**
     * @type {HolographicDisplay} 
     */
    Display {
        get => this.get_Display()
    }

    /**
     * 
     * @returns {HolographicCameraViewportParameters} 
     */
    get_LeftViewportParameters() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicCameraViewportParameters(result_)
    }

    /**
     * 
     * @returns {HolographicCameraViewportParameters} 
     */
    get_RightViewportParameters() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicCameraViewportParameters(result_)
    }

    /**
     * 
     * @returns {HolographicDisplay} 
     */
    get_Display() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicDisplay(result_)
    }
}
