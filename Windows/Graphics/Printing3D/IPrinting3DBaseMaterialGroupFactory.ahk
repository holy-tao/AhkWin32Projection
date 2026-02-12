#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3DBaseMaterialGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DBaseMaterialGroupFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DBaseMaterialGroupFactory
     * @type {Guid}
     */
    static IID => Guid("{5c1546dc-8697-4193-976b-84bb4116e5bf}")

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
     * @returns {Printing3DBaseMaterialGroup} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(MaterialGroupId) {
        result := ComCall(6, this, "uint", MaterialGroupId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DBaseMaterialGroup(result_)
    }
}
