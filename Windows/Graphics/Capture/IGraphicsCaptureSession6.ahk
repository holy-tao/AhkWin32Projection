#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IGraphicsCaptureSession6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCaptureSession6
     * @type {Guid}
     */
    static IID => Guid("{d7419236-be20-5e9f-bcd6-c4e98fd6afdc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IncludeSecondaryWindows", "put_IncludeSecondaryWindows"]

    /**
     * @type {Boolean} 
     */
    IncludeSecondaryWindows {
        get => this.get_IncludeSecondaryWindows()
        set => this.put_IncludeSecondaryWindows(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeSecondaryWindows() {
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
    put_IncludeSecondaryWindows(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
