#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBuffer.ahk
#Include .\IBufferFactory.ahk
#Include .\IBufferStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a default implementation of the [IBuffer](ibuffer.md) interface and its related interfaces.
 * @remarks
 * For more info, see [Create, write, and read a file](/windows/uwp/files/quickstart-reading-and-writing-files), which shows how to read and write bytes to a file by using a Buffer.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.buffer
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class WinRTBuffer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBuffer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBuffer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} capacity 
     * @returns {WinRTBuffer} 
     */
    static Create(capacity) {
        if (!WinRTBuffer.HasProp("__IBufferFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.WinRTBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBufferFactory.IID)
            WinRTBuffer.__IBufferFactory := IBufferFactory(factoryPtr)
        }

        return WinRTBuffer.__IBufferFactory.Create(capacity)
    }

    /**
     * Creates a new buffer containing a copy of a specified buffer.
     * @param {IMemoryBuffer} input_ The buffer to be copied.
     * @returns {WinRTBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.buffer.createcopyfrommemorybuffer
     */
    static CreateCopyFromMemoryBuffer(input_) {
        if (!WinRTBuffer.HasProp("__IBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.WinRTBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBufferStatics.IID)
            WinRTBuffer.__IBufferStatics := IBufferStatics(factoryPtr)
        }

        return WinRTBuffer.__IBufferStatics.CreateCopyFromMemoryBuffer(input_)
    }

    /**
     * Creates a [MemoryBuffer](../windows.foundation/memorybuffer.md) from an existing [IBuffer](ibuffer.md).
     * @param {IBuffer} input_ The input [IBuffer](ibuffer.md).
     * @returns {MemoryBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.buffer.creatememorybufferoveribuffer
     */
    static CreateMemoryBufferOverIBuffer(input_) {
        if (!WinRTBuffer.HasProp("__IBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.WinRTBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBufferStatics.IID)
            WinRTBuffer.__IBufferStatics := IBufferStatics(factoryPtr)
        }

        return WinRTBuffer.__IBufferStatics.CreateMemoryBufferOverIBuffer(input_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Capacity {
        get => this.get_Capacity()
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
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
    get_Capacity() {
        if (!this.HasProp("__IBuffer")) {
            if ((queryResult := this.QueryInterface(IBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBuffer := IBuffer(outPtr)
        }

        return this.__IBuffer.get_Capacity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__IBuffer")) {
            if ((queryResult := this.QueryInterface(IBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBuffer := IBuffer(outPtr)
        }

        return this.__IBuffer.get_Length()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Length(value) {
        if (!this.HasProp("__IBuffer")) {
            if ((queryResult := this.QueryInterface(IBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBuffer := IBuffer(outPtr)
        }

        return this.__IBuffer.put_Length(value)
    }

;@endregion Instance Methods
}
