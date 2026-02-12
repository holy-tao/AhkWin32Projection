#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GazePointPreview.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class IGazeMovedPreviewEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGazeMovedPreviewEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e79e7eeb-b389-11e7-b201-c8d3ffb75721}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Handled", "put_Handled", "get_CurrentPoint", "GetIntermediatePoints"]

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * @type {GazePointPreview} 
     */
    CurrentPoint {
        get => this.get_CurrentPoint()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
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
    put_Handled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {GazePointPreview} 
     */
    get_CurrentPoint() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GazePointPreview(value)
    }

    /**
     * 
     * @returns {IVector<GazePointPreview>} 
     */
    GetIntermediatePoints() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(GazePointPreview, result_)
    }
}
