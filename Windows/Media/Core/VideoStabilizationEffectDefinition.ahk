#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\Effects\IVideoEffectDefinition.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the definition of a video stabilization effect.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffectdefinition
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class VideoStabilizationEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoEffectDefinition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string containing the activatable class ID of the video stabilization effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the set of properties for configuring the [VideoStabilizationEffectDefinition](videostabilizationeffectdefinition.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffectdefinition.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [VideoStabilizationEffectDefinition](videostabilizationeffectdefinition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.VideoStabilizationEffectDefinition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivatableClassId() {
        if (!this.HasProp("__IVideoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEffectDefinition := IVideoEffectDefinition(outPtr)
        }

        return this.__IVideoEffectDefinition.get_ActivatableClassId()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IVideoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEffectDefinition := IVideoEffectDefinition(outPtr)
        }

        return this.__IVideoEffectDefinition.get_Properties()
    }

;@endregion Instance Methods
}
