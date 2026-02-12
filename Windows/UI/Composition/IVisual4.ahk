#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IVisual4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisual4
     * @type {Guid}
     */
    static IID => Guid("{9476bf11-e24b-5bf9-9ebe-6274109b2711}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPixelSnappingEnabled", "put_IsPixelSnappingEnabled"]

    /**
     * @type {Boolean} 
     */
    IsPixelSnappingEnabled {
        get => this.get_IsPixelSnappingEnabled()
        set => this.put_IsPixelSnappingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPixelSnappingEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsPixelSnappingEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
