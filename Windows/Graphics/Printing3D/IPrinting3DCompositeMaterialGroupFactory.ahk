#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3DCompositeMaterialGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DCompositeMaterialGroupFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DCompositeMaterialGroupFactory
     * @type {Guid}
     */
    static IID => Guid("{d08ecd13-92ff-43aa-a627-8d43c22c817e}")

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
     * @param {Integer} MaterialGroupId 
     * @returns {Printing3DCompositeMaterialGroup} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(MaterialGroupId) {
        result := ComCall(6, this, "uint", MaterialGroupId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DCompositeMaterialGroup(result_)
    }
}
