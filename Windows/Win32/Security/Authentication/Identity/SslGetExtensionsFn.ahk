#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SslGetExtensionsFn extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Integer>} clientHello 
     * @param {Integer} clientHelloByteSize 
     * @param {Pointer<SCH_EXTENSION_DATA>} genericExtensions 
     * @param {Integer} genericExtensionsCount 
     * @param {Integer} flags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(clientHello, clientHelloByteSize, genericExtensions, genericExtensionsCount, flags) {
        clientHelloMarshal := clientHello is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, clientHelloMarshal, clientHello, "uint", clientHelloByteSize, "ptr", genericExtensions, "char", genericExtensionsCount, "uint*", &bytesToRead := 0, "int", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bytesToRead
    }
}
