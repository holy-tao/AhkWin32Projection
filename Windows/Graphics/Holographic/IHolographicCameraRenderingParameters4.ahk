#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCameraRenderingParameters4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCameraRenderingParameters4
     * @type {Guid}
     */
    static IID => Guid("{0878fa4c-e163-57dc-82b7-c406ab3e0537}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DepthReprojectionMethod", "put_DepthReprojectionMethod"]

    /**
     * @type {Integer} 
     */
    DepthReprojectionMethod {
        get => this.get_DepthReprojectionMethod()
        set => this.put_DepthReprojectionMethod(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DepthReprojectionMethod() {
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
    put_DepthReprojectionMethod(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
