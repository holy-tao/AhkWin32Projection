#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\OcrLine.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Ocr
 * @version WindowsRuntime 1.4
 */
class IOcrResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOcrResult
     * @type {Guid}
     */
    static IID => Guid("{9bd235b2-175b-3d6a-92e2-388c206e2f63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Lines", "get_TextAngle", "get_Text"]

    /**
     * @type {IVectorView<OcrLine>} 
     */
    Lines {
        get => this.get_Lines()
    }

    /**
     * @type {IReference<Float>} 
     */
    TextAngle {
        get => this.get_TextAngle()
    }

    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * 
     * @returns {IVectorView<OcrLine>} 
     */
    get_Lines() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(OcrLine, value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_TextAngle() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
