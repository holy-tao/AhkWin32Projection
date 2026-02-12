#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IGraphicsCaptureSession3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCaptureSession3
     * @type {Guid}
     */
    static IID => Guid("{f2cdd966-22ae-5ea1-9596-3a289344c3be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBorderRequired", "put_IsBorderRequired"]

    /**
     * @type {Boolean} 
     */
    IsBorderRequired {
        get => this.get_IsBorderRequired()
        set => this.put_IsBorderRequired(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBorderRequired() {
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
    put_IsBorderRequired(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
