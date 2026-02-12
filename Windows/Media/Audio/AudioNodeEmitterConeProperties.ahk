#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioNodeEmitterConeProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the cone shape used by an [AudioNodeEmitterShape](audionodeemittershape.md). At the inner angle of the cone, audio is not attenuated at all. At the outer angle of the cone, audio is fully attenuated.
 * @remarks
 * Set the audio emitter cone properties by calling [AudioNodeEmitterShape.CreateCone](audionodeemittershape_createcone_1260552697.md). Get an instance of this class by accessing the [AudioNodeEmitterShape.ConeProperties](audionodeemittershape_coneproperties.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterconeproperties
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeEmitterConeProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioNodeEmitterConeProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioNodeEmitterConeProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the inner angle of an audio node emitter cone shape. This is the angle at which the audio is not attenuated at all.
     * @remarks
     * Set the inner angle of an emitter cone shape by calling [AudioNodeEmitterShape.CreateCone](audionodeemittershape_createcone_1260552697.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterconeproperties.innerangle
     * @type {Float} 
     */
    InnerAngle {
        get => this.get_InnerAngle()
    }

    /**
     * Gets the outer angle of a an audio node emitter cone shape, expressed in radians. This is the angle at which the audio is fully attenuated.
     * @remarks
     * Set the outer angle of an emitter cone shape by calling [AudioNodeEmitterShape.CreateCone](audionodeemittershape_createcone_1260552697.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterconeproperties.outerangle
     * @type {Float} 
     */
    OuterAngle {
        get => this.get_OuterAngle()
    }

    /**
     * Gets a value indicating the gain applied at the outer angle of the cone.
     * @remarks
     * Set the outer angle gain of an emitter cone shape by calling [AudioNodeEmitterShape.CreateCone](audionodeemittershape_createcone_1260552697.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterconeproperties.outeranglegain
     * @type {Float} 
     */
    OuterAngleGain {
        get => this.get_OuterAngleGain()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InnerAngle() {
        if (!this.HasProp("__IAudioNodeEmitterConeProperties")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterConeProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterConeProperties := IAudioNodeEmitterConeProperties(outPtr)
        }

        return this.__IAudioNodeEmitterConeProperties.get_InnerAngle()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterAngle() {
        if (!this.HasProp("__IAudioNodeEmitterConeProperties")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterConeProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterConeProperties := IAudioNodeEmitterConeProperties(outPtr)
        }

        return this.__IAudioNodeEmitterConeProperties.get_OuterAngle()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterAngleGain() {
        if (!this.HasProp("__IAudioNodeEmitterConeProperties")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterConeProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterConeProperties := IAudioNodeEmitterConeProperties(outPtr)
        }

        return this.__IAudioNodeEmitterConeProperties.get_OuterAngleGain()
    }

;@endregion Instance Methods
}
