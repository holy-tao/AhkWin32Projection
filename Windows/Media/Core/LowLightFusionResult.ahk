#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLightFusionResult.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a low-light fusion operation initiated with a call to **FuseAsync**.
 * @remarks
 * Apps should call the **Close** method to clean up the resources allocated for this object.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.lowlightfusionresult
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class LowLightFusionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILowLightFusionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILowLightFusionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the image containing the processed result of the low-light fusion operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.lowlightfusionresult.frame
     * @type {SoftwareBitmap} 
     */
    Frame {
        get => this.get_Frame()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {SoftwareBitmap} 
     */
    get_Frame() {
        if (!this.HasProp("__ILowLightFusionResult")) {
            if ((queryResult := this.QueryInterface(ILowLightFusionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLightFusionResult := ILowLightFusionResult(outPtr)
        }

        return this.__ILowLightFusionResult.get_Frame()
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.lowlightfusionresult.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
