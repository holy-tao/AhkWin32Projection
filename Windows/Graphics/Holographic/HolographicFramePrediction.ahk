#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicFramePrediction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the poses for each holographic camera at the time that they're predicted to be displayed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframeprediction
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFramePrediction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicFramePrediction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicFramePrediction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the camera poses that correspond with the time specified by Timestamp.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframeprediction.cameraposes
     * @type {IVectorView<HolographicCameraPose>} 
     */
    CameraPoses {
        get => this.get_CameraPoses()
    }

    /**
     * Gets the time when the camera poses are predicted to be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframeprediction.timestamp
     * @type {PerceptionTimestamp} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HolographicCameraPose>} 
     */
    get_CameraPoses() {
        if (!this.HasProp("__IHolographicFramePrediction")) {
            if ((queryResult := this.QueryInterface(IHolographicFramePrediction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFramePrediction := IHolographicFramePrediction(outPtr)
        }

        return this.__IHolographicFramePrediction.get_CameraPoses()
    }

    /**
     * 
     * @returns {PerceptionTimestamp} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IHolographicFramePrediction")) {
            if ((queryResult := this.QueryInterface(IHolographicFramePrediction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFramePrediction := IHolographicFramePrediction(outPtr)
        }

        return this.__IHolographicFramePrediction.get_Timestamp()
    }

;@endregion Instance Methods
}
