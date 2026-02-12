#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\MemoryBuffer.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IMemoryBufferFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemoryBufferFactory
     * @type {Guid}
     */
    static IID => Guid("{fbc4dd2b-245b-11e4-af98-689423260cf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {Integer} capacity 
     * @returns {MemoryBuffer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(capacity) {
        result := ComCall(6, this, "uint", capacity, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MemoryBuffer(value)
    }
}
