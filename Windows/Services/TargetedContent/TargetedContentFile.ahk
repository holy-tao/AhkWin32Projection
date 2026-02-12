#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the [TargetedContentValue](targetedcontentvalue.md) of the [TargetedContentValueKind](targetedcontentvaluekind.md) of type File.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentfile
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentFile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRandomAccessStreamReference

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRandomAccessStreamReference.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Opens a stream for read-only, random access.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentfile.openreadasync
     */
    OpenReadAsync() {
        if (!this.HasProp("__IRandomAccessStreamReference")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStreamReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStreamReference := IRandomAccessStreamReference(outPtr)
        }

        return this.__IRandomAccessStreamReference.OpenReadAsync()
    }

;@endregion Instance Methods
}
