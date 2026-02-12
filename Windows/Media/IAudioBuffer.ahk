#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IAudioBuffer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioBuffer
     * @type {Guid}
     */
    static IID => Guid("{35175827-724b-4c6a-b130-f6537f9ae0d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Capacity", "get_Length", "put_Length"]

    /**
     * @type {Integer} 
     */
    Capacity {
        get => this.get_Capacity()
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capacity() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
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
    put_Length(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
