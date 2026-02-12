#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WinRTBuffer.ahk
#Include ..\..\Foundation\MemoryBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IBufferStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBufferStatics
     * @type {Guid}
     */
    static IID => Guid("{e901e65b-d716-475a-a90a-af7229b1e741}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCopyFromMemoryBuffer", "CreateMemoryBufferOverIBuffer"]

    /**
     * 
     * @param {IMemoryBuffer} input_ 
     * @returns {WinRTBuffer} 
     */
    CreateCopyFromMemoryBuffer(input_) {
        result := ComCall(6, this, "ptr", input_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Buffer(value)
    }

    /**
     * 
     * @param {IBuffer} input_ 
     * @returns {MemoryBuffer} 
     */
    CreateMemoryBufferOverIBuffer(input_) {
        result := ComCall(7, this, "ptr", input_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MemoryBuffer(value)
    }
}
