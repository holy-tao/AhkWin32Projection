#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyITADataGenerator.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Creates the PlayReady ITA-specific serialized initialization data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyitadatagenerator
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyITADataGenerator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadyITADataGenerator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadyITADataGenerator.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PlayReadyITADataGenerator](playreadyitadatagenerator.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyITADataGenerator")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Returns a serialized blob of the specified [IPropertySet](../windows.foundation.collections/ipropertyset.md) data that the PlayReady ITA can consume if wrapped in a content protection instantiation format.
     * @remarks
     * The following schema describes the serialized blob that is returned from this method:
     * 
     * 
     * 1. **GUID** – the content protection system **GUID**.
     * 1. **DWORD** – the stream count.
     * 1. **DWORD** – next stream ID.
     * 1. **DWORD** – next stream’s binary data size.
     * 1. **BYTE*** - next stream’s binary data.
     * 1. Repeat steps 3, 4, and 5 for each stream.
     * 
     * 
     * **IPropertySet** may contain any of the following values but must contain at least one of them.
     * 
     * 
     * + The property *N*, where *N* is replaced by the base-10 stream number being decrypted, set to the PlayReady Object corresponding to that stream.
     * + The property  set to a PlayReady Object that will be used for any stream number that was not set using *N* as described above.
     * 
     * 
     * For more information about the serialized blob, see [PlayReadyITADataFormat](playreadyitadataformat.md).
     * @param {Guid} guidCPSystemId The content protection system **GUID**.
     * @param {Integer} countOfStreams The stream count.
     * @param {IPropertySet} configuration The data to be returned as a serialized blob.
     * @param {Integer} format The format for the ITA serialized data.
     * @param {Pointer<Pointer>} dataBytes 
     * @returns {HRESULT} The serialized blob. See Remarks.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyitadatagenerator.generatedata
     */
    GenerateData(guidCPSystemId, countOfStreams, configuration, format, dataBytes) {
        if (!this.HasProp("__IPlayReadyITADataGenerator")) {
            if ((queryResult := this.QueryInterface(IPlayReadyITADataGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyITADataGenerator := IPlayReadyITADataGenerator(outPtr)
        }

        return this.__IPlayReadyITADataGenerator.GenerateData(guidCPSystemId, countOfStreams, configuration, format, dataBytes)
    }

;@endregion Instance Methods
}
