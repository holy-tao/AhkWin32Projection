#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Input\PointerPoint.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class IPointerEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerEventArgs
     * @type {Guid}
     */
    static IID => Guid("{920d9cb1-a5fc-4a21-8c09-49dfe6ffe25f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentPoint", "get_KeyModifiers", "GetIntermediatePoints"]

    /**
     * @type {PointerPoint} 
     */
    CurrentPoint {
        get => this.get_CurrentPoint()
    }

    /**
     * @type {Integer} 
     */
    KeyModifiers {
        get => this.get_KeyModifiers()
    }

    /**
     * 
     * @returns {PointerPoint} 
     */
    get_CurrentPoint() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerPoint(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyModifiers() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<PointerPoint>} 
     */
    GetIntermediatePoints() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(PointerPoint, value)
    }
}
