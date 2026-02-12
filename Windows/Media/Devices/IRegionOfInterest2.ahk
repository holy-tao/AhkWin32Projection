#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IRegionOfInterest2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegionOfInterest2
     * @type {Guid}
     */
    static IID => Guid("{19fe2a91-73aa-4d51-8a9d-56ccf7db7f54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "put_Type", "get_BoundsNormalized", "put_BoundsNormalized", "get_Weight", "put_Weight"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {Boolean} 
     */
    BoundsNormalized {
        get => this.get_BoundsNormalized()
        set => this.put_BoundsNormalized(value)
    }

    /**
     * @type {Integer} 
     */
    Weight {
        get => this.get_Weight()
        set => this.put_Weight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BoundsNormalized() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BoundsNormalized(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Weight() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Weight(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
