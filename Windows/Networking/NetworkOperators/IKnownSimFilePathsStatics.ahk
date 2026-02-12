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
class IKnownSimFilePathsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownSimFilePathsStatics
     * @type {Guid}
     */
    static IID => Guid("{80cd1a63-37a5-43d3-80a3-ccd23e8fecee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EFOns", "get_EFSpn", "get_Gid1", "get_Gid2"]

    /**
     * @type {IVectorView<Integer>} 
     */
    EFOns {
        get => this.get_EFOns()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    EFSpn {
        get => this.get_EFSpn()
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
    get_EFOns() {
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
    get_EFSpn() {
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
    get_Gid1() {
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
    get_Gid2() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
