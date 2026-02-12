#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IKnownUSimFilePathsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownUSimFilePathsStatics
     * @type {Guid}
     */
    static IID => Guid("{7c34e581-1f1b-43f4-9530-8b092d32d71f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EFSpn", "get_EFOpl", "get_EFPnn", "get_Gid1", "get_Gid2"]

    /**
     * @type {IVectorView<Integer>} 
     */
    EFSpn {
        get => this.get_EFSpn()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    EFOpl {
        get => this.get_EFOpl()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    EFPnn {
        get => this.get_EFPnn()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    Gid1 {
        get => this.get_Gid1()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    Gid2 {
        get => this.get_Gid2()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_EFSpn() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_EFOpl() {
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
    get_EFPnn() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_Gid1() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_Gid2() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
