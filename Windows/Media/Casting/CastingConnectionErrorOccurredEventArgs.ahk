#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICastingConnectionErrorOccurredEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents arguments for the [ErrorOccurred](castingconnection_erroroccurred.md) event from the [CastingConnection](castingconnection.md)
 * @remarks
 * Get an instance of this class by handling the [ErrorOccurred](castingconnection_erroroccurred.md) event .
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnectionerroroccurredeventargs
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingConnectionErrorOccurredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICastingConnectionErrorOccurredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICastingConnectionErrorOccurredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the particular error that triggered the casting error event, [ErrorOccurred](castingconnection_erroroccurred.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnectionerroroccurredeventargs.errorstatus
     * @type {Integer} 
     */
    ErrorStatus {
        get => this.get_ErrorStatus()
    }

    /**
     * Gets human-readable message to accompany the error status code, [ErrorStatus](castingconnectionerroroccurredeventargs_errorstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnectionerroroccurredeventargs.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorStatus() {
        if (!this.HasProp("__ICastingConnectionErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(ICastingConnectionErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnectionErrorOccurredEventArgs := ICastingConnectionErrorOccurredEventArgs(outPtr)
        }

        return this.__ICastingConnectionErrorOccurredEventArgs.get_ErrorStatus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__ICastingConnectionErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(ICastingConnectionErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnectionErrorOccurredEventArgs := ICastingConnectionErrorOccurredEventArgs(outPtr)
        }

        return this.__ICastingConnectionErrorOccurredEventArgs.get_Message()
    }

;@endregion Instance Methods
}
