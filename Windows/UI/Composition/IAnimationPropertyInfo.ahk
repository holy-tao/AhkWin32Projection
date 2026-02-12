#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IAnimationPropertyInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnimationPropertyInfo
     * @type {Guid}
     */
    static IID => Guid("{f4716f05-ed77-4e3c-b328-5c3985b3738f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccessMode", "put_AccessMode"]

    /**
     * @type {Integer} 
     */
    AccessMode {
        get => this.get_AccessMode()
        set => this.put_AccessMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AccessMode() {
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
    put_AccessMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
