#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3DBaseMaterialGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DCompositeMaterialGroup2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DCompositeMaterialGroup2
     * @type {Guid}
     */
    static IID => Guid("{06e86d62-7d3b-41e1-944c-bafde4555483}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BaseMaterialGroup", "put_BaseMaterialGroup"]

    /**
     * @type {Printing3DBaseMaterialGroup} 
     */
    BaseMaterialGroup {
        get => this.get_BaseMaterialGroup()
        set => this.put_BaseMaterialGroup(value)
    }

    /**
     * 
     * @returns {Printing3DBaseMaterialGroup} 
     */
    get_BaseMaterialGroup() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DBaseMaterialGroup(value)
    }

    /**
     * 
     * @param {Printing3DBaseMaterialGroup} value 
     * @returns {HRESULT} 
     */
    put_BaseMaterialGroup(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
