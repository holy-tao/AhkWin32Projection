#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\HolographicCameraPose.ahk
#Include ..\..\Perception\PerceptionTimestamp.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicFramePrediction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicFramePrediction
     * @type {Guid}
     */
    static IID => Guid("{520f4de1-5c0a-4e79-a81e-6abe02bb2739}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CameraPoses", "get_Timestamp"]

    /**
     * @type {IVectorView<HolographicCameraPose>} 
     */
    CameraPoses {
        get => this.get_CameraPoses()
    }

    /**
     * @type {PerceptionTimestamp} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {IVectorView<HolographicCameraPose>} 
     */
    get_CameraPoses() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HolographicCameraPose, value)
    }

    /**
     * 
     * @returns {PerceptionTimestamp} 
     */
    get_Timestamp() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionTimestamp(value)
    }
}
