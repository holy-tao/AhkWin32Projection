#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\HolographicCamera.ahk
#Include .\HolographicCameraRenderingParameters.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\HolographicFramePrediction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicFrame
     * @type {Guid}
     */
    static IID => Guid("{c6988eb6-a8b9-3054-a6eb-d624b6536375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AddedCameras", "get_RemovedCameras", "GetRenderingParameters", "get_Duration", "get_CurrentPrediction", "UpdateCurrentPrediction", "PresentUsingCurrentPrediction", "PresentUsingCurrentPredictionWithBehavior", "WaitForFrameToFinish"]

    /**
     * @type {IVectorView<HolographicCamera>} 
     */
    AddedCameras {
        get => this.get_AddedCameras()
    }

    /**
     * @type {IVectorView<HolographicCamera>} 
     */
    RemovedCameras {
        get => this.get_RemovedCameras()
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {HolographicFramePrediction} 
     */
    CurrentPrediction {
        get => this.get_CurrentPrediction()
    }

    /**
     * 
     * @returns {IVectorView<HolographicCamera>} 
     */
    get_AddedCameras() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HolographicCamera, value)
    }

    /**
     * 
     * @returns {IVectorView<HolographicCamera>} 
     */
    get_RemovedCameras() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HolographicCamera, value)
    }

    /**
     * 
     * @param {HolographicCameraPose} cameraPose 
     * @returns {HolographicCameraRenderingParameters} 
     */
    GetRenderingParameters(cameraPose) {
        result := ComCall(8, this, "ptr", cameraPose, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicCameraRenderingParameters(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HolographicFramePrediction} 
     */
    get_CurrentPrediction() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicFramePrediction(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateCurrentPrediction() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    PresentUsingCurrentPrediction() {
        result := ComCall(12, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} waitBehavior 
     * @returns {Integer} 
     */
    PresentUsingCurrentPredictionWithBehavior(waitBehavior) {
        result := ComCall(13, this, "int", waitBehavior, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WaitForFrameToFinish() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
