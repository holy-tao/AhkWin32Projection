#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMemoryBuffer.ahk
#Include .\IClosable.ahk
#Include .\IMemoryBufferFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a reference counted memory buffer.
 * @remarks
 * This type also implements the COM interface [**IMemoryBufferByteAccess**](/windows/win32/winrt/imemorybufferbyteaccess-getbuffer), which provides direct access to the buffer's storage. See the [Custom Effect sample](https://github.com/microsoft/Windows-universal-samples/blob/main/Samples/AudioCreation/cs/CustomEffect/CustomEffect.cs) for a C# example on how to access the buffer.
 * 
 * > [!NOTE]
 * > C++/WinRT provides extension methods on `MemoryBuffer` to access the data directly. Various languages and runtimes provide unique ways to access process memory. Be careful when accessing the buffer as the lifecycle of the memory is related to the lifecycle of the `IMemoryBufferByteAccess` interface.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.memorybuffer
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class MemoryBuffer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMemoryBuffer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMemoryBuffer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new [MemoryBuffer](memorybuffer.md) instance with the specified capacity.
     * @param {Integer} capacity The desired size of the new memory buffer.
     * @returns {MemoryBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.memorybuffer.#ctor
     */
    static Create(capacity) {
        if (!MemoryBuffer.HasProp("__IMemoryBufferFactory")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.MemoryBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryBufferFactory.IID)
            MemoryBuffer.__IMemoryBufferFactory := IMemoryBufferFactory(factoryPtr)
        }

        return MemoryBuffer.__IMemoryBufferFactory.Create(capacity)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Returns a new managed object that implements the [IMemoryBufferReference](imemorybufferreference.md) interface.
     * @remarks
     * This method always successfully returns a new [IMemoryBufferReference](imemorybufferreference.md) object even after the [IMemoryBuffer](imemorybuffer.md) has been closed. In that case, the returned [IMemoryBufferReference](imemorybufferreference.md) is already closed. Therefore, the [IMemoryBufferReference](imemorybufferreference.md) instance's [Capacity](imemorybufferreference_capacity.md) property will be zero and **IMemoryBufferByteAccess::GetBuffer** method will always return a null memory pointer and zero capacity.
     * @returns {IMemoryBufferReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.memorybuffer.createreference
     */
    CreateReference() {
        if (!this.HasProp("__IMemoryBuffer")) {
            if ((queryResult := this.QueryInterface(IMemoryBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMemoryBuffer := IMemoryBuffer(outPtr)
        }

        return this.__IMemoryBuffer.CreateReference()
    }

    /**
     * Disconnects this [MemoryBuffer](memorybuffer.md) object from the actual memory buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.memorybuffer.close
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
