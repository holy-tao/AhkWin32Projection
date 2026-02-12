#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPartialMediaFailureDetectedEventArgs.ahk
#Include .\IPartialMediaFailureDetectedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PartialMediaFailureDetected](../windows.ui.xaml.controls/mediaelement_partialmediafailuredetected.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.partialmediafailuredetectedeventargs
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PartialMediaFailureDetectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPartialMediaFailureDetectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPartialMediaFailureDetectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the stream that failed to decode contains audio or video.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.partialmediafailuredetectedeventargs.streamkind
     * @type {Integer} 
     */
    StreamKind {
        get => this.get_StreamKind()
    }

    /**
     * Gets error info for the media failure.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.partialmediafailuredetectedeventargs.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PartialMediaFailureDetectedEventArgs](partialmediafailuredetectedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PartialMediaFailureDetectedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StreamKind() {
        if (!this.HasProp("__IPartialMediaFailureDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPartialMediaFailureDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPartialMediaFailureDetectedEventArgs := IPartialMediaFailureDetectedEventArgs(outPtr)
        }

        return this.__IPartialMediaFailureDetectedEventArgs.get_StreamKind()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IPartialMediaFailureDetectedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPartialMediaFailureDetectedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPartialMediaFailureDetectedEventArgs2 := IPartialMediaFailureDetectedEventArgs2(outPtr)
        }

        return this.__IPartialMediaFailureDetectedEventArgs2.get_ExtendedError()
    }

;@endregion Instance Methods
}
