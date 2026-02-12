#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCameraViewportParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCameraViewportParameters
     * @type {Guid}
     */
    static IID => Guid("{80cdf3f7-842a-41e1-93ed-5692ab1fbb10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HiddenAreaMesh", "get_VisibleAreaMesh"]

    /**
     */
    HiddenAreaMesh {
        get => this.get_HiddenAreaMesh()
    }

    /**
     */
    VisibleAreaMesh {
        get => this.get_VisibleAreaMesh()
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_HiddenAreaMesh(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_VisibleAreaMesh(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
