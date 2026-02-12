#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PointCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IPolyBezierSegment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPolyBezierSegment
     * @type {Guid}
     */
    static IID => Guid("{36805271-38c4-4bcf-96cd-028a6d38af25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Points", "put_Points"]

    /**
     * @type {PointCollection} 
     */
    Points {
        get => this.get_Points()
        set => this.put_Points(value)
    }

    /**
     * 
     * @returns {PointCollection} 
     */
    get_Points() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointCollection(value)
    }

    /**
     * 
     * @param {PointCollection} value 
     * @returns {HRESULT} 
     */
    put_Points(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
