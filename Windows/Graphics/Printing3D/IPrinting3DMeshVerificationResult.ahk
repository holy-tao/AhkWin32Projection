#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DMeshVerificationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DMeshVerificationResult
     * @type {Guid}
     */
    static IID => Guid("{195671ba-e93a-4e8a-a46f-dea8e852197e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsValid", "get_NonmanifoldTriangles", "get_ReversedNormalTriangles"]

    /**
     * @type {Boolean} 
     */
    IsValid {
        get => this.get_IsValid()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    NonmanifoldTriangles {
        get => this.get_NonmanifoldTriangles()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    ReversedNormalTriangles {
        get => this.get_ReversedNormalTriangles()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsValid() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_NonmanifoldTriangles() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ReversedNormalTriangles() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
