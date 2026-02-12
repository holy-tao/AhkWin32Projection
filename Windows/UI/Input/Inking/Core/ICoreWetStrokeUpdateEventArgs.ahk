#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include ..\InkPoint.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWetStrokeUpdateEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWetStrokeUpdateEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fb07d14c-3380-457a-a987-991357896c1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NewInkPoints", "get_PointerId", "get_Disposition", "put_Disposition"]

    /**
     * @type {IVector<InkPoint>} 
     */
    NewInkPoints {
        get => this.get_NewInkPoints()
    }

    /**
     * @type {Integer} 
     */
    PointerId {
        get => this.get_PointerId()
    }

    /**
     * @type {Integer} 
     */
    Disposition {
        get => this.get_Disposition()
        set => this.put_Disposition(value)
    }

    /**
     * 
     * @returns {IVector<InkPoint>} 
     */
    get_NewInkPoints() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(InkPoint, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerId() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Disposition() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_Disposition(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
