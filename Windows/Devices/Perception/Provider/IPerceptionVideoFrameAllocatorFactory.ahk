#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PerceptionVideoFrameAllocator.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionVideoFrameAllocatorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionVideoFrameAllocatorFactory
     * @type {Guid}
     */
    static IID => Guid("{1a58b0e1-e91a-481e-b876-a89e2bbc6b33}")

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
     * @param {Integer} maxOutstandingFrameCountForWrite 
     * @param {Integer} format 
     * @param {SIZE} resolution 
     * @param {Integer} alpha 
     * @returns {PerceptionVideoFrameAllocator} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(maxOutstandingFrameCountForWrite, format, resolution, alpha) {
        result := ComCall(6, this, "uint", maxOutstandingFrameCountForWrite, "int", format, "ptr", resolution, "int", alpha, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionVideoFrameAllocator(result_)
    }
}
