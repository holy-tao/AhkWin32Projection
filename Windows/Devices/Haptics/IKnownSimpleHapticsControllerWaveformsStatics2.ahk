#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Haptics
 * @version WindowsRuntime 1.4
 */
class IKnownSimpleHapticsControllerWaveformsStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownSimpleHapticsControllerWaveformsStatics2
     * @type {Guid}
     */
    static IID => Guid("{a7d24c27-b79d-510a-bf79-ff6d49173e1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BrushContinuous", "get_ChiselMarkerContinuous", "get_EraserContinuous", "get_Error", "get_GalaxyPenContinuous", "get_Hover", "get_InkContinuous", "get_MarkerContinuous", "get_PencilContinuous", "get_Success"]

    /**
     * @type {Integer} 
     */
    BrushContinuous {
        get => this.get_BrushContinuous()
    }

    /**
     * @type {Integer} 
     */
    ChiselMarkerContinuous {
        get => this.get_ChiselMarkerContinuous()
    }

    /**
     * @type {Integer} 
     */
    EraserContinuous {
        get => this.get_EraserContinuous()
    }

    /**
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * @type {Integer} 
     */
    GalaxyPenContinuous {
        get => this.get_GalaxyPenContinuous()
    }

    /**
     * @type {Integer} 
     */
    Hover {
        get => this.get_Hover()
    }

    /**
     * @type {Integer} 
     */
    InkContinuous {
        get => this.get_InkContinuous()
    }

    /**
     * @type {Integer} 
     */
    MarkerContinuous {
        get => this.get_MarkerContinuous()
    }

    /**
     * @type {Integer} 
     */
    PencilContinuous {
        get => this.get_PencilContinuous()
    }

    /**
     * @type {Integer} 
     */
    Success {
        get => this.get_Success()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BrushContinuous() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChiselMarkerContinuous() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EraserContinuous() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GalaxyPenContinuous() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hover() {
        result := ComCall(11, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InkContinuous() {
        result := ComCall(12, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MarkerContinuous() {
        result := ComCall(13, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PencilContinuous() {
        result := ComCall(14, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Success() {
        result := ComCall(15, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
