#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCamera4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCamera4
     * @type {Guid}
     */
    static IID => Guid("{9a2531d6-4723-4f39-a9a5-9d05181d9b44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanOverrideViewport"]

    /**
     * @type {Boolean} 
     */
    CanOverrideViewport {
        get => this.get_CanOverrideViewport()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanOverrideViewport() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
