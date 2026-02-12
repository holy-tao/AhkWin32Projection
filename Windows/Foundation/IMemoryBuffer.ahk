#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\IMemoryBufferReference.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a reference counted memory buffer.
 * @remarks
 * IMemoryBuffer provides an interoperability protocol between the unmanaged, direct memory access of the native platform and the reference-counted, potentially garbage-collected environment hosting managed objects. The managed type system requires deterministic lifetime for all types. This lifetime is sometimes implicit (value types are copied by value) or explicit (reference types are reference counted). However for performance reasons, code occasionally needs to interact with types that don’t naturally fit into either model.
 * 
 * A common example, and the one addressed by the IMemoryBuffer design, is access to a direct pointer to a block of memory where performance constraints require that the memory is not copied. The IMemoryBuffer abstraction encapsulates such a direct memory pointer within a set of reference counted objects that layer explicit acquisition of the raw memory pointer and allow its deterministic release.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.imemorybuffer
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IMemoryBuffer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemoryBuffer
     * @type {Guid}
     */
    static IID => Guid("{fbc4dd2a-245b-11e4-af98-689423260cf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateReference"]

    /**
     * Returns a new Windows Runtime object that implements the [IMemoryBufferReference](imemorybufferreference.md) interface.
     * @remarks
     * This method always successfully returns a new [IMemoryBufferReference](imemorybufferreference.md) object even after the [IMemoryBuffer](imemorybuffer.md) has been closed. In that case, the returned [IMemoryBufferReference](imemorybufferreference.md) is already closed. Therefore, the [IMemoryBufferReference](imemorybufferreference.md) instance's [Capacity](imemorybufferreference_capacity.md) property will be zero and **IMemoryBufferByteAccess::GetBuffer** method will always return a null memory pointer and zero capacity.
     * @returns {IMemoryBufferReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.imemorybuffer.createreference
     */
    CreateReference() {
        result := ComCall(6, this, "ptr*", &reference_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMemoryBufferReference(reference_)
    }
}
