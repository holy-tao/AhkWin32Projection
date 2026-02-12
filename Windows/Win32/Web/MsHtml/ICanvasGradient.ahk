#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ICanvasGradient extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICanvasGradient
     * @type {Guid}
     */
    static IID => Guid("{30510714-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for CanvasGradient
     * @type {Guid}
     */
    static CLSID => Guid("{30510715-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["addColorStop"]

    /**
     * 
     * @param {Float} offset 
     * @param {BSTR} color_ 
     * @returns {HRESULT} 
     */
    addColorStop(offset, color_) {
        if(color_ is String) {
            pin := BSTR.Alloc(color_)
            color_ := pin.Value
        }

        result := ComCall(7, this, "float", offset, "ptr", color_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
